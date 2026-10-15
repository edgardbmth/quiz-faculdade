# Passos 1 a 3 — Contexto, minimundo e requisitos

## 1. Introdução e contexto

O **Duel Dev** é uma plataforma web interativa de treino e fixação de conhecimentos, voltada para a preparação de candidatos em questões de Informática para Concursos Públicos. Através de uma abordagem de gamificação, o sistema transforma a resolução de questões de exames oficiais em uma experiência estimulante e dinâmica que fomenta a curiosidade, o aprendizado ativo e a retenção do conhecimento. O objetivo deste banco de dados (hospedado no PostgreSQL via Supabase) é armazenar e gerenciar de forma estruturada as questões, categorias temáticas (ex: Hardware, Redes, Lógica de Programação), alternativas de resposta, gabaritos corretos e justificativas explicativas com fontes bibliográficas, disponibilizando estes dados por meio de uma API REST em Node.js (hospedada no Render) para consumo pelo front-end da aplicação.

| O banco faz | O banco não faz |
| --- | --- |
| Armazena de forma estruturada as questões, temas, alternativas, explicações e fontes bibliográficas. | Não armazena senhas ou dados de autenticação de usuários. |
| Mantém a integridade referencial e restrições estruturais (`NOT NULL`, chaves primárias e estrangeiras). | Não realiza geração automática de perguntas por Inteligência Artificial |
| Assegura o suporte flexível de 2 a 5 alternativas por questão sem alteração estrutural de tabela. | Não executa a lógica de rotas da API REST nem regras visuais da interface. |
| Armazena os registros e pontuações consolidadas do ranking da sessão de jogo. | Não guarda histórico permanente global de partidas em banco de dados global. |

| Usuário | O que faz |
| --- | --- |
| Jogador / Concursando | Informa seu nome, responde às questões de múltipla escolha de concursos, recebe feedback imediato do gabarito com justificativa técnica e visualiza sua pontuação no ranking da sessão. |
| Administrador / Professor | Mantém a base de dados via inserções e scripts SQL no banco (cadastrando e atualizando perguntas de bancas examinadoras, categorias e alternativas). |

## 2. Minimundo

Somos uma plataforma de preparação para concursos públicos de TI e queremos um sistema interativo gamificado para estimular o estudo e o aprendizado ativo dos candidatos. Cada pergunta armazenada possui um enunciado técnico baseado em provas oficiais, pertence a uma única categoria temática (como "Hardware e Arquitetura", "Redes de Computadores" ou "Lógica de Programação") e conta com uma explicação detalhada do gabarito oficial, acompanhada por um link de referência bibliográfica para aprofundamento do tema.

Para garantir a dinamicidade das partidas e evitar a simples memorização da posição das opções, cada pergunta disponibiliza alternativas de múltipla escolha que são embaralhadas aleatoriamente a cada rodada. O modelo padrão utiliza até 5 alternativas por questão, permitindo também suportar 2 ou 4 opções sem alterar a estrutura das tabelas. Cada alternativa possui seu texto e um indicador lógico (`eh_correta`) que define a resposta certa. Antes de iniciar a rodada, o jogador informa seu nome para identificação no jogo. Durante a partida, a aplicação valida as respostas enviadas, contabiliza os pontos obtidos, exibe o feedback pedagógico com a justificativa técnica e atualiza a tabela de classificação (Ranking da Sessão).

## 3. Requisitos e regras de negócio

### Requisitos Funcionais (RF)
| Código | Descrição do Requisito Funcional | Tipo |
| :--- | :--- | :--- |
| **RF01** | O sistema deve fornecer um endpoint de API REST para listar as perguntas cadastradas e suas respectivas alternativas para o front-end. | funcional |
| **RF02** | O sistema deve permitir que o usuário informe seu nome antes de iniciar a rodada do quiz para identificação na sessão. | funcional |
| **RF03** | O sistema deve embaralhar aleatoriamente as alternativas de múltipla escolha a cada rodada para evitar memorização. | funcional |
| **RF04** | O sistema deve validar a resposta enviada pelo usuário, exibir feedback pedagógico imediato com a justificativa técnica e contabilizar os pontos.| funcional |
| **RF05** | O sistema deve calcular e exibir a tabela de classificação (Ranking da Sessão) ao término da rodada. | funcional |

### Regras de Negócio (RD)
| Código | Descrição da Regra de Negócio | Tipo |
| :--- | :--- | :--- |
| **RD01** | Toda pergunta pertence a exatamente uma categoria temática (ex: Hardware, Redes). Não há duas categorias com o mesmo nome. | regra de negócio |
| **RD02** | Toda pergunta possui obrigatoriamente título/enunciado, justificativa explicativa e categoria associada. | regra de negócio |
| **RD03** | Cada pergunta possui um conjunto associado de 2 a 5 alternativas de múltipla escolha. | regra de negócio |
| **RD04** | Exatamente uma alternativa de cada pergunta deve possuir o indicador lógico de resposta correta (`eh_correta = true`). | regra de negócio |
| **RD05** | O armazenamento do link ou URL de fonte bibliográfica oficial para consulta e aprofundamento em cada questão é opcional. | regra de negócio |

### Requisitos Não Funcionais (RNF)
| Código | Descrição do Requisito Não Funcional | Tipo |
| :--- | :--- | :--- |
| **RNF01** | O SGBD utilizado para o armazenamento dos dados deve ser estritamente o PostgreSQL (hospedado no Supabase). | não funcional |
| **RNF02** | O serviço de API para fornecimento de dados deve ser desenvolvido em Node.js/Express e hospedado na plataforma Render. | não funcional |
| **RNF03** | O SGBD deve garantir a integridade referencial por meio de chaves primárias e estrangeiras válidas (`NOT NULL`) entre as tabelas de perguntas e alternativas. | não funcional |
| **RNF04** | A interface web (front-end) deve ser responsiva e compatível com os principais navegadores modernos do mercado. | não funcional |
