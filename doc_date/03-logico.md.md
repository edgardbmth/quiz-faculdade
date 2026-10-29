# Modelo Lógico, Normalização e Dicionário de Dados — Dev Duel

## 1. Mapeamento Lógico

1. **categorias (1) -> perguntas (N):** A chave primária `id` da tabela `categorias` é mapeada como chave estrangeira `categoria_id` na tabela `perguntas` (NOT NULL).
2. **perguntas (1) -> opcoes (N):** A chave primária `id` da tabela `perguntas` é mapeada como chave estrangeira `pergunta_id` na tabela `opcoes` (NOT NULL).
3. **usuarios (1) -> pontuacoes (N):** A chave primária `id` da tabela `usuarios` é mapeada como chave estrangeira `usuario_id` na tabela `pontuacoes` (NOT NULL).

---

## 2. Normalização

### Dependências Funcionais (DF)
* `id` -> `nome` [categorias]
* `id` -> `categoria_id`, `enunciado`, `contexto`, `explicacao`, `fonte_nome`, `fonte_url` [perguntas]
* `id` -> `pergunta_id`, `texto_opcao`, `eh_correta` [opcoes]
* `id` -> `nome`, `criado_em` [usuarios]
* `id` -> `usuario_id`, `pontos`, `data_sessao` [pontuacoes]

### Análise das Formas Normais
* **1FN (Primeira Forma Normal):** Todos os atributos possuem valores atômicos e indivisíveis. Não há grupos repetitivos ou listas de opções gravadas em campos compostos dentro da tabela de perguntas.
* **2FN (Segunda Forma Normal):** Todas as tabelas possuem chaves primárias simples (`id`). Portanto, não existem dependências funcionais parciais de chave composta.
* **3FN (Terceira Forma Normal):** Não há dependências transitivas entre atributos não-chave. Atributos descritivos e relacionais encontram-se devidamente isolados nas respetivas entidades estruturadas.

---

## 3. Dicionário de Dados

### Tabela: `categorias`
| Coluna | Tipo | Nulo | Restrição | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `id` | SERIAL | NOT NULL | PK | Identificador único da categoria |
| `nome` | VARCHAR(100) | NOT NULL | UNIQUE | Nome do tema de tecnologia |

### Tabela: `perguntas`
| Coluna | Tipo | Nulo | Restrição | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `id` | SERIAL | NOT NULL | PK | Identificador único da pergunta |
| `categoria_id` | INT | NOT NULL | FK (categorias.id) | Chave estrangeira da categoria |
| `enunciado` | TEXT | NOT NULL | - | Texto completo da afirmativa da questão |
| `contexto` | TEXT | - | - | Contexto ou fato histórico introduzido |
| `explicacao` | TEXT | NOT NULL | - | Explicação detalhada do gabarito |
| `fonte_nome` | VARCHAR(150) | NOT NULL | - | Nome da instituição ou site da fonte |
| `fonte_url` | TEXT | NOT NULL | - | Link direto para a fonte oficial |

### Tabela: `opcoes`
| Coluna | Tipo | Nulo | Restrição | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `id` | SERIAL | NOT NULL | PK | Identificador único da opção/alternativa |
| `pergunta_id` | INT | NOT NULL | FK (perguntas.id) | Chave estrangeira da pergunta |
| `texto_opcao` | VARCHAR(50) | NOT NULL | - | Texto de exibição da opção (ex: CERTO / ERRADO) |
| `eh_correta` | BOOLEAN | NOT NULL | DEFAULT FALSE | Indicador lógico se a opção é a resposta certa |

### Tabela: `usuarios`
| Coluna | Tipo | Nulo | Restrição | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `id` | SERIAL | NOT NULL | PK | Identificador único do jogador |
| `nome` | VARCHAR(100) | NOT NULL | - | Nome informado pelo utilizador na sessão |
| `criado_em` | TIMESTAMP | - | DEFAULT CURRENT_TIMESTAMP | Data e hora de registo do utilizador |

### Tabela: `pontuacoes`
| Coluna | Tipo | Nulo | Restrição | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `id` | SERIAL | NOT NULL | PK | Identificador único do registo de pontuação |
| `usuario_id` | INT | NOT NULL | FK (usuarios.id) | Chave estrangeira do utilizador |
| `pontos` | INT | NOT NULL | - | Quantidade de pontos obtidos na partida |
| `data_sessao` | TIMESTAMP | - | DEFAULT CURRENT_TIMESTAMP | Data e hora em que a sessão ocorreu |
