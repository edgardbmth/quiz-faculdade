# Contexto, Minimundo e Requisitos — Projeto Duel Dev

## 1. Introdução e Contexto

O **Duel Dev** é um aplicativo web interativo de treino e fixação de conhecimentos, voltado para a preparação de candidatos em questões de **Informática para Concursos Públicos**. Diferente dos simulados tradicionais, o sistema adota uma abordagem de **gamificação** projetada para estimular a curiosidade, o aprendizado ativo e a retenção do conhecimento. O banco de dados (hospedado no PostgreSQL via Supabase) armazena e gerencia de forma estruturada as questões de exames oficiais, suas categorias temáticas (ex: Hardware e Arquitetura, Redes de Computadores, Lógica e Programação), as opções de resposta, os gabaritos corretos e as justificativas explicativas com fontes bibliográficas. A aplicação consome esses dados por meio de uma API REST em Node.js (hospedada no Render) para alimentar as partidas interativas e atualizar os resultados em tempo real.

### O que o sistema faz e o que NÃO faz

| O que o sistema faz | O que o sistema NÃO faz |
| :--- | :--- |
| Armazena perguntas de concursos divididas por categorias temáticas | Não armazena senhas ou dados de autenticação de usuários |
| Armazena até 5 alternativas por questão e indica a correta (`eh_correta`) | Não realiza geração automática de perguntas por Inteligência Artificial |
| Disponibiliza a API `/api/questions` para consumo dinâmico do front-end | Não exige a instalação de softwares ou dependências na máquina do jogador |
| Registra explicações, justificativas e links de fontes de referência | Não guarda histórico permanente de partidas em banco de dados global |
| Registra a pontuação da rodada e exibe o Ranking da Sessão | |

### Usuários e Perfis

| Usuário | Papel no Sistema |
| :--- | :--- |
| **Jogador / Concursando** | Informa seu nome, responde às questões de múltipla escolha de concursos, recebe feedback imediato do gabarito com justificativa e visualiza sua pontuação no ranking da sessão. |
| **Administrador / Professor** | Mantém a base de dados via inserções/scripts SQL no banco (cadastrando e atualizando perguntas de bancas examinadoras, categorias e alternativas). |

---

## 2. Minimundo

O **Duel Dev** é uma plataforma interativa de estudos que utiliza elementos de gamificação para transformar a preparação para concursos públicos de Tecnologia da Informação em uma experiência envolvente e estimulante. A proposta central do sistema é despertar a curiosidade do estudante e promover o aprendizado ativo: ao responder às questões, o candidato recebe feedback imediato com justificativas detalhadas e links de referência, incentivando a investigação contínua dos temas abordados.

Cada pergunta armazenada no sistema possui um enunciado técnico baseado em provas oficiais, pertence a uma categoria temática (como "Hardware e Arquitetura", "Redes de Computadores" ou "Lógica de Programação") e conta com uma explicação aprofundada do gabarito oficial, acompanhada por um link de referência bibliográfica.

Para manter o dinamismo das partidas e desafiar a retenção real do conteúdo (evitando a simples memorização da posição das opções), cada pergunta disponibiliza alternativas de múltipla escolha que são embaralhadas aleatoriamente a cada rodada. Cada alternativa possui seu texto e um indicador lógico (`eh_correta`) que define a resposta certa.

Antes de iniciar a rodada, o jogador informa seu nome para identificação no jogo. Durante a partida, a aplicação valida as respostas enviadas, contabiliza os pontos obtidos, exibe o feedback pedagógico com a justificativa técnica e atualiza a tabela de classificação (Ranking da Sessão), estimulando a competitividade saudável e a busca pela melhoria contínua.

---

## 3. Tabela de Requisitos

### Requisitos de Dados e Regras de Negócio (RD)

| Código | Descrição do Requisito | Tipo |
| :--- | :--- | :--- |
| **RD01** | Toda pergunta pertence a exatamente uma categoria temática (ex: Hardware, Redes). Não há duas categorias com o mesmo nome. | Regra de Negócio |
| **RD02** | Toda pergunta possui título/enunciado, justificativa explicativa e categoria associada obrigatoriamente. | Regra de Negócio |
| **RD03** | Cada pergunta possui um conjunto de alternativas associadas na tabela relacional. | Regra de Negócio |
| **RD04** | Exatamente uma alternativa de cada pergunta possui o indicador lógico de resposta correta (`eh_correta = true`). | Regra de Negócio |
| **RD05** | O modelo de dados aceita quantidade flexível de alternativas (de 2 a 5 opções) por questão sem necessidade de alterar a estrutura da tabela de perguntas. | Regra de Negócio |
| **RD06** | Cada pergunta permite o armazenamento opcional de um link/URL de fonte bibliográfica oficial para consulta e aprofundamento. | Regra de Negócio |

### Requisitos de Aplicação e Consultas (RA)

| Código | Descrição do Requisito | Tipo |
| :--- | :--- | :--- |
| **RA01** | Disponibilizar as perguntas cadastradas, com suas respectivas categorias e alternativas relacionais, via endpoint REST (`/api/questions`). | Funcional |
| **RA02** | Randomizar a ordem de exibição das alternativas de cada questão a cada nova partida para o jogador (algoritmo Fisher-Yates). | Funcional |
| **RA03** | Validar a alternativa selecionada pelo jogador comparando a escolha com o campo `eh_correta` da base de dados. | Funcional |
| **RA04** | Exibir o feedback pedagógico imediato (justificativa técnica e link da fonte) após o envio da resposta pelo jogador. | Funcional |
| **RA05** | Contabilizar os pontos obtidos durante a rodada e exibir a tabela de classificação (*Ranking da Sessão*) ao final do quiz. | Funcional |

### Requisitos Não-Funcionais (RNF)

| Código | Descrição do Requisito | Tipo |
| :--- | :--- | :--- |
| **RNF01** | O SGBD utilizado para o armazenamento dos dados é o PostgreSQL (hospedado na nuvem via Supabase). | Não-Funcional |
| **RNF02** | O serviço de API para fornecimento de dados é desenvolvido em Node.js/Express e hospedado na plataforma Render. | Não-Funcional |
| **RNF03** | Integridade Referencial: Garantia de chaves primárias e estrangeiras válidas (`NOT NULL`) com restrições operacionais entre as tabelas `perguntas` e `alternativas`. | Não-Funcional |
