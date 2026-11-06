-- ============================================================================
-- EQUIPE: Dev Duel
-- SCRIPT DE CARGA DE DADOS (DML) - Compatível com o DDL de 5 Tabelas
-- SGBD: PostgreSQL
-- ============================================================================

BEGIN;

-- 1. Inserir Categorias
INSERT INTO categorias (id, nome) VALUES 
(1, 'Redes de Computadores'),
(2, 'Banco de Dados');

-- 2. Inserir Perguntas (Com fontes integradas diretamente)
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES 
(1, 2, 'Em um banco de dados relacional, uma tabela pode ter múltiplas chaves primárias.', 'Conceito fundamental de modelagem relacional.', 'Uma tabela relacional pode ter apenas uma chave primária, embora ela possa ser composta por mais de uma coluna.', 'Guia de Referência SQL', 'https://www.postgresql.org/docs/manual/'),

(2, 2, 'A cláusula WHERE no comando SQL SELECT é utilizada para filtrar linhas antes do agrupamento por GROUP BY.', 'Operações de agregação e filtragem em SQL.', 'Correto. O WHERE filtra os registros individuais antes da agregação feita pelo GROUP BY.', 'Guia de Referência SQL', 'https://www.postgresql.org/docs/manual/'),

(3, 1, 'A camada de Transporte do modelo OSI é responsável pelo roteamento dos pacotes na rede.', 'Estudo das arquiteturas de redes de computadores e camadas OSI.', 'Errado. O roteamento de pacotes é responsabilidade da camada de Rede (Camada 3).', 'Redes de Computadores - Tanenbaum', 'https://www.pearson.com/redes'),

(4, 1, 'O protocolo TCP é orientado à conexão e garante a entrega ordenada dos pacotes.', 'Funcionamento dos protocolos de transporte.', 'Correto. O TCP provê controle de fluxo, retransmissão e garantia de ordem.', 'Redes de Computadores - Tanenbaum', 'https://www.pearson.com/redes');

-- 3. Inserir Opções / Alternativas (Certo / Errado para cada pergunta)
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


INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES 
(5, 2, 'O comando SQL DROP TABLE exclui a estrutura de uma tabela e todos os seus dados permanentemente.', 'Manipulação de estruturas de dados em bancos relacionais.', 'Correto. O DROP TABLE remove completamente a tabela e seus registros do banco de dados.', 'Guia de Referência SQL', 'https://www.postgresql.org/docs/manual/'),

(6, 2, 'A primeira forma normal (1FN) exige que os atributos de uma tabela contenham valores atômicos e indivisíveis.', 'Normalização de banco de dados e eliminação de grupos repetitivos.', 'Correto. A 1FN determina que cada coluna deve conter apenas valores atômicos.', 'Fundamentos de Banco de Dados', 'https://www.postgresql.org/docs/manual/'),

(7, 1, 'O protocolo DHCP é utilizado para a atribuição dinâmica de endereços IP aos dispositivos em uma rede.', 'Serviços e protocolos de configuração de rede.', 'Correto. O DHCP automatiza a distribuição de endereços IP, máscara de sub-rede e gateway.', 'Redes de Computadores - Tanenbaum', 'https://www.pearson.com/redes'),

(8, 1, 'Os endereços do protocolo IPv4 possuem um tamanho total de 64 bits.', 'Estudo do endereçamento IP nas redes de computadores.', 'Errado. O IPv4 possui 32 bits de comprimento, enquanto o IPv6 possui 128 bits.', 'Redes de Computadores - Tanenbaum', 'https://www.pearson.com/redes');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES 
-- Pergunta 5 (Gabarito: Certo)
(5, 'Certo', TRUE),
(5, 'Errado', FALSE),

-- Pergunta 6 (Gabarito: Certo)
(6, 'Certo', TRUE),
(6, 'Errado', FALSE),

-- Pergunta 7 (Gabarito: Certo)
(7, 'Certo', TRUE),
(7, 'Errado', FALSE),

-- Pergunta 8 (Gabarito: Errado)
(8, 'Certo', FALSE),
(8, 'Errado', TRUE);

COMMIT;
