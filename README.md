# 📚 Dev Duel (Tech Trivia) — Aplicação Web & Banco de Dados

✅ **STATUS: Projeto Finalizado & Concluído** ✅

O **Dev Duel** é uma plataforma web interativa de treino, fixação e aprendizado ativo de conceitos de Tecnologia da Informação voltada para estudantes, profissionais e candidatos a Concursos Públicos de TI. O sistema combina gamificação com rigor pedagógico, oferecendo questões no estilo Certo/Errado e múltipla escolha, gabaritos comentados com fundamentação técnica, fontes oficiais para consulta e ranking global de pontuações[cite: 13].

---

## 👥 Equipe de Desenvolvimento (Grupo 6)

- **Edgard Aparecido**[cite: 13, 15]
- **Adriano Muniz**[cite: 13, 15]
- **Higor da Silva**[cite: 13, 15]
- **Enzo Moreira**[cite: 13, 15]
- **José Renato Bettuz**[cite: 13, 15]

**Repositório:** [https://github.com/edgardbmth/quiz-faculdade](https://github.com/edgardbmth/quiz-faculdade)[cite: 13]

---

## 🛠️ Arquitetura e Tecnologias Utilizadas

A aplicação foi desenvolvida em uma arquitetura Full Stack desacoplada com persistência de dados relacional[cite: 13]:

- **Front-end:** HTML5, CSS3, JavaScript Vanilla (Interface responsiva, dinâmica e intuitiva)[cite: 13].
- **Back-end & API:** Node.js, Express.js (API RESTful para fornecimento de perguntas, verificação e pontuações)[cite: 13].
- **Banco de Dados:** PostgreSQL (Hospedado no **Supabase**)[cite: 13].
- **Hospedagem & Deploy:** Render (Servidor de Aplicação)[cite: 13].

---

## 📌 Principais Funcionalidades

- **Mapeamento por Categorias:** Organização de questões por temas técnicos (*Redes de Computadores*, *Banco de Dados*, *Linguagem C*, *JavaScript*, *Curiosidades de TI*)[cite: 13].
- **Embaralhamento Dinâmico:** As alternativas são embaralhadas automaticamente a cada rodada de jogo para evitar a memorização de posições[cite: 13].
- **Feedback Pedagógico Imediato:** Exibição do gabarito comentado, explicação da resposta e link direto para a fonte oficial (ex: Documentação do PostgreSQL, MDN Web Docs, cppreference)[cite: 13].
- **Flexibilidade no Formato de Opções:** Suporte estrutural a questões com 2 até 5 alternativas sem necessidade de reestruturação do banco[cite: 13].
- **Ranking Global:** Registro de pontuações de jogadores com identificação por nome e exibição do Top 5 em tempo real[cite: 13].

---

## 🗄️ Estrutura do Banco de Dados

O banco de dados relacional é composto por tabelas normalizadas (até a 3FN)[cite: 13, 18]:

1. `categorias`: Armazena os temas e áreas de TI[cite: 13].
2. `perguntas`: Armazena enunciados, contextos, explicações detalhadas e referências da fonte bibliográfica[cite: 13].
3. `opcoes`: Armazena as alternativas associadas às perguntas, indicando a resposta correta (`eh_correta`)[cite: 13].
4. `usuarios`: Registra os dados do jogador na sessão[cite: 13].
5. `pontuacoes`: Histórico de pontos acumulados com o nome do jogador (`nome_jogador`) e *timestamp* da sessão[cite: 13].

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
- [Node.js](https://nodejs.org/) (versão 16 ou superior)[cite: 13]
- [Git](https://git-scm.com/)[cite: 13]
- Uma conta ativa no [Supabase](https://supabase.com/) configurada com as tabelas do projeto[cite: 13]

### Passo a Passo

1. **Clonar o Repositório:**
   ```bash
   git clone [https://github.com/edgardbmth/quiz-faculdade.git](https://github.com/edgardbmth/quiz-faculdade.git)
   cd quiz-faculdade/quiz-faculdade

### LINK WEB SITE
- (https://quiz-faculdade.onrender.com/#)
