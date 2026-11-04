let respostaSelecionada = null; // Guarda o índice da alternativa escolhida pelo utilizador

function mostrarPergunta() {
    const pergunta = perguntas[perguntaAtual];
    respondeu = false;
    respostaSelecionada = null; // Reseta a seleção para a nova pergunta

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
            if (respondeu) return; // Se já avançou, não deixa mudar

            // Remove a seleção visual de todas e marca a escolhida
            botoes.forEach(b => b.style.borderColor = "rgba(255,255,255,0.1)");
            botoes.forEach(b => b.style.background = "rgba(255,255,255,0.05)");

            botao.style.borderColor = "#4da6ff";
            botao.style.background = "rgba(77, 166, 255, 0.15)";

            respostaSelecionada = Number(botao.dataset.index);

            // Ativa o botão de avançar
            const btnAvancar = document.getElementById("btnAvancar");
            btnAvancar.disabled = false;
            btnAvancar.style.opacity = "1";
            btnAvancar.style.cursor = "pointer";
        });
    });

    // Ação ao clicar no botão Avançar
    document.getElementById("btnAvancar").addEventListener("click", function() {
        if (respostaSelecionada === null || respondeu) return;
        processarResposta(respostaSelecionada);
    });
}

function processarResposta(resposta) {
    respondeu = true;
    const pergunta = perguntas[perguntaAtual];
    const botoes = document.querySelectorAll(".quiz-alternativa");

    // Mostra qual era a certa e a errada visualmente
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

    // Soma ponto se acertou
    if (resposta === pergunta.correta) {
        pontuacao += 1;
    }

    // Muda o botão para "Seguinte" ou avança após um breve momento de feedback
    const btnAvancar = document.getElementById("btnAvancar");
    btnAvancar.innerText = "A CARREGAR...";

    setTimeout(async function() {
        perguntaAtual++;
        if (perguntaAtual < perguntas.length) {
            mostrarPergunta();
        } else {
            await mostrarResultado();
        }
    }, 1000); // Tempo para o utilizador ver a resposta certa/errada antes de mudar
}