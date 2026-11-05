-- ============================================================
-- SCRIPT DE CRIAÇÃO E POVOAMENTO - TECHQUIZ / TECH TRIVIA
-- Banco de Dados: PostgreSQL
-- ============================================================

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
    contexto TEXT, -- Contexto/fato introduzido antes das opções
    explicacao TEXT NOT NULL, -- Explicação do acerto/erro
    fonte_nome VARCHAR(150) NOT NULL, -- Nome do site/instituição da fonte
    fonte_url TEXT NOT NULL -- Link direto para a fonte oficial
);

-- Tabela de Opções/Alternativas (Com indicação de resposta correta)
CREATE TABLE opcoes (
    id SERIAL PRIMARY KEY,
    pergunta_id INT NOT NULL REFERENCES perguntas(id) ON DELETE CASCADE,
    texto_opcao VARCHAR(50) NOT NULL,
    eh_correta BOOLEAN NOT NULL DEFAULT FALSE
);

-- Tabela de Usuários (Para apoio ao RQ01)
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Pontuações (Para apoio ao RQ03 e RQ04)
CREATE TABLE pontuacoes (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    pontos INT NOT NULL,
    data_sessao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Pergunta 1 - SQL
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(1, 4, 'SQL é uma linguagem utilizada para consultar e manipular dados em bancos de dados?',
'Os bancos de dados armazenam informações que podem ser consultadas e modificadas.',
'CERTO. SQL permite consultar, inserir, atualizar e excluir dados em bancos relacionais.',
'PostgreSQL Documentation',
'https://www.postgresql.org/docs/current/sql.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(1, 'CERTO', TRUE),
(1, 'ERRADO', FALSE);

-- Pergunta 2 - SQL
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(2, 4, 'O comando SELECT é utilizado para excluir registros de uma tabela?',
'O SQL possui comandos específicos para consultar e modificar informações.',
'ERRADO. SELECT consulta informações. DELETE é utilizado para excluir registros.',
'PostgreSQL Documentation',
'https://www.postgresql.org/docs/current/sql-select.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(2, 'CERTO', FALSE),
(2, 'ERRADO', TRUE);

-- Pergunta 3 - SQL
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(3, 4, 'O comando INSERT é utilizado para adicionar novos registros em uma tabela?',
'Bancos de dados permitem cadastrar novas informações.',
'CERTO. INSERT INTO adiciona novos registros em uma tabela.',
'PostgreSQL Documentation',
'https://www.postgresql.org/docs/current/sql-insert.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(3, 'CERTO', TRUE),
(3, 'ERRADO', FALSE);

-- Pergunta 4 - SQL
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(4, 4, 'O comando DELETE é utilizado para remover registros de uma tabela?',
'Em um banco de dados, algumas informações podem precisar ser excluídas.',
'CERTO. DELETE permite remover registros de uma tabela.',
'PostgreSQL Documentation',
'https://www.postgresql.org/docs/current/sql-delete.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(4, 'CERTO', TRUE),
(4, 'ERRADO', FALSE);

-- Pergunta 5 - SQL
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(5, 4, 'Uma chave primária pode identificar exclusivamente cada registro de uma tabela?',
'As tabelas utilizam identificadores para diferenciar seus registros.',
'CERTO. A chave primária identifica cada registro de forma única.',
'PostgreSQL Documentation',
'https://www.postgresql.org/docs/current/ddl-constraints.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(5, 'CERTO', TRUE),
(5, 'ERRADO', FALSE);

-- Pergunta 6 - SQL
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(6, 4, 'O comando UPDATE é utilizado para modificar informações existentes em uma tabela?',
'Os dados cadastrados podem precisar de alterações.',
'CERTO. UPDATE permite modificar valores de registros existentes.',
'PostgreSQL Documentation',
'https://www.postgresql.org/docs/current/sql-update.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(6, 'CERTO', TRUE),
(6, 'ERRADO', FALSE);

-- Pergunta 7 - SQL
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(7, 4, 'O comando CREATE TABLE é utilizado para criar uma tabela no banco de dados?',
'Antes de armazenar registros, é necessário criar uma estrutura de tabela.',
'CERTO. CREATE TABLE cria uma nova tabela e define suas colunas.',
'PostgreSQL Documentation',
'https://www.postgresql.org/docs/current/sql-createtable.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(7, 'CERTO', TRUE),
(7, 'ERRADO', FALSE);

-- Pergunta 8 - SQL
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(8, 4, 'O comando WHERE é utilizado para filtrar registros em uma consulta SQL?',
'Nem sempre queremos visualizar todos os registros de uma tabela.',
'CERTO. WHERE define condições para selecionar os registros desejados.',
'PostgreSQL Documentation',
'https://www.postgresql.org/docs/current/sql-select.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(8, 'CERTO', TRUE),
(8, 'ERRADO', FALSE);

-- Pergunta 9 - SQL
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(9, 4, 'O comando ORDER BY é utilizado para ordenar os resultados de uma consulta?',
'Organizar informações facilita a leitura dos resultados.',
'CERTO. ORDER BY permite ordenar registros em ordem crescente ou decrescente.',
'PostgreSQL Documentation',
'https://www.postgresql.org/docs/current/queries-order.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(9, 'CERTO', TRUE),
(9, 'ERRADO', FALSE);

-- Pergunta 10 - SQL
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(10, 4, 'Uma chave estrangeira pode criar um relacionamento entre duas tabelas?',
'Bancos de dados relacionais utilizam relacionamentos para conectar informações.',
'CERTO. A chave estrangeira referencia uma chave de outra tabela.',
'PostgreSQL Documentation',
'https://www.postgresql.org/docs/current/ddl-constraints.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(10, 'CERTO', TRUE),
(10, 'ERRADO', FALSE);


-- ============================================================
-- 2. HTML - PERGUNTAS 11 A 20
-- ============================================================

-- Pergunta 11 - HTML
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(11, 9, 'HTML é utilizado para estruturar o conteúdo de páginas da internet?',
'As páginas web precisam de uma estrutura para organizar textos, imagens e links.',
'CERTO. HTML é uma linguagem de marcação utilizada para estruturar conteúdos na web.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/HTML');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(11, 'CERTO', TRUE),
(11, 'ERRADO', FALSE);

-- Pergunta 12 - HTML
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(12, 9, 'A tag <h1> é utilizada para criar um título de nível 1 em HTML?',
'HTML possui diferentes elementos para organizar títulos e subtítulos.',
'CERTO. O elemento h1 representa um título de nível 1.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/HTML/Reference/Elements/Heading_Elements');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(12, 'CERTO', TRUE),
(12, 'ERRADO', FALSE);

-- Pergunta 13 - HTML
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(13, 9, 'A tag <img> é utilizada para inserir imagens em uma página HTML?',
'Imagens são elementos comuns em sites e páginas web.',
'CERTO. O elemento img permite incorporar imagens em documentos HTML.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/HTML/Reference/Elements/img');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(13, 'CERTO', TRUE),
(13, 'ERRADO', FALSE);

-- Pergunta 14 - HTML
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(14, 9, 'A tag <p> é utilizada para criar parágrafos em HTML?',
'Os textos de uma página podem ser organizados em parágrafos.',
'CERTO. O elemento p representa um parágrafo de texto.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/HTML/Reference/Elements/p');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(14, 'CERTO', TRUE),
(14, 'ERRADO', FALSE);

-- Pergunta 15 - HTML
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(15, 9, 'A tag <a> pode ser utilizada para criar links em uma página?',
'Os links permitem navegar entre páginas e outros conteúdos.',
'CERTO. O elemento a cria hyperlinks utilizando principalmente o atributo href.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/HTML/Reference/Elements/a');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(15, 'CERTO', TRUE),
(15, 'ERRADO', FALSE);

-- Pergunta 16 - HTML
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(16, 9, 'HTML é uma linguagem de programação utilizada para realizar cálculos matemáticos?',
'HTML é frequentemente utilizado junto com CSS e JavaScript.',
'ERRADO. HTML é uma linguagem de marcação, não uma linguagem de programação.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/HTML');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(16, 'CERTO', FALSE),
(16, 'ERRADO', TRUE);

-- Pergunta 17 - HTML
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(17, 9, 'A tag <br> pode ser utilizada para inserir uma quebra de linha?',
'Alguns elementos HTML permitem controlar a apresentação do texto.',
'CERTO. O elemento br representa uma quebra de linha no conteúdo.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/HTML/Reference/Elements/br');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(17, 'CERTO', TRUE),
(17, 'ERRADO', FALSE);

-- Pergunta 18 - HTML
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(18, 9, 'O atributo href pode indicar o endereço de destino de um link?',
'Links precisam de um endereço para direcionar o usuário.',
'CERTO. O atributo href especifica o destino de um hyperlink.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/HTML/Reference/Elements/a');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(18, 'CERTO', TRUE),
(18, 'ERRADO', FALSE);

-- Pergunta 19 - HTML
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(19, 9, 'A tag <table> é utilizada para criar tabelas em HTML?',
'Tabelas podem organizar informações em linhas e colunas.',
'CERTO. O elemento table representa dados organizados em uma tabela.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/HTML/Reference/Elements/table');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(19, 'CERTO', TRUE),
(19, 'ERRADO', FALSE);

-- Pergunta 20 - HTML
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(20, 9, 'A tag <body> representa a parte do documento HTML que contém o conteúdo da página?',
'Um documento HTML possui uma estrutura básica com diferentes elementos.',
'CERTO. O elemento body contém o conteúdo principal apresentado no navegador.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/HTML/Reference/Elements/body');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(20, 'CERTO', TRUE),
(20, 'ERRADO', FALSE);

-- ============================================================
-- 3. LINGUAGEM C - PERGUNTAS 21 A 30
-- ============================================================

-- Pergunta 21 - C
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(21, 3, 'A linguagem C é utilizada no desenvolvimento de programas e sistemas?',
'A linguagem C é conhecida por sua eficiência e utilização em diferentes tipos de software.',
'CERTO. C é uma linguagem de programação utilizada em sistemas operacionais, programas e aplicações embarcadas.',
'cppreference',
'https://en.cppreference.com/w/c/language.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(21, 'CERTO', TRUE),
(21, 'ERRADO', FALSE);

-- Pergunta 22 - C
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(22, 3, 'A função main() é normalmente o ponto de entrada de um programa em C?',
'Programas em C possuem uma função principal para iniciar a execução.',
'CERTO. A função main é o ponto de entrada convencional de um programa C.',
'cppreference',
'https://en.cppreference.com/w/c/language/main_function.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(22, 'CERTO', TRUE),
(22, 'ERRADO', FALSE);

-- Pergunta 23 - C
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(23, 3, 'O comando printf() é utilizado para apresentar informações na tela?',
'A linguagem C possui funções para entrada e saída de dados.',
'CERTO. printf é uma função utilizada para formatar e apresentar informações.',
'cppreference',
'https://en.cppreference.com/w/c/io/fprintf.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(23, 'CERTO', TRUE),
(23, 'ERRADO', FALSE);

-- Pergunta 24 - C
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(24, 3, 'A linguagem C utiliza a palavra-chave let para declarar variáveis?',
'Cada linguagem de programação possui suas próprias regras para declarar variáveis.',
'ERRADO. let não é uma palavra-chave da linguagem C. Variáveis podem ser declaradas utilizando tipos como int, char e float.',
'cppreference',
'https://en.cppreference.com/w/c/language/declarations.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(24, 'CERTO', FALSE),
(24, 'ERRADO', TRUE);

-- Pergunta 25 - C
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(25, 3, 'O tipo int pode ser utilizado para armazenar números inteiros em C?',
'Os tipos de dados definem quais valores uma variável pode armazenar.',
'CERTO. int é um tipo de dado inteiro da linguagem C.',
'cppreference',
'https://en.cppreference.com/w/c/language/arithmetic_types.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(25, 'CERTO', TRUE),
(25, 'ERRADO', FALSE);

-- Pergunta 26 - C
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(26, 3, 'O comando scanf() pode ser utilizado para receber dados digitados pelo usuário?',
'Programas podem solicitar informações durante sua execução.',
'CERTO. scanf é uma função da biblioteca padrão utilizada para ler dados formatados.',
'cppreference',
'https://en.cppreference.com/w/c/io/fscanf.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(26, 'CERTO', TRUE),
(26, 'ERRADO', FALSE);

-- Pergunta 27 - C
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(27, 3, 'O ponto e vírgula é utilizado para finalizar muitas instruções em C?',
'A linguagem C possui regras específicas para separar instruções.',
'CERTO. O ponto e vírgula finaliza expressões e declarações que exigem esse terminador.',
'cppreference',
'https://en.cppreference.com/w/c/language/statements.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(27, 'CERTO', TRUE),
(27, 'ERRADO', FALSE);

-- Pergunta 28 - C
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(28, 3, 'O comando if pode ser utilizado para executar uma ação dependendo de uma condição?',
'Programas precisam tomar decisões durante sua execução.',
'CERTO. if permite executar um bloco de código quando uma condição é verdadeira.',
'cppreference',
'https://en.cppreference.com/w/c/language/if.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(28, 'CERTO', TRUE),
(28, 'ERRADO', FALSE);

-- Pergunta 29 - C
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(29, 3, 'O comando for pode ser utilizado para repetir instruções em C?',
'Estruturas de repetição ajudam a executar tarefas várias vezes.',
'CERTO. for é uma estrutura de repetição da linguagem C.',
'cppreference',
'https://en.cppreference.com/w/c/language/for.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(29, 'CERTO', TRUE),
(29, 'ERRADO', FALSE);

-- Pergunta 30 - C
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(30, 3, 'Em C, o tipo char pode ser utilizado para armazenar um caractere?',
'Existem tipos de dados específicos para representar diferentes valores.',
'CERTO. char é utilizado para representar valores de caracteres na linguagem C.',
'cppreference',
'https://en.cppreference.com/w/c/language/arithmetic_types.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(30, 'CERTO', TRUE),
(30, 'ERRADO', FALSE);

-- ============================================================
-- 4. JAVASCRIPT - PERGUNTAS 31 A 40
-- ============================================================

-- Pergunta 31 - JavaScript
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(31, 3, 'JavaScript é uma linguagem utilizada para adicionar interatividade às páginas web?',
'JavaScript é muito utilizado no desenvolvimento de sites e aplicações.',
'CERTO. JavaScript permite criar interações, responder a eventos e modificar conteúdos de páginas web.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/JavaScript');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(31, 'CERTO', TRUE),
(31, 'ERRADO', FALSE);

-- Pergunta 32 - JavaScript
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(32, 3, 'A palavra-chave let pode ser utilizada para declarar uma variável em JavaScript?',
'Variáveis permitem armazenar informações durante a execução de um programa.',
'CERTO. let declara uma variável com escopo de bloco.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Statements/let');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(32, 'CERTO', TRUE),
(32, 'ERRADO', FALSE);

-- Pergunta 33 - JavaScript
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(33, 3, 'A palavra-chave const permite declarar uma variável que pode receber uma nova atribuição normalmente?',
'JavaScript possui diferentes formas de declarar variáveis.',
'ERRADO. Uma variável declarada com const não pode receber uma nova atribuição.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Statements/const');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(33, 'CERTO', FALSE),
(33, 'ERRADO', TRUE);

-- Pergunta 34 - JavaScript
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(34, 3, 'O comando console.log() pode ser utilizado para mostrar informações no console?',
'O console é uma ferramenta bastante utilizada para acompanhar a execução de programas.',
'CERTO. console.log() apresenta mensagens e valores no console do navegador ou do ambiente de execução.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/API/console/log_static');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(34, 'CERTO', TRUE),
(34, 'ERRADO', FALSE);

-- Pergunta 35 - JavaScript
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(35, 3, 'Um array em JavaScript pode armazenar vários valores em uma única estrutura?',
'Arrays facilitam a organização de conjuntos de informações.',
'CERTO. Um array é uma estrutura ordenada que permite armazenar vários elementos.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(35, 'CERTO', TRUE),
(35, 'ERRADO', FALSE);

-- Pergunta 36 - JavaScript
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(36, 3, 'A estrutura if pode ser utilizada para verificar uma condição em JavaScript?',
'As condições permitem que o programa escolha diferentes caminhos de execução.',
'CERTO. if executa um bloco de código quando a condição informada é verdadeira.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Statements/if...else');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(36, 'CERTO', TRUE),
(36, 'ERRADO', FALSE);

-- Pergunta 37 - JavaScript
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(37, 3, 'O operador == compara valores sem exigir que os tipos sejam iguais?',
'JavaScript possui operadores diferentes para realizar comparações.',
'CERTO. O operador == realiza comparação com conversão de tipos quando necessário.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Operators/Equality');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(37, 'CERTO', TRUE),
(37, 'ERRADO', FALSE);

-- Pergunta 38 - JavaScript
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(38, 3, 'O operador === compara valores e também verifica seus tipos?',
'Existem diferenças entre os operadores de igualdade em JavaScript.',
'CERTO. O operador === realiza uma comparação estrita, sem conversão automática de tipos.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Operators/Strict_equality');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(38, 'CERTO', TRUE),
(38, 'ERRADO', FALSE);

-- Pergunta 39 - JavaScript
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(39, 3, 'O método push() é utilizado para adicionar um elemento ao final de um array?',
'JavaScript possui métodos que facilitam a manipulação de arrays.',
'CERTO. push() adiciona um ou mais elementos ao final de um array.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/push');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(39, 'CERTO', TRUE),
(39, 'ERRADO', FALSE);

-- Pergunta 40 - JavaScript
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(40, 3, 'JavaScript não pode ser executado em navegadores de internet?',
'JavaScript é uma das principais tecnologias utilizadas na criação de páginas web.',
'ERRADO. Os navegadores modernos possuem mecanismos que permitem executar JavaScript.',
'MDN Web Docs',
'https://developer.mozilla.org/pt-BR/docs/Web/JavaScript');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(40, 'CERTO', FALSE),
(40, 'ERRADO', TRUE);

-- ============================================================
-- 5. CURIOSIDADES SOBRE TECNOLOGIA - PERGUNTAS 41 A 50
-- ============================================================

-- Pergunta 41 - Curiosidades
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(41, 1, 'O primeiro bug de computador famoso foi uma mariposa encontrada dentro de um computador em 1947?',
'Durante a manutenção do computador Harvard Mark II, técnicos encontraram um inseto preso em um relé.',
'CERTO. Uma mariposa foi encontrada no Harvard Mark II em 1947 e registrada no diário de operações da equipe.',
'Smithsonian National Museum of American History',
'https://americanhistory.si.edu/collections/search/object/nmah_334663');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(41, 'CERTO', TRUE),
(41, 'ERRADO', FALSE);

-- Pergunta 42 - Curiosidades
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(42, 1, 'A World Wide Web foi criada por Tim Berners-Lee?',
'A internet e a World Wide Web são conceitos relacionados, mas não são exatamente a mesma coisa.',
'CERTO. Tim Berners-Lee inventou a World Wide Web enquanto trabalhava no CERN.',
'CERN',
'https://home.cern/science/computing/birth-web');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(42, 'CERTO', TRUE),
(42, 'ERRADO', FALSE);

-- Pergunta 43 - Curiosidades
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(43, 1, 'O computador ENIAC foi desenvolvido na década de 1940?',
'Os primeiros computadores eletrônicos ajudaram a transformar a história da computação.',
'CERTO. O ENIAC foi desenvolvido durante a década de 1940 e apresentado publicamente em 1946.',
'Computer History Museum',
'https://www.computerhistory.org/revolution/birth-of-the-computer/4/78');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(43, 'CERTO', TRUE),
(43, 'ERRADO', FALSE);

-- Pergunta 44 - Curiosidades
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(44, 1, 'A internet e a World Wide Web são exatamente a mesma tecnologia?',
'A Web utiliza a internet para permitir o acesso a páginas e outros conteúdos.',
'ERRADO. A internet é uma infraestrutura de redes interconectadas. A World Wide Web é um dos serviços que funcionam sobre ela.',
'CERN',
'https://home.cern/science/computing/birth-web');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(44, 'CERTO', FALSE),
(44, 'ERRADO', TRUE);

-- Pergunta 45 - Curiosidades
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(45, 1, 'O primeiro iPhone foi apresentado em 2007?',
'Os smartphones modernos passaram por grandes transformações ao longo dos anos.',
'CERTO. A Apple apresentou a primeira geração do iPhone em janeiro de 2007.',
'Apple Newsroom',
'https://www.apple.com/newsroom/2007/01/09Apple-Reinvents-the-Phone-with-iPhone/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(45, 'CERTO', TRUE),
(45, 'ERRADO', FALSE);

-- Pergunta 46 - Curiosidades
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(46, 1, 'O sistema operacional Linux foi criado por Linus Torvalds?',
'O Linux tornou-se uma tecnologia muito importante em servidores e computadores.',
'CERTO. Linus Torvalds anunciou o desenvolvimento do núcleo Linux em 1991.',
'Linux Kernel Archives',
'https://www.kernel.org/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(46, 'CERTO', TRUE),
(46, 'ERRADO', FALSE);

-- Pergunta 47 - Curiosidades
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(47, 1, 'O código binário utiliza apenas os números 0 e 1?',
'Os computadores representam e processam informações utilizando sistemas numéricos.',
'CERTO. O sistema binário utiliza somente dois símbolos: 0 e 1.',
'IBM',
'https://www.ibm.com/think/topics/binary-code');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(47, 'CERTO', TRUE),
(47, 'ERRADO', FALSE);

-- Pergunta 48 - Curiosidades
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(48, 1, 'Um SSD utiliza discos magnéticos giratórios para armazenar informações?',
'Existem diferentes tecnologias de armazenamento de dados em computadores.',
'ERRADO. SSDs utilizam memória flash para armazenar dados. Os HDs tradicionais utilizam discos magnéticos giratórios.',
'Kingston Technology',
'https://www.kingston.com/en/blog/pc-performance/ssd-vs-hdd');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(48, 'CERTO', FALSE),
(48, 'ERRADO', TRUE);

-- Pergunta 49 - Curiosidades
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(49, 1, 'Um código QR pode armazenar informações que podem ser lidas pela câmera de um celular?',
'Os códigos QR são utilizados em pagamentos, sites, cardápios e identificação de produtos.',
'CERTO. Códigos QR são códigos bidimensionais que armazenam informações legíveis por dispositivos de leitura.',
'DENSO WAVE',
'https://www.qrcode.com/en/about/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(49, 'CERTO', TRUE),
(49, 'ERRADO', FALSE);

-- Pergunta 50 - Curiosidades
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(50, 1, 'A inteligência artificial começou a ser pesquisada somente depois do ano 2000?',
'A inteligência artificial possui uma história de pesquisa que antecede os computadores e serviços modernos.',
'ERRADO. A pesquisa formal em inteligência artificial já estava estabelecida na década de 1950, incluindo a conferência de Dartmouth em 1956.',
'Dartmouth College',
'https://home.dartmouth.edu/about/artificial-intelligence-ai-coined-dartmouth');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(50, 'CERTO', FALSE),
(50, 'ERRADO', TRUE);

SELECT 
    p.id,
    c.nome AS categoria,
    p.enunciado,
    o.texto_opcao,
    o.eh_correta,
    p.explicacao,
    p.fonte_nome,
    p.fonte_url
FROM perguntas p
JOIN categorias c ON p.categoria_id = c.id
JOIN opcoes o ON o.pergunta_id = p.id
ORDER BY p.id, o.id;