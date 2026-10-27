# 📚 Projeto Quiz - Trabalho Acadêmico (Dev Duel / Tech Trivia)

⚠️ **STATUS: Em Desenvolvimento (Work in Progress)** ⚠️

Este repositório contém o código-fonte do **Dev Duel**, uma aplicação web de Quiz interativo desenvolvida para treino e fixação de conhecimentos em Tecnologia da Informação e Concursos Públicos.

**Importante:** Este projeto é um **trabalho de faculdade feito em grupo** e não um projeto individual. Atualmente, a aplicação está em fase de construção e novas funcionalidades estão sendo adicionadas continuamente pela equipe.

---

## 👥 Equipe de Desenvolvimento (Grupo 6)
- **Edgard Aparecido**
- **Adriano Muniz**
- **Higor da Silva**
- **Enzo Moreira**
- **José Renato Bettuz**

---

## 🛠️ Tecnologias Utilizadas

O projeto está sendo desenvolvido utilizando uma arquitetura Full Stack com as seguintes tecnologias:

**Front-end:**
- HTML5 (15.8%)
- CSS3 (16.4%)
- JavaScript Vanilla (33.2%)

**Back-end & Banco de Dados:**
- Node.js & Express.js
- Supabase (PostgreSQL - PL/pgSQL 26.6%)
- Python (8.0%)
- Render (Hospedagem do servidor)

---

## 📌 Funcionalidades Principais
- Lista de perguntas dinâmicas divididas por categorias técnicas.
- Feedback imediato com gabarito comentado, explicação e link da fonte oficial.
- Embaralhamento automático de alternativas a cada rodada.
- Registro e exibição do Top 5 no Ranking da Sessão.

---

## 🔌 Endpoints da API REST

| Método | Rota | Descrição |
| :--- | :--- | :--- |
| `GET` | `/api/perguntas` | Lista as perguntas com suas respectivas alternativas. |
| `POST` | `/api/pontuacao` | Salva a pontuação da sessão do usuário. |
| `GET` | `/api/ranking` | Traz as 5 melhores pontuações registradas. |

---

## 🚀 Como rodar o projeto localmente

Como o projeto possui um back-end em Node.js e comunicação com um banco de dados no Supabase, é necessário configurar o ambiente local para testá-lo.

### Pré-requisitos
- [Node.js](https://nodejs.org/) instalado.
- [Git](https://git-scm.com/) instalado.

### Passo a Passo

1. **Clone o repositório:**
   ```bash
   git clone [https://github.com/edgardbmth/quiz-faculdade.git](https://github.com/edgardbmth/quiz-faculdade.git)rdbmth/quiz-faculdade.git](https://github.com/edgardbmth/quiz-faculdade.git)
