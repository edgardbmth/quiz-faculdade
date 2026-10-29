-- ============================================================================
-- EQUIPE: Dev Duel
-- SCRIPT DE CARGA (DML) E CONSULTAS - Compatível com o DDL de 5 Tabelas
-- SGBD: PostgreSQL
-- ============================================================================

BEGIN;

-- ============================================================================
-- 1. CARGA DE DADOS (DML)
-- ============================================================================

-- Inserir Categorias
INSERT INTO categorias (id, nome) VALUES 
(1, 'Redes de Computadores'),
(2, 'Banco de Dados');

-- Inserir Perguntas (Com fontes integradas diretamente)
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES 
(1, 2, 'Em um banco de dados relacional, uma tabela pode ter múltiplas chaves primárias.', 'Conceito fundamental de modelagem relacional.', 'Uma tabela relacional pode ter apenas uma chave primária, embora ela possa ser composta por mais de uma coluna.', 'Guia de Referência SQL', 'https://www.postgresql.org/docs/manual/'),

(2, 2, 'A cláusula WHERE no comando SQL SELECT é utilizada para filtrar linhas antes do agrupamento por GROUP BY.', 'Operações de agregação e filtragem em SQL.', 'Correto. O WHERE filtra os registros individuais antes da agregação feita pelo GROUP BY.', 'Guia de Referência SQL', 'https://www.postgresql.org/docs/manual/'),

(3, 1, 'A camada de Transporte do modelo OSI é responsável pelo roteamento dos pacotes na rede.', 'Estudo das arquiteturas de redes de computadores e camadas OSI.', 'Errado. O roteamento de pacotes é responsabilidade da camada de Rede (Camada 3).', 'Redes de Computadores - Tanenbaum', 'https://www.pearson.com/redes'),

(4, 1, 'O protocolo TCP é orientado à conexão e garante a entrega ordenada dos pacotes.', 'Funcionamento dos protocolos de transporte.', 'Correto. O TCP provê controle de fluxo, retransmissão e garantia de ordem.', 'Redes de Computadores - Tanenbaum', 'https://www.pearson.com/redes');

-- Inserir Opções / Alternativas (Certo / Errado para cada pergunta)
INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES 
-- Pergunta 1 (Gabarito: Errado)
(1, 'Certo', FALSE),
(1, 'Errado', TRUE),

-- Pergunta 2 (Gabarito: Certo)
(2, 'Certo', TRUE),
(2, 'Errado', FALSE),

-- Pergunta 3 (Gabarito: Errado)
(3, 'Certo', FALSE),
(3, 'Errado', TRUE),

-- Pergunta 4 (Gabarito: Certo)
(4, 'Certo', TRUE),
(4, 'Errado', FALSE);

COMMIT;


-- ============================================================================
-- 2. CONSULTAS DE TESTE (RA01 a RA07 adaptadas)
-- ============================================================================

-- RA01: Listar as categorias em ordem alfabética, com a quantidade de perguntas.
SELECT c.nome AS categoria, COUNT(p.id) AS quantidade_perguntas
FROM categorias c
LEFT JOIN perguntas p ON c.id = p.categoria_id
GROUP BY c.id, c.nome
ORDER BY c.nome ASC;


-- RA02a: Sortear uma pergunta de qualquer categoria.
SELECT id, enunciado, fonte_nome, fonte_url 
FROM perguntas 
ORDER BY RANDOM() 
LIMIT 1;


-- RA02b: Sortear uma pergunta de uma categoria escolhida por parâmetro (ex: 'Banco de Dados').
SELECT p.id, p.enunciado, p.explicacao
FROM perguntas p
JOIN categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Banco de Dados'
ORDER BY RANDOM() 
LIMIT 1;


-- RA03: Exibir enunciado da pergunta e as suas opções/alternativas.
SELECT p.enunciado, o.texto_opcao, o.eh_correta
FROM perguntas p
JOIN opcoes o ON p.id = o.pergunta_id
WHERE p.id = 1;


-- RA04: Verificar se a opção escolhida pelo utilizador é a correta.
-- (Exemplo: Verificar se a opção com id 2 na pergunta 1 está correta)
SELECT 
    p.id AS pergunta_id,
    o.texto_opcao AS opcao_escolhida,
    CASE 
        WHEN o.eh_correta = TRUE THEN 'ACERTOU'
        ELSE 'ERROU'
    END AS resultado
FROM perguntas p
JOIN opcoes o ON p.id = o.pergunta_id
WHERE p.id = 1 AND o.id = 2;


-- RA05: Exibir a explicação detalhada e a fonte oficial de uma pergunta.
SELECT 
    id,
    enunciado,
    explicacao,
    fonte_nome,
    fonte_url
FROM perguntas
WHERE id = 1;


-- RA06: Listar categorias ordenadas pela quantidade de perguntas (do maior para o menor).
SELECT c.nome AS categoria, COUNT(p.id) AS quantidade_perguntas
FROM categorias c
JOIN perguntas p ON c.id = p.categoria_id
GROUP BY c.id, c.nome
ORDER BY quantidade_perguntas DESC;


-- RA07: Simular o registo de uma pontuação e consultar o ranking.
-- Inserir utilizador e pontuação de teste:
INSERT INTO usuarios (id, nome) VALUES (1, 'Higor (Jogador)');
INSERT INTO pontuacoes (usuario_id, pontos) VALUES (1, 350);

-- Consultar o Ranking Geral:
SELECT 
    u.nome AS jogador,
    p.pontos,
    p.data_sessao
FROM pontuacoes p
JOIN usuarios u ON p.usuario_id = u.id
ORDER BY p.pontos DESC;
