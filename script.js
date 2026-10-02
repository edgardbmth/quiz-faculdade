// ==================================================
// DEV DUEL
// JAVASCRIPT PRINCIPAL
// ==================================================


// ==================================================
// PERGUNTAS
// ==================================================

const perguntas = [

    {
        pergunta:
            "Qual linguagem é utilizada para estruturar páginas web?",

        alternativas: [
            "Python",
            "HTML",
            "SQL",
            "C++"
        ],

        correta: 1
    },

    {
        pergunta:
            "Qual linguagem é utilizada para estilizar páginas web?",

        alternativas: [
            "CSS",
            "Java",
            "Python",
            "C"
        ],

        correta: 0
    },

    {
        pergunta:
            "Qual estrutura pode ser utilizada para repetição em Python?",

        alternativas: [
            "if",
            "print",
            "for",
            "input"
        ],

        correta: 2
    },

    {
        pergunta:
            "Qual símbolo é utilizado para comentários de uma linha em Python?",

        alternativas: [
            "//",
            "/* */",
            "#",
            "<!-- -->"
        ],

        correta: 2
    },

    {
        pergunta:
            "Qual comando é utilizado para exibir informações no Python?",

        alternativas: [
            "show()",
            "print()",
            "displayText()",
            "console()"
        ],

        correta: 1
    }

];


// ==================================================
// VARIÁVEIS
// ==================================================

let perguntaAtual = 0;

let pontuacao = 0;

let respondeu = false;


// ==================================================
// ELEMENTOS
// ==================================================

const modal =
    document.getElementById("modal");

const modalFundo =
    document.getElementById("modalFundo");

const conteudoModal =
    document.getElementById("conteudoModal");

const btnFechar =
    document.getElementById("btnFechar");


// ==================================================
// EVENTOS DOS BOTÕES
// ==================================================

document
    .getElementById("btnComecar")
    .addEventListener(
        "click",
        iniciarQuiz
    );


document
    .getElementById("btnComoFunciona")
    .addEventListener(
        "click",
        comoFunciona
    );


document
    .getElementById("btnConhecimento")
    .addEventListener(
        "click",
        abrirConhecimento
    );


document
    .getElementById("btnDuelo")
    .addEventListener(
        "click",
        iniciarQuiz
    );


document
    .getElementById("btnRanking")
    .addEventListener(
        "click",
        function(event) {

            event.preventDefault();

            abrirRanking();

        }
    );


document
    .getElementById("btnRankingCard")
    .addEventListener(
        "click",
        abrirRanking
    );


btnFechar
    .addEventListener(
        "click",
        fecharModal
    );


modalFundo
    .addEventListener(
        "click",
        fecharModal
    );


// ==================================================
// ABRIR MODAL
// ==================================================

function abrirModal() {

    modal.classList.add("ativo");

    document.body.style.overflow = "hidden";

}


// ==================================================
// FECHAR MODAL
// ==================================================

function fecharModal() {

    modal.classList.remove("ativo");

    document.body.style.overflow = "";

}


// ==================================================
// COMO FUNCIONA
// ==================================================

function comoFunciona() {

    abrirModal();

    conteudoModal.innerHTML = `

        <h2>
            ⓘ Como funciona?
        </h2>

        <p>
            O Dev Duel é um quiz de programação
            criado para testar seus conhecimentos
            em tecnologia.
        </p>

        <p>
            Você responderá perguntas sobre
            HTML, CSS, Python e outros conceitos
            de programação.
        </p>

        <p>
            Cada resposta correta aumenta
            sua pontuação.
        </p>

        <p>
            No final do desafio você poderá
            conferir seu resultado.
        </p>

        <button
            class="botao-modal"
            id="btnComecarComoFunciona">

            COMEÇAR AGORA

        </button>

    `;


    document
        .getElementById(
            "btnComecarComoFunciona"
        )
        .addEventListener(
            "click",
            iniciarQuiz
        );

}


// ==================================================
// CONHECIMENTO
// ==================================================

function abrirConhecimento() {

    abrirModal();

    conteudoModal.innerHTML = `

        <h2>
            &lt;/&gt; Conhecimento
        </h2>

        <p>
            Nesta área você poderá testar
            seus conhecimentos sobre
            programação.
        </p>

        <p>
            As perguntas abordam conceitos
            básicos de desenvolvimento,
            como HTML, CSS e Python.
        </p>

        <p>
            Escolha uma alternativa e veja
            imediatamente se sua resposta
            está correta.
        </p>

        <button
            class="botao-modal"
            id="btnIniciarConhecimento">

            INICIAR DESAFIO

        </button>

    `;


    document
        .getElementById(
            "btnIniciarConhecimento"
        )
        .addEventListener(
            "click",
            iniciarQuiz
        );

}


// ==================================================
// INICIAR QUIZ
// ==================================================

function iniciarQuiz() {

    perguntaAtual = 0;

    pontuacao = 0;

    respondeu = false;

    abrirModal();

    mostrarPergunta();

}


// ==================================================
// MOSTRAR PERGUNTA
// ==================================================

function mostrarPergunta() {

    const pergunta =
        perguntas[perguntaAtual];


    respondeu = false;


    const porcentagem =
        (
            (perguntaAtual + 1)
            /
            perguntas.length
        )
        *
        100;


    let alternativasHTML = "";


    pergunta.alternativas.forEach(
        function(alternativa, index) {

            alternativasHTML += `

                <button
                    class="quiz-alternativa"
                    data-index="${index}">

                    <strong>
                        ${String.fromCharCode(65 + index)}.
                    </strong>

                    ${alternativa}

                </button>

            `;

        }
    );


    conteudoModal.innerHTML = `

        <div class="quiz-status">

            Pergunta
            ${perguntaAtual + 1}
            de
            ${perguntas.length}

        </div>


        <div class="barra">

            <div
                style="width: ${porcentagem}%">
            </div>

        </div>


        <div class="quiz-pergunta">

            ${pergunta.pergunta}

        </div>


        <div class="quiz-alternativas">

            ${alternativasHTML}

        </div>

    `;


    const botoes =
        document.querySelectorAll(
            ".quiz-alternativa"
        );


    botoes.forEach(
        function(botao) {

            botao.addEventListener(
                "click",
                function() {

                    const resposta =
                        Number(
                            botao.dataset.index
                        );

                    responder(resposta);

                }
            );

        }
    );

}


// ==================================================
// RESPONDER
// ==================================================

function responder(resposta) {

    if (respondeu) {
        return;
    }


    respondeu = true;


    const pergunta =
        perguntas[perguntaAtual];


    const botoes =
        document.querySelectorAll(
            ".quiz-alternativa"
        );


    botoes.forEach(
        function(botao, index) {

            botao.disabled = true;


            if (
                index ===
                pergunta.correta
            ) {

                botao.classList.add(
                    "correta"
                );

            }


            if (
                index === resposta &&
                index !== pergunta.correta
            ) {

                botao.classList.add(
                    "errada"
                );

            }

        }
    );


    if (
        resposta ===
        pergunta.correta
    ) {

        pontuacao += 10;

    }


    setTimeout(
        function() {

            perguntaAtual++;


            if (
                perguntaAtual <
                perguntas.length
            ) {

                mostrarPergunta();

            }

            else {

                mostrarResultado();

            }

        },
        900
    );

}


// ==================================================
// RESULTADO
// ==================================================

function mostrarResultado() {

    let mensagem = "";


    if (pontuacao === 50) {

        mensagem =
            "🏆 PERFEITO! Você dominou o Dev Duel!";

    }

    else if (pontuacao >= 30) {

        mensagem =
            "🔥 MUITO BOM! Você está evoluindo muito!";

    }

    else if (pontuacao >= 20) {

        mensagem =
            "💻 BOM TRABALHO! Continue praticando!";

    }

    else {

        mensagem =
            "📚 CONTINUE ESTUDANDO! A prática leva à evolução!";

    }


    salvarPontuacao(pontuacao);


    conteudoModal.innerHTML = `

        <div class="resultado">

            <div class="icone">
                🏆
            </div>


            <h2>
                Desafio Finalizado!
            </h2>


            <p class="pontos">
                ${pontuacao}/50
            </p>


            <p>
                ${mensagem}
            </p>


            <button
                class="botao-modal"
                id="btnJogarNovamente">

                🔄 JOGAR NOVAMENTE

            </button>


            <br>


            <button
                class="btn-secondary"
                id="btnVoltarInicio"
                style="margin-top: 15px;">

                VOLTAR PARA INÍCIO

            </button>

        </div>

    `;


    document
        .getElementById(
            "btnJogarNovamente"
        )
        .addEventListener(
            "click",
            iniciarQuiz
        );


    document
        .getElementById(
            "btnVoltarInicio"
        )
        .addEventListener(
            "click",
            fecharModal
        );

}


// ==================================================
// RANKING
// ==================================================

function abrirRanking() {

    abrirModal();


    const melhorPontuacao =
        localStorage.getItem(
            "devDuelMelhorPontuacao"
        );


    let resultado = "";


    if (melhorPontuacao !== null) {

        resultado = `

            <div class="ranking-item">

                <span>
                    🧑‍💻 Sua melhor pontuação
                </span>

                <strong>
                    ${melhorPontuacao} pts
                </strong>

            </div>

        `;

    }

    else {

        resultado = `

            <div class="ranking-item">

                <span>
                    🧑‍💻 Sua pontuação
                </span>

                <strong>
                    Nenhuma ainda
                </strong>

            </div>

        `;

    }


    conteudoModal.innerHTML = `

        <div class="resultado">

            <div class="icone">
                🏆
            </div>

            <h2>
                Ranking
            </h2>

        </div>


        ${resultado}


        <div class="ranking-item">

            <span>
                🥇 Jogador 1
            </span>

            <strong>
                50 pts
            </strong>

        </div>


        <div class="ranking-item">

            <span>
                🥈 Jogador 2
            </span>

            <strong>
                40 pts
            </strong>

        </div>


        <div class="ranking-item">

            <span>
                🥉 Jogador 3
            </span>

            <strong>
                30 pts
            </strong>

        </div>


        <button
            class="botao-modal"
            id="btnFecharRanking">

            FECHAR

        </button>

    `;


    document
        .getElementById(
            "btnFecharRanking"
        )
        .addEventListener(
            "click",
            fecharModal
        );

}


// ==================================================
// SALVAR MELHOR PONTUAÇÃO
// ==================================================

function salvarPontuacao(pontos) {

    const atual =
        Number(
            localStorage.getItem(
                "devDuelMelhorPontuacao"
            )
        ) || 0;


    if (pontos > atual) {

        localStorage.setItem(
            "devDuelMelhorPontuacao",
            pontos
        );

    }

}


// ==================================================
// TECLA ESC
// ==================================================

document.addEventListener(
    "keydown",
    function(event) {

        if (
            event.key === "Escape"
        ) {

            fecharModal();

        }

    }
);