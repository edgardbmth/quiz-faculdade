-- ============================================================================
-- EQUIPE: Dev Duel
-- SCRIPT DE CARGA E CONSULTAS (M4)
-- ============================================================================

BEGIN;

-- 1. CARGA DML MÍNIMA

-- Categorias
INSERT INTO categoria (nome) VALUES 
('Redes de Computadores'),
('Banco de Dados');

-- Publicadores (Bancas Examinadoras / Editoras)
INSERT INTO publicador (nome) VALUES 
('Banca CESPE/Cebraspe'),
('Editora Pearson');

-- Fontes (1 URL citada por pelo menos 2 perguntas)
INSERT INTO fonte (titulo, url, id_publicador, codigo_idioma) VALUES 
('Guia de Referência SQL', 'https://www.postgresql.org/docs/manual/', 1, 'pt-BR'),
('Redes de Computadores - Tanenbaum', 'https://www.pearson.com/redes', 2, 'pt-BR');

-- Perguntas (6 no mínimo, com fact-001 a fact-006, cobrindo Certo e Errado)
INSERT INTO pergunta (codigo_fact, titulo, enunciado, explicacao, id_categoria, id_fonte, id_alternativa_correta) VALUES 
('fact-001', 'Chave Primária SQL', 'Em um banco de dados relacional, uma tabela pode ter múltiplas chaves primárias.', 'Uma tabela relacional pode ter apenas uma chave primária, embora ela possa ser composta por mais de uma coluna.', 2, 1, 2), -- Gabarito: Errado (id_alternativa 2)

('fact-002', 'Cláusula WHERE', 'A cláusula WHERE no comando SQL SELECT é utilizada para filtrar linhas antes do agrupamento por GROUP BY.', 'Correto. O WHERE filtra os registros antes da agregação feita pelo GROUP BY.', 2, 1, 1), -- Gabarito: Certo (id_alternativa 1)

('fact-003', 'Modelo OSI', 'A camada de Transporte do modelo OSI é responsável pelo roteamento dos pacotes na rede.', 'Errado. O roteamento de pacotes é responsabilidade da camada de Rede (Camada 3).', 1, 2, 2), -- Gabarito: Errado (id_alternativa 2)

('fact-004', 'Protocolo TCP', 'O protocolo TCP é orientado à conexão e garante a entrega ordenada dos pacotes.', 'Correto. O TCP provê controle de fluxo, retransmissão e garantia de ordem.', 1, 2, 1), -- Gabarito: Certo (id_alternativa 1)

('fact-005', 'Comando TRUNCATE', 'O comando TRUNCATE TABLE remove todas as linhas de uma tabela sem registrar individualmente a exclusão das linhas no log.', 'Correto. O TRUNCATE é uma operação DDL mais rápida que o DELETE sem WHERE.', 2, 1, 1), -- Gabarito: Certo (id_alternativa 1)

('fact-006', 'Mascara de Sub-rede', 'O endereço IPv4 possui 128 bits de comprimento.', 'Errado. O IPv4 possui 32 bits. O IPv6 é que possui 128 bits.', 1, 2, 2); -- Gabarito: Errado (id_alternativa 2)

COMMIT;

-- ============================================================================
-- CONSULTAS (RA01 a RA07)
-- ============================================================================

-- RA01: Listar as categorias em ordem alfabética, com a quantidade de perguntas.
SELECT c.nome AS categoria, COUNT(p.id_pergunta) AS quantidade_perguntas
FROM categoria c
LEFT JOIN pergunta p ON c.id_categoria = p.id_categoria
GROUP BY c.nome
ORDER BY c.nome ASC;
/* RESULTADO ESPERADO:
     categoria         | quantidade_perguntas 
-----------------------+----------------------
 Banco de Dados        |                    3
 Redes de Computadores |                    3
*/


-- RA02a: Sortear uma pergunta de qualquer categoria.
SELECT id_pergunta, codigo_fact, titulo, enunciado 
FROM pergunta 
ORDER BY RANDOM() 
LIMIT 1;
/* RESULTADO ESPERADO (Exemplo sorteado id_pergunta = 1):
 id_pergunta | codigo_fact |     titulo       |                              enunciado                               
-------------+-------------+------------------+----------------------------------------------------------------------
           1 | fact-001    | Chave Primaria   | Em um banco de dados relacional, uma tabela pode ter multiplas...
*/


-- RA02b: Sortear uma pergunta de uma categoria escolhida por parâmetro (ex: 'Banco de Dados').
SELECT p.id_pergunta, p.codigo_fact, p.titulo, p.enunciado 
FROM pergunta p
JOIN categoria c ON p.id_categoria = c.id_categoria
WHERE c.nome = 'Banco de Dados'
ORDER BY RANDOM() 
LIMIT 1;
/* RESULTADO ESPERADO (Exemplo sorteado id_pergunta = 2):
 id_pergunta | codigo_fact |     titulo      |                             enunciado                              
-------------+-------------+-----------------+--------------------------------------------------------------------
           2 | fact-002    | Cláusula WHERE  | A cláusula WHERE no comando SQL SELECT é utilizada para filtrar...
*/


-- RA03: Exibir título, enunciado e as alternativas.
SELECT p.titulo, p.enunciado, a.rotulo AS alternativa
FROM pergunta p
CROSS JOIN alternativa a
WHERE p.codigo_fact = 'fact-001';
/* RESULTADO ESPERADO:
     titulo         |                              enunciado                               | alternativa 
--------------------+----------------------------------------------------------------------+-------------
 Chave Primária SQL | Em um banco de dados relacional, uma tabela pode ter múltiplas...    | Certo
 Chave Primária SQL | Em um banco de dados relacional, uma tabela pode ter múltiplas...    | Errado
*/


-- RA04: Dizer se a alternativa escolhida é a correta.
-- Teste A: Pergunta fact-001 (Correta: Errado - id 2) -> Usuário escolheu alternativa 2 ('Errado')
SELECT 
    p.codigo_fact,
    a_escolhida.rotulo AS alternativa_escolhida,
    CASE 
        WHEN p.id_alternativa_correta = 2 THEN 'ACERTOU'
        ELSE 'ERROU'
    END AS resultado
FROM pergunta p
JOIN alternativa a_escolhida ON a_escolhida.id_alternativa = 2
WHERE p.codigo_fact = 'fact-001';
/* RESULTADO ESPERADO:
 codigo_fact | alternativa_escolhida | resultado 
-------------+-----------------------+-----------
 fact-001    | Errado                | ACERTOU
*/

-- Teste B: Pergunta fact-001 -> Usuário escolheu alternativa 1 ('Certo')
SELECT 
    p.codigo_fact,
    a_escolhida.rotulo AS alternativa_escolhida,
    CASE 
        WHEN p.id_alternativa_correta = 1 THEN 'ACERTOU'
        ELSE 'ERROU'
    END AS resultado
FROM pergunta p
JOIN alternativa a_escolhida ON a_escolhida.id_alternativa = 1
WHERE p.codigo_fact = 'fact-001';
/* RESULTADO ESPERADO:
 codigo_fact | alternativa_escolhida | resultado 
-------------+-----------------------+-----------
 fact-001    | Certo                 | ERROU
*/


-- RA05: Exibir a explicação e a fonte completa: título, publicador, URL e idioma.
SELECT 
    p.codigo_fact,
    p.explicacao,
    f.titulo AS fonte_titulo,
    pub.nome AS publicador,
    f.url,
    i.descricao AS idioma
FROM pergunta p
JOIN fonte f ON p.id_fonte = f.id_fonte
JOIN publicador pub ON f.id_publicador = pub.id_publicador
JOIN idioma i ON f.codigo_idioma = i.codigo_idioma
WHERE p.codigo_fact = 'fact-001';
/* RESULTADO ESPERADO:
 codigo_fact |                              explicacao                               |      fonte_titulo      |     publicador     |                 url                  |      idioma       
-------------+-----------------------------------------------------------------------+------------------------+--------------------+--------------------------------------+-------------------
 fact-001    | Uma tabela relacional pode ter apenas uma chave primária, embora...   | Guia de Referência SQL | Banca CESPE/Cebraspe | https://www.postgresql.org/docs/manual/ | Português (Brasil)
*/


-- RA06: Listar os publicadores mais citados, com o número de perguntas.
SELECT pub.nome AS publicador, COUNT(p.id_pergunta) AS quantidade_perguntas
FROM publicador pub
JOIN fonte f ON pub.id_publicador = f.id_publicador
JOIN pergunta p ON f.id_fonte = p.id_fonte
GROUP BY pub.nome
ORDER BY quantidade_perguntas DESC;
/* RESULTADO ESPERADO:
     publicador     | quantidade_perguntas 
--------------------+----------------------
 Banca CESPE/Cebraspe |                    3
 Editora Pearson     |                    3
*/


-- RA07: Listar as fontes citadas por mais de uma pergunta.
SELECT f.titulo, f.url, COUNT(p.id_pergunta) AS quantidade_perguntas
FROM fonte f
JOIN pergunta p ON f.id_fonte = p.id_fonte
GROUP BY f.id_fonte, f.titulo, f.url
HAVING COUNT(p.id_pergunta) > 1;
/* RESULTADO ESPERADO:
              titulo               |                 url                  | quantidade_perguntas 
-----------------------------------+--------------------------------------+----------------------
 Guia de Referência SQL            | https://www.postgresql.org/docs/manual/ |                    3
 Redes de Computadores - Tanenbaum | https://www.pearson.com/redes        |                    3
*/