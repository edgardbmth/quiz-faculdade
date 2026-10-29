-- ============================================================================
-- EQUIPE: Dev Duel
-- SCRIPT DE CONSULTAS DE TESTE (RA01 a RA07) - PostgreSQL
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
-- 1. Inserir utilizador e pontuação de teste (com prevenção de duplicados):
INSERT INTO usuarios (id, nome) VALUES (1, 'Higor (Jogador)') ON CONFLICT (id) DO NOTHING;
INSERT INTO pontuacoes (usuario_id, pontos) VALUES (1, 350);

-- 2. Consultar o Ranking Geral ordenado pelos maiores pontos:
SELECT 
    u.nome AS jogador,
    p.pontos,
    p.data_sessao
FROM pontuacoes p
JOIN usuarios u ON p.usuario_id = u.id
ORDER BY p.pontos DESC;
