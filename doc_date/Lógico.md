# Modelo Lógico, Normalização e Dicionário de Dados — Dev Duel

## 1. Mapeamento Lógico

1. **categoria (1) -> pergunta (N):** A chave primária `id_categoria` é mapeada como chave estrangeira `id_categoria` na tabela `pergunta` (NOT NULL).
2. **publicador (1) -> fonte (N):** A chave primária `id_publicador` é mapeada como chave estrangeira `id_publicador` na tabela `fonte` (NOT NULL).
3. **idioma (1) -> fonte (N):** A chave primária `codigo_idioma` é mapeada como chave estrangeira `codigo_idioma` na tabela `fonte` (NOT NULL).
4. **fonte (1) -> pergunta (N):** A chave primária `id_fonte` é mapeada como chave estrangeira `id_fonte` na tabela `pergunta` (NOT NULL).
5. **alternativa (1) -> pergunta (N):** A chave primária `id_alternativa` é mapeada como chave estrangeira `id_alternativa_correta` na tabela `pergunta` (NOT NULL).

---

## 2. Normalização

### Dependências Funcionais (DF)
* `id_categoria` -> `nome` [RD01]
* `id_publicador` -> `nome` [RD03]
* `codigo_idioma` -> `descricao` [RD04]
* `id_fonte` -> `titulo`, `url`, `id_publicador`, `codigo_idioma` [RD02]
* `id_alternativa` -> `rotulo`, `valor_logico` [RD05]
* `id_pergunta` -> `codigo_fact`, `titulo`, `enunciado`, `explicacao`, `id_categoria`, `id_fonte`, `id_alternativa_correta` [RD08, RD09]

### Análise das Formas Normais
* **1FN (Primeira Forma Normal):** Todos os atributos possuem valores atômicos e indivisíveis. Não há grupos repetitivos ou listas de opções gravadas em campos compostos dentro da tabela `pergunta`.
* **2FN (Segunda Forma Normal):** Todas as tabelas possuem chaves primárias simples (`id_*` ou `codigo_idioma`). Portanto, não existem dependências funcionais parciais de chave composta.
* **3FN (Terceira Forma Normal):** Não há dependências transitivas entre atributos não-chave. Atributos como nome da categoria, dados do publicador e URL da fonte estão isolados em suas respectivas tabelas.

---

## 3. Dicionário de Dados

### Tabela: `categoria`
| Coluna | Tipo | Nulo | Restrição | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `id_categoria` | SERIAL | NOT NULL | PK | Identificador único da categoria |
| `nome` | VARCHAR(100) | NOT NULL | UNIQUE | Nome da categoria de informática |

### Tabela: `publicador`
| Coluna | Tipo | Nulo | Restrição | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `id_publicador` | SERIAL | NOT NULL | PK | Identificador único do publicador |
| `nome` | VARCHAR(150) | NOT NULL | UNIQUE | Nome da banca examinadora ou editora |

### Tabela: `idioma`
| Coluna | Tipo | Nulo | Restrição | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `codigo_idioma` | VARCHAR(10) | NOT NULL | PK | Código ISO/BCP do idioma (ex: pt-BR) |
| `descricao` | VARCHAR(50) | NOT NULL | - | Descrição por extenso do idioma |

### Tabela: `fonte`
| Coluna | Tipo | Nulo | Restrição | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `id_fonte` | SERIAL | NOT NULL | PK | Identificador único da fonte |
| `titulo` | VARCHAR(200) | NOT NULL | - | Título da obra, artigo ou edital |
| `url` | VARCHAR(500) | NOT NULL | UNIQUE | Endereço WEB de acesso à fonte |
| `id_publicador` | INTEGER | NOT NULL | FK (publicador.id_publicador) | Chave estrangeira do publicador |
| `codigo_idioma` | VARCHAR(10) | NOT NULL | FK (idioma.codigo_idioma) | Chave estrangeira do idioma |

### Tabela: `alternativa`
| Coluna | Tipo | Nulo | Restrição | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `id_alternativa` | SERIAL | NOT NULL | PK | Identificador único da alternativa |
| `rotulo` | VARCHAR(50) | NOT NULL | - | Rótulo de exibição (ex: Certo, Errado) |
| `valor_logico` | BOOLEAN | NOT NULL | - | Valor booleano (TRUE/FALSE) |

### Tabela: `pergunta`
| Coluna | Tipo | Nulo | Restrição | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `id_pergunta` | SERIAL | NOT NULL | PK | Identificador chave primária |
| `codigo_fact` | VARCHAR(20) | NOT NULL | UNIQUE | Código estável da carga (ex: fact-001) |
| `titulo` | VARCHAR(150) | NOT NULL | - | Título resumido do tópico |
| `enunciado` | TEXT | NOT NULL | - | Texto completo da afirmativa do concurso |
| `explicacao` | TEXT | NOT NULL | - | Explicação detalhada do gabarito |
| `id_categoria` | INTEGER | NOT NULL | FK (categoria.id_categoria) | Chave estrangeira da categoria |
| `id_fonte` | INTEGER | NOT NULL | FK (fonte.id_fonte) | Chave estrangeira da fonte |
| `id_alternativa_correta`| INTEGER | NOT NULL | FK (alternativa.id_alternativa)| Chave estrangeira da alternativa correta |