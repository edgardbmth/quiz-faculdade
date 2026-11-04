// ==================================================
// DEV DUEL - JAVASCRIPT PRINCIPAL
// ==================================================

let perguntas = []; 
let perguntaAtual = 0;
let pontuacao = 0;
let respondeu = false;
let nomeJogador = ""; 
let respostaSelecionada = null;

function embaralhar(array) {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
}

const modal = document.getElementById("modal");
const modalFundo = document.getElementById("modalFundo");
const conteudoModal = document.getElementById("conteudoModal");
const btnFechar = document.getElementById("btnFechar");

// Eventos executados assim que a página carrega
document.addEventListener("DOMContentLoaded", function() {
    const btnComecar = document.getElementById("btnComecar");
    const btnComoFunciona = document.getElementById("btnComoFunciona");
    const btnRanking = document.getElementById("btnRanking");
    const btnRankingCard = document.getElementById("btnRankingCard");

    if (btnComecar) btnComecar.addEventListener("click", pedirNome);
    if (btnComoFunciona) btnComoFunciona.addEventListener("click", comoFunciona);

    if (btnRanking) {
        btnRanking.addEventListener("click", function(event) {
            event.preventDefault();
            abrirRanking();
        });
    }

    if (btnRankingCard) {
        btnRankingCard.addEventListener("click", function(event) {
            event.preventDefault();
            abrirRanking();
        });
    }
});

if (btnFechar) btnFechar.addEventListener("click", fecharModal);
if (modalFundo) modalFundo.addEventListener("click", fecharModal);

function abrirModal() {
    modal.classList.add("ativo");
    document.body.style.overflow = "hidden";
}

function fecharModal() {
    modal.classList.remove("ativo");
    document.body.style.overflow = "";
}

function pedirNome() {
    abrirModal();
    conteudoModal.innerHTML = `
        <h2>👋 Quem está a jogar?</h2>
        <p>Digite o seu nome ou apelido para registarmos a sua pontuação no ranking:</p>
        <input type="text" id="inputNomeJogador" placeholder="O seu nome..." autocomplete="off" style="width: 100%; padding: 12px; margin: 15px 0; border-radius: 5px; border: none; font-size: 16px; color: #333; box-sizing: border-box; font-family: inherit;">
        <button class="botao-modal" id="btnConfirmarNome">COMEÇAR DESAFIO</button>
    `;

    document.getElementById("inputNomeJogador").focus();

    document.getElementById("btnConfirmarNome").addEventListener("click", function() {
        const input = document.getElementById("inputNomeJogador").value.trim();
        if (input === "") {
            alert("Por favor, digite um nome para continuar!");
            return;
        }
        nomeJogador = input;
        iniciarQuiz();
    });
}

function comoFunciona() {
    abrirModal();
    conteudoModal.innerHTML = `
        <h2>ⓘ Como funciona?</h2>
        <p>O Dev Duel é um quiz de programação criado para testar os seus conhecimentos em tecnologia.</p>
        <p>Cada resposta correta vale 1 ponto e coloca-o no ranking global.</p>
        <button class="botao-modal" id="btnComecarComoFunciona">COMEÇAR AGORA</button>
    `;
    document.getElementById("btnComecarComoFunciona").addEventListener("click", pedirNome);
}

async function iniciarQuiz() {
    abrirModal();
    conteudoModal.innerHTML = `<h2>A carregar perguntas... ⏳</h2>`;

    try {
        const resposta = await fetch('/api/perguntas');
        const dadosDoBanco = await resposta.json();

        let todasAsPerguntas = dadosDoBanco.map(item => {
            const indiceCorreta = item.opcoes.findIndex(alt => alt.eh_correta === true);
            const textosAlternativas = item.opcoes.map(alt => alt.texto_opcao);
            return {
                pergunta: item.enunciado,
                alternativas: textosAlternativas,
                correta: indiceCorreta,
                fonte: item.fonte_url 
            };
        });

        todasAsPerguntas = embaralhar(todasAsPerguntas);
        perguntas = todasAsPerguntas.slice(0, 10);

        perguntaAtual = 0;
        pontuacao = 0;
        respondeu = false;
        
        mostrarPergunta();

    } catch (erro) {
        conteudoModal.innerHTML = `
            <h2>❌ Erro de Conexão</h2>
            <p>Não foi possível carregar as perguntas da base de dados.</p>
            <button class="botao-modal" id="btnTentarNovamente">TENTAR NOVAMENTE</button>
        `;
        document.getElementById("btnTentarNovamente").addEventListener("click", iniciarQuiz);
    }
}

function mostrarPergunta() {
    const pergunta = perguntas[perguntaAtual];
    respondeu = false;
    respostaSelecionada = null;

    const porcentagem = ((perguntaAtual + 1) / perguntas.length) * 100;
    let alternativasHTML = "";

    pergunta.alternativas.forEach(function(alternativa, index) {
        alternativasHTML += `
            <button class="quiz-alternativa" data-index="${index}" style="text-align: left; width: 100%; padding: 12px; margin: 8px 0; border-radius: 8px; border: 1px solid rgba(255,255,255,0.1); background: rgba(255,255,255,0.05); color: #fff; cursor: pointer; transition: all 0.2s;">
                <strong>${String.fromCharCode(65 + index)}.</strong>
                ${alternativa}
            </button>
        `;
    });

    const linkFonte = pergunta.fonte.startsWith('http') 
        ? pergunta.fonte 
        : `https://www.google.com/search?q=${encodeURIComponent(pergunta.fonte)}`;

    conteudoModal.innerHTML = `
        <div class="quiz-status">Pergunta ${perguntaAtual + 1} de ${perguntas.length}</div>
        <div class="barra"><div style="width: ${porcentagem}%"></div></div>
        
        <div class="quiz-pergunta" style="margin: 15px 0; font-size: 16px; font-weight: bold;">
            ${pergunta.pergunta}
            <div style="font-size: 13px; margin-top: 10px; font-weight: normal; font-style: italic;">
                Fonte: <a href="${linkFonte}" target="_blank" style="color: #4da6ff; text-decoration: underline; cursor: pointer;">
                    ${pergunta.fonte}
                </a>
            </div>
        </div>
        
        <div class="quiz-alternativas">${alternativasHTML}</div>

        <button class="botao-modal" id="btnAvancar" style="margin-top: 20px; width: 100%; opacity: 0.5; cursor: not-allowed;" disabled>
            AVANÇAR ➔
        </button>
    `;

    const botoes = document.querySelectorAll(".quiz-alternativa");
    botoes.forEach(function(botao) {
        botao.addEventListener("click", function() {
            if (respondeu) return;

            botoes.forEach(b => {
                b.style.borderColor = "rgba(255,255,255,0.1)";
                b.style.background = "rgba(255,255,255,0.05)";
            });

            botao.style.borderColor = "#4da6ff";
            botao.style.background = "rgba(77, 166, 255, 0.15)";

            respostaSelecionada = Number(botao.dataset.index);

            const btnAvancar = document.getElementById("btnAvancar");
            btnAvancar.disabled = false;
            btnAvancar.style.opacity = "1";
            btnAvancar.style.cursor = "pointer";
        });
    });

    document.getElementById("btnAvancar").addEventListener("click", function() {
        if (respostaSelecionada === null || respondeu) return;
        processarResposta(respostaSelecionada);
    });
}

function processarResposta(resposta) {
    respondeu = true;
    const pergunta = perguntas[perguntaAtual];
    const botoes = document.querySelectorAll(".quiz-alternativa");

    botoes.forEach(function(botao, index) {
        botao.disabled = true;
        if (index === pergunta.correta) {
            botao.style.borderColor = "#2ecc71";
            botao.style.background = "rgba(46, 204, 113, 0.2)";
        }
        if (index === resposta && index !== pergunta.correta) {
            botao.style.borderColor = "#e74c3c";
            botao.style.background = "rgba(231, 76, 60, 0.2)";
        }
    });

    if (resposta === pergunta.correta) {
        pontuacao += 1;
    }

    const btnAvancar = document.getElementById("btnAvancar");
    btnAvancar.innerText = "A CARREGAR...";

    setTimeout(async function() {
        perguntaAtual++;
        if (perguntaAtual < perguntas.length) {
            mostrarPergunta();
        } else {
            await mostrarResultado();
        }
    }, 1000);
}

async function mostrarResultado() {
    conteudoModal.innerHTML = `<h2>A processar resultado... ⏳</h2>`;
    
    await salvarPontuacao(pontuacao);

    let mensagem = "";
    const pontuacaoMaxima = perguntas.length;

    if (pontuacao === pontuacaoMaxima) {
        mensagem = "🏆 PERFEITO! Dominou o Dev Duel!";
    } else if (pontuacao >= (pontuacaoMaxima * 0.6)) {
        mensagem = "🔥 MUITO BOM! A evoluir bastante!";
    } else if (pontuacao >= (pontuacaoMaxima * 0.4)) {
        mensagem = "💻 BOM TRABALHO! Continue a praticar!";
    } else {
        mensagem = "📚 CONTINUE A ESTUDAR! A prática leva à perfeição!";
    }

    conteudoModal.innerHTML = `
        <div class="resultado">
            <div class="icone">🏆</div>
            <h2>Desafio Finalizado, ${nomeJogador}!</h2>
            <p class="pontos">${pontuacao}/${pontuacaoMaxima}</p>
            <p>${mensagem}</p>
            <button class="botao-modal" id="btnVerRankingFinal" style="margin-top: 15px; background-color: #ff9800; color: white;">🏆 VER RANKING GLOBAL</button>
            <br>
            <button class="botao-modal" id="btnJogarNovamente" style="margin-top: 15px;">🔄 JOGAR NOVAMENTE</button>
            <br>
            <button class="btn-secondary" id="btnVoltarInicio" style="margin-top: 15px;">VOLTAR PARA O INÍCIO</button>
        </div>
    `;

    document.getElementById("btnVerRankingFinal").addEventListener("click", abrirRanking);
    document.getElementById("btnJogarNovamente").addEventListener("click", pedirNome);
    document.getElementById("btnVoltarInicio").addEventListener("click", fecharModal);
}

async function abrirRanking() {
    abrirModal();
    conteudoModal.innerHTML = `
        <div class="resultado">
            <h2>A carregar o Ranking Global... ⏳</h2>
        </div>
    `;

    try {
        const resposta = await fetch('/api/ranking');
        const rankingDB = await resposta.json();

        let resultado = `
            <div class="resultado">
                <div class="icone">🌍</div>
                <h2>Top 5 Global</h2>
            </div>
        `;

        if (rankingDB && rankingDB.length > 0) {
            rankingDB.forEach(function(jogador, index) {
                let medalha = "🏅";
                if (index === 0) medalha = "🥇";
                else if (index === 1) medalha = "🥈";
                else if (index === 2) medalha = "🥉";

                let destaque = (jogador.nome_jogador === nomeJogador) ? 'style="background-color: rgba(255, 215, 0, 0.15); border: 1px solid gold;"' : '';

                resultado += `
                    <div class="ranking-item" ${destaque}>
                        <span>${medalha} ${jogador.nome_jogador || 'Anónimo'}</span>
                        <strong>${jogador.pontos} pts</strong>
                    </div>
                `;
            });
        } else {
            resultado += `<div class="ranking-item"><span>Ainda não há pontuações registadas.</span></div>`;
        }

        resultado += `<button class="botao-modal" id="btnFecharRanking" style="margin-top: 20px;">FECHAR</button>`;
        
        conteudoModal.innerHTML = resultado;
        document.getElementById("btnFecharRanking").addEventListener("click", fecharModal);

    } catch (erro) {
        console.error("Erro ao carregar ranking:", erro);
        conteudoModal.innerHTML = `
            <h2>❌ Erro</h2>
            <p>Não foi possível carregar o ranking da base de dados.</p>
            <button class="botao-modal" id="btnFecharErro">FECHAR</button>
        `;
        document.getElementById("btnFecharErro").addEventListener("click", fecharModal);
    }
}

async function salvarPontuacao(pontos) {
    try {
        await fetch('/api/pontuacao', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ nome_jogador: nomeJogador, pontos: pontos })
        });
    } catch (e) {
        console.error("Erro ao salvar no banco:", e);
    }
}

document.addEventListener("keydown", function(event) {
    if (event.key === "Escape") fecharModal();
});