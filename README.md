# 📚 Dev Duel (Tech Trivia) — Aplicação Web & Banco de Dados

✅ **STATUS: Projeto Finalizado & Concluído** ✅

O **Dev Duel** é uma plataforma web interativa de treino, fixação e aprendizado ativo de conceitos de Tecnologia da Informação voltada para estudantes, profissionais e candidatos a Concursos Públicos de TI. O sistema combina gamificação com rigor pedagógico, oferecendo questões no estilo Certo/Errado e múltipla escolha, gabaritos comentados com fundamentação técnica, fontes oficiais para consulta e ranking global de pontuações.

---

## 👥 Equipe de Desenvolvimento 

- **Edgard Aparecido**
- **Adriano Muniz**
- **Higor da Silva**
- **Enzo Moreira**
- **José Renato Bettuz**

**Repositório:** [https://github.com/edgardbmth/quiz-faculdade](https://github.com/edgardbmth/quiz-faculdade)

---

## 🛠️ Arquitetura e Tecnologias Utilizadas

A aplicação foi desenvolvida em uma arquitetura Full Stack desacoplada com persistência de dados relacional:

- **Front-end:** HTML5, CSS3, JavaScript Vanilla (Interface responsiva, dinâmica e intuitiva).
- **Back-end & API:** Node.js, Express.js (API RESTful para fornecimento de perguntas, verificação e pontuações).
- **Banco de Dados:** PostgreSQL (Hospedado no **Supabase**).
- **Hospedagem & Deploy:** Render (Servidor de Aplicação).

---

## 📌 Principais Funcionalidades

- **Mapeamento por Categorias:** Organização de questões por temas técnicos (*Redes de Computadores*, *Banco de Dados*, *Linguagem C*, *JavaScript*, *Curiosidades de TI*).
- **Embaralhamento Dinâmico:** As alternativas são embaralhadas automaticamente a cada rodada de jogo para evitar a memorização de posições.
- **Feedback Pedagógico Imediato:** Exibição do gabarito comentado, explicação da resposta e link direto para a fonte oficial (ex: Documentação do PostgreSQL, MDN Web Docs, cppreference).
- **Flexibilidade no Formato de Opções:** Suporte estrutural a questões com 2 até 5 alternativas sem necessidade de reestruturação do banco.
- **Ranking Global:** Registro de pontuações de jogadores com identificação por nome e exibição do Top 5 em tempo real.

---

## 🗄️ Estrutura do Banco de Dados

O banco de dados relacional é composto por tabelas normalizadas (até a 3FN):

1. `categorias`: Armazena os temas e áreas de TI.
2. `perguntas`: Armazena enunciados, contextos, explicações detalhadas e referências da fonte bibliográfica.
3. `opcoes`: Armazena as alternativas associadas às perguntas, indicando a resposta correta (`eh_correta`).
4. `usuarios`: Registra os dados do jogador na sessão.
5. `pontuacoes`: Histórico de pontos acumulados com o nome do jogador (`nome_jogador`) e *timestamp* da sessão.

---

## 🔌 Endpoints da API REST

| Método | Rota | Descrição |
| :--- | :--- | :--- |
| `GET` | `/api/perguntas` | Retorna as perguntas cadastradas com suas respectivas alternativas em formato JSON. |
| `POST` | `/api/pontuacao` | Registra a pontuação obtida pelo jogador na sessão. |
| `GET` | `/api/ranking` | Retorna as maiores pontuações registradas no ranking (Top 5). |

---

## 🚀 Como Rodar o Projeto Localmente

### Pré-requisitos
- [Node.js](https://nodejs.org/) (versão 16 ou superior)
- [Git](https://git-scm.com/)
- Uma conta ativa no [Supabase](https://supabase.com/) configurada com as tabelas do projeto

### Passo a Passo

1. **Clonar o Repositório:**
   ```bash
   git clone [https://github.com/edgardbmth/quiz-faculdade.git](https://github.com/edgardbmth/quiz-faculdade.git)
   cd quiz-faculdade/quiz-faculdade

### LINK WEB SITE
- (https://quiz-faculdade.onrender.com/#)
