# Contexto, Minimundo e Requisitos — Projeto Tech Trivia (Dev Duel)

## 1. Introdução e Contexto

O **Dev Duel** é um aplicativo de quiz no formato "Certo ou Errado" voltado para a preparação de candidatos em questões de **Informática para Concursos Públicos**. O objetivo deste banco de dados é armazenar e gerenciar de forma estruturada as questões, suas respectivas categorias temáticas (ex: Redes, Banco de Dados, Segurança), as alternativas de resposta, as explicações detalhadas dos gabaritos e as fontes/referências bibliográficas oficiais de onde as afirmativas foram retiradas.

### O que o banco faz e o que não faz

| O que o banco faz | O que o banco NÃO faz |
| :--- | :--- |
| Armazena categorias de informática em ordem alfabética | Não armazena senhas ou dados de autenticação de usuários |
| Armazena perguntas com código de referência (ex: `fact-001`) | Não armazena histórico de sessões ou cookies |
| Guarda alternativas (Certo/Errado) e indica a correta | Não armazena pontuações, placares ou rankings de jogadores |
| Registra explicações detalhadas e fontes bibliográficas | Não gerencia permissões de acesso por perfil de tela |

### Usuários e Perfis

| Usuário | Papel no Sistema |
| :--- | :--- |
| **Jogador** | Consulta e lê perguntas, escolhe entre Certo/Errado, verifica se acertou e visualiza a explicação e a fonte oficial. |
| **Cadastrador** | Insere e mantém categorias, publicadores, fontes e afirmativas de concursos via scripts de carga (DML). |

---

## 2. Minimundo

O Tech Trivia da equipe **Dev Duel** é uma plataforma focada em afirmativas de concursos públicos na área de Informática. Cada pergunta possui um código identificador estável mantido da banca examinadora ou da carga (como `fact-001`, `fact-002`), um título curto, o enunciado da afirmativa e uma explicação detalhada sobre o gabarito.

Cada pergunta pertence a exatamente uma categoria temática (como "Redes de Computadores", "Banco de Dados" ou "Segurança da Informação"), e uma categoria pode agrupar várias perguntas. Cada pergunta cita exatamente uma fonte bibliográfica ou documento de referência. Para evitar duplicação de dados, uma mesma fonte (com seu título, endereço URL e idioma) pode ser citada por mais de uma pergunta sem que a URL precise ser recadastrada.

Toda fonte possui exatamente um publicador responsável (por exemplo, "Banca CESPE/Cebraspe", "Editora Campus" ou "W3C"), sendo que o mesmo nome de publicador é gravado uma única vez no banco. O idioma da fonte é selecionado a partir de um conjunto controlado e padronizado, contendo um código e uma descrição (por exemplo, `pt-BR` - Português Brasil).

As alternativas de resposta para a afirmativa são cadastradas de forma independente. No modelo atual, as opções padrão são "Certo" e "Errado", cada uma com seu rótulo e valor lógico associado, e cada pergunta indica exatamente qual alternativa representa a resposta correta. A estrutura do banco permite que, no futuro, novas alternativas sejam adicionadas a uma questão sem a necessidade de alterar a estrutura física da tabela de perguntas.

---

## 3. Tabela de Requisitos

### Requisitos de Dados e Regras de Negócio (RD)

| Código | Descrição | Tipo |
| :--- | :--- | :--- |
| **RD01** | Toda pergunta pertence a exatamente uma categoria. Não há duas categorias com o mesmo nome. | Regra de Negócio |
| **RD02** | Toda pergunta cita exatamente uma fonte. A mesma fonte pode ser citada por várias perguntas. A URL é única. | Regra de Negócio |
| **RD03** | Toda fonte tem exatamente um publicador. O nome do publicador é único. | Regra de Negócio |
| **RD04** | Toda fonte tem um idioma de um conjunto controlado, com código e descrição. | Regra de Negócio |
| **RD05** | As alternativas atuais são Certo e Errado, cada uma com rótulo e valor lógico. | Regra de Negócio |
| **RD06** | Toda pergunta indica qual alternativa é a correta. | Regra de Negócio |
| **RD07** | O banco aceita, no futuro, mais de duas alternativas sem refazer a estrutura da pergunta. | Funcional |
| **RD08** | O identificador original da pergunta (`fact-001`, `fact-002`, ...) é preservado. | Regra de Negócio |
| **RD09** | Título, enunciado e explicação são obrigatórios. Enunciado e explicação podem ser longos. | Regra de Negócio |
| **RD10** | Nome de categoria, nome de publicador e dados da fonte não se repetem em cada pergunta. | Regra de Negócio |
| **RD11** | As perguntas da carga entram sem perda de campo. | Funcional |

### Requisitos de Consultas (RA)

| Código | Descrição | Tipo |
| :--- | :--- | :--- |
| **RA01** | Listar as categorias em ordem alfabética, com a quantidade de perguntas. | Funcional |
| **RA02** | Sortear uma pergunta de qualquer categoria ou de uma categoria escolhida. | Funcional |
| **RA03** | Exibir título, enunciado e as alternativas. | Funcional |
| **RA04** | Dizer se a alternativa escolhida é a correta. | Funcional |
| **RA05** | Exibir a explicação e a fonte completa: título, publicador, URL e idioma. | Funcional |
| **RA06** | Listar os publicadores mais citados, com o número de perguntas. | Funcional |
| **RA07** | Listar as fontes citadas por mais de uma pergunta. | Funcional |

### Requisitos Não-Funcionais (RNF)

| Código | Descrição | Tipo |
| :--- | :--- | :--- |
| **RNF01** | O SGBD utilizado é estritamente o PostgreSQL. | Não-Funcional |
| **RNF02** | Integridade: nome de categoria único, URL única, textos da pergunta obrigatórios, toda chave estrangeira do núcleo preenchida. | Não-Funcional |