# Passos 1 a 3 — Contexto, minimundo e requisitos

## 1. Introdução e contexto

O **Duel Dev** é uma plataforma web interativa de treino e fixação de conhecimentos, voltada para a preparação de candidatos em questões de Informática para Concursos Públicos. Através de uma abordagem de gamificação, o sistema transforma a resolução de questões de exames oficiais em uma experiência estimulante e dinâmica que fomenta a curiosidade, o aprendizado ativo e a retenção do conhecimento. O objetivo deste banco de dados (hospedado no PostgreSQL via Supabase) é armazenar e gerenciar de forma estruturada as questões, categorias temáticas (ex: Hardware, Redes, Lógica de Programação), alternativas de resposta, gabaritos corretos e justificativas explicativas com fontes bibliográficas, disponibilizando estes dados por meio de uma API REST em Node.js (hospedada no Render) para consumo pelo front-end da aplicação.

| O banco faz | O banco não faz |
| --- | --- |
| Armazena perguntas de concursos categorizadas por tema | Não armazena senhas ou dados de autenticação de usuários |
| Guarda até 5 alternativas por questão e indica a correta (`eh_correta`) | Não realiza geração automática de perguntas por Inteligência Artificial |
| Fornece dados via endpoint REST (`/api/questions`) para o front-end | Não exige instalação de softwares ou dependências na máquina do jogador |
| Registra explicações, justificativas e links de fontes bibliográficas | Não guarda histórico permanente de partidas em banco de dados global |
| Registra a pontuação da rodada e exibe o Ranking da Sessão | |

| Usuário | O que faz |
| --- | --- |
| Jogador / Concursando | Informa seu nome, responde às questões de múltipla escolha de concursos, recebe feedback imediato do gabarito com justificativa técnica e visualiza sua pontuação no ranking da sessão. |
| Administrador / Professor | Mantém a base de dados via inserções e scripts SQL no banco (cadastrando e atualizando perguntas de bancas examinadoras, categorias e alternativas). |

## 2. Minimundo

Somos uma plataforma de preparação para concursos públicos de TI e queremos um sistema interativo gamificado para estimular o estudo e o aprendizado ativo dos candidatos. Cada pergunta armazenada possui um enunciado técnico baseado em provas oficiais, pertence a uma única categoria temática (como "Hardware e Arquitetura", "Redes de Computadores" ou "Lógica de Programação") e conta com uma explicação detalhada do gabarito oficial, acompanhada por um link de referência bibliográfica para aprofundamento do tema.

Para garantir a dinamicidade das partidas e evitar a simples memorização da posição das opções, cada pergunta disponibiliza alternativas de múltipla escolha que são embaralhadas aleatoriamente a cada rodada. O modelo padrão utiliza até 5 alternativas por questão, permitindo também suportar 2 ou 4 opções sem alterar a estrutura das tabelas. Cada alternativa possui seu texto e um indicador lógico (`eh_correta`) que define a resposta certa. Antes de iniciar a rodada, o jogador informa seu nome para identificação no jogo. Durante a partida, a aplicação valida as respostas enviadas, contabiliza os pontos obtidos, exibe o feedback pedagógico com a justificativa técnica e atualiza a tabela de classificação (Ranking da Sessão).

## 3. Requisitos e regras de negócio

| Código | Texto do requisito | Tipo |
| --- | --- | --- |
| **RD01** | Toda pergunta pertence a exatamente uma categoria temática (ex: Hardware, Redes). Não há duas categorias com o mesmo nome. | regra de negócio |
| **RD02** | Toda pergunta possui título/enunciado, justificativa explicativa e categoria associada obrigatoriamente. | regra de negócio |
| **RD03** | Cada pergunta possui um conjunto de alternativas associadas na tabela relacional. | regra de negócio |
| **RD04** | Exatamente uma alternativa de cada pergunta possui o indicador lógico de resposta correta (`eh_correta = true`). | regra de negócio |
| **RD05** | O modelo de dados aceita quantidade flexível de alternativas (de 2 a 5 opções) por questão sem necessidade de alterar a estrutura da tabela de perguntas. | regra de negócio |
| **RD06** | Cada pergunta permite o armazenamento opcional de um link/URL de fonte bibliográfica oficial para consulta e aprofundamento. | regra de negócio |
| **RA01** | Disponibilizar as perguntas cadastradas, com suas respectivas categorias e alternativas relacionais, via endpoint REST (`/api/questions`). | funcional |
| **RA02** | Randomizar a ordem de exibição das alternativas de cada questão a cada nova partida para o jogador (algoritmo Fisher-Yates). | funcional |
| **RA03** | Validar a alternativa selecionada pelo jogador comparando a escolha com o campo `eh_correta` da base de dados. | funcional |
| **RA04** | Exibir o feedback pedagógico imediato (justificativa técnica e link da fonte) após o envio da resposta pelo jogador. | funcional |
| **RA05** | Contabilizar os pontos obtidos durante a rodada e exibir a tabela de classificação (*Ranking da Sessão*) ao final do quiz. | funcional |
| **RNF01** | O SGBD utilizado para o armazenamento dos dados é estritamente o PostgreSQL (hospedado na nuvem via Supabase). | não funcional |
| **RNF02** | O serviço de API para fornecimento de dados é desenvolvido em Node.js/Express e hospedado na plataforma Render. | não funcional |
| **RNF03** | Integridade Referencial: Garantia de chaves primárias e estrangeiras válidas (`NOT NULL`) com restrições operacionais entre as tabelas de perguntas e alternativas. | não funcional |
