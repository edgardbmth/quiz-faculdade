-- ============================================================================
-- EQUIPE: Dev Duel
-- SGBD: PostgreSQL
-- JUSTIFICATIVA: Escolhido por sua robustez, suporte completo a restrições
--                de integridade referencial, e aderência ao padrão ANSI SQL.
-- CONTRATO COM WEB: Nomes e tabelas em minúsculo, no singular, sem acentuação.
-- ============================================================================

BEGIN;

-- Criando tabelas
CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE publicador (
    id_publicador SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE idioma (
    codigo_idioma VARCHAR(10) PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE fonte (
    id_fonte SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    url VARCHAR(500) NOT NULL UNIQUE,
    id_publicador INTEGER NOT NULL REFERENCES publicador(id_publicador),
    codigo_idioma VARCHAR(10) NOT NULL REFERENCES idioma(codigo_idioma)
);

CREATE TABLE alternativa (
    id_alternativa SERIAL PRIMARY KEY,
    rotulo VARCHAR(50) NOT NULL,
    valor_logico BOOLEAN NOT NULL
);

CREATE TABLE pergunta (
    id_pergunta SERIAL PRIMARY KEY,
    codigo_fact VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    enunciado TEXT NOT NULL,
    explicacao TEXT NOT NULL,
    id_categoria INTEGER NOT NULL REFERENCES categoria(id_categoria),
    id_fonte INTEGER NOT NULL REFERENCES fonte(id_fonte),
    id_alternativa_correta INTEGER NOT NULL REFERENCES alternativa(id_alternativa)
);

-- Carga do Domínio Fixo (Idiomas e Alternativas)
INSERT INTO idioma (codigo_idioma, descricao) VALUES
('pt-BR', 'Português (Brasil)'),
('en-US', 'Inglês (Estados Unidos)');

INSERT INTO alternativa (id_alternativa, rotulo, valor_logico) VALUES
(1, 'Certo', TRUE),
(2, 'Errado', FALSE);

COMMIT;