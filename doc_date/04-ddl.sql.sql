-- ============================================================
-- SCRIPT DE CRIAÇÃO (DDL) - DEV DUEL (TECH TRIVIA)
-- SGBD: PostgreSQL
-- ============================================================

BEGIN;

-- Tabela de Categorias (Temas da Tecnologia)
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de Perguntas
CREATE TABLE perguntas (
    id SERIAL PRIMARY KEY,
    categoria_id INT NOT NULL REFERENCES categorias(id) ON DELETE CASCADE,
    enunciado TEXT NOT NULL,
    contexto TEXT,
    explicacao TEXT NOT NULL,
    fonte_nome VARCHAR(150) NOT NULL,
    fonte_url TEXT NOT NULL
);

-- Tabela de Opções/Alternativas (Com indicação de resposta correta)
CREATE TABLE opcoes (
    id SERIAL PRIMARY KEY,
    pergunta_id INT NOT NULL REFERENCES perguntas(id) ON DELETE CASCADE,
    texto_opcao VARCHAR(50) NOT NULL,
    eh_correta BOOLEAN NOT NULL DEFAULT FALSE
);

-- Tabela de Usuários (Para apoio ao fluxo do jogador)
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Pontuações (Para apoio ao ranking da sessão)
CREATE TABLE pontuacoes (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    pontos INT NOT NULL,
    data_sessao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMIT;
