Modelo Lógico, Normalização e Dicionário de Dados — Dev Duel

1. Mapeamento Lógico

categorias (1) -> perguntas (N): A chave primária id da tabela categorias é mapeada como chave estrangeira categoria_id na tabela perguntas (NOT NULL).

perguntas (1) -> opcoes (N): A chave primária id da tabela perguntas é mapeada como chave estrangeira pergunta_id na tabela opcoes (NOT NULL).

usuarios (1) -> pontuacoes (N): A chave primária id da tabela usuarios é mapeada como chave estrangeira usuario_id na tabela pontuacoes (NOT NULL).

2. Normalização

Dependências Funcionais (DF)

id -> nome [categorias]

id -> categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url [perguntas]

id -> pergunta_id, texto_opcao, eh_correta [opcoes]

id -> nome, criado_em [usuarios]

id -> usuario_id, pontos, data_sessao [pontuacoes]

Análise das Formas Normais

1FN (Primeira Forma Normal): Todos os atributos possuem valores atômicos e indivisíveis. Não há grupos repetitivos ou listas de opções gravadas em campos compostos dentro da tabela perguntas.

2FN (Segunda Forma Normal): Todas as tabelas possuem chaves primárias simples (id). Portanto, não existem dependências funcionais parciais de chave composta.

3FN (Terceira Forma Normal): Não há dependências transitivas entre atributos não-chave. Atributos como nome da categoria e dados da fonte encontram-se estruturados de acordo com o modelo conceitual adotado pela equipa.

3. Dicionário de Dados

Tabela: categorias

Coluna

Tipo

Nulo

Restrição

Descrição

id

SERIAL

NOT NULL

PK

Identificador único da categoria

nome

VARCHAR(100)

NOT NULL

UNIQUE

Nome do tema ou categoria de tecnologia

Tabela: perguntas

Coluna

Tipo

Nulo

Restrição

Descrição

id

SERIAL

NOT NULL

PK

Identificador único da pergunta

categoria_id

INT

NOT NULL

FK (categorias.id)

Chave estrangeira da categoria temática

enunciado

TEXT

NOT NULL

-

Texto principal ou afirmativa da questão

contexto

TEXT

NULL

-

Contexto ou fato complementar introdutório

explicacao

TEXT

NOT NULL

-

Explicação pedagógica detalhada do gabarito

fonte_nome

VARCHAR(150)

NOT NULL

-

Nome da instituição ou site da fonte

fonte_url

TEXT

NOT NULL

-

Link direto para consulta oficial da fonte

Tabela: opcoes

Coluna

Tipo

Nulo

Restrição

Descrição

id

SERIAL

NOT NULL

PK

Identificador único da opção/alternativa

pergunta_id

INT

NOT NULL

FK (perguntas.id)

Chave estrangeira da pergunta associada

texto_opcao

VARCHAR(50)

NOT NULL

-

Rótulo de exibição (ex: CERTO, ERRADO)

eh_correta

BOOLEAN

NOT NULL

DEFAULT FALSE

Indicador booleano de resposta correta

Tabela: usuarios

Coluna

Tipo

Nulo

Restrição

Descrição

id

SERIAL

NOT NULL

PK

Identificador único do jogador

nome

VARCHAR(100)

NOT NULL

-

Nome informado pelo usuário para a sessão

criado_em

TIMESTAMP

NULL

DEFAULT CURRENT_TIMESTAMP

Data e hora de criação do registo

Tabela: pontuacoes

Coluna

Tipo

Nulo

Restrição

Descrição

id

SERIAL

NOT NULL

PK

Identificador único da pontuação

usuario_id

INT

NOT NULL

FK (usuarios.id)

Chave estrangeira do usuário associado

pontos

INT

NOT NULL

-

Pontuação total obtida na sessão de jogo

data_sessao

TIMESTAMP

NULL

DEFAULT CURRENT_TIMESTAMP

Data e hora de registo da pontuação
