// ==========================================================================
// 1. MAPEAMENTO DOS ELEMENTOS DO HTML
// ==========================================================================
const telaInicio = document.getElementById('tela-inicio');
const telaJogo = document.getElementById('tela-jogo');
const telaFinal = document.getElementById('tela-final');
const formLogin = document.getElementById('form-login');
const nomeJogadorInput = document.getElementById('nome-jogador');

const textoPergunta = document.getElementById('texto-pergunta');
const categoriaPergunta = document.getElementById('categoria-pergunta');
const listaOpcoesContainer = document.getElementById('opcoes-resposta');
const numPerguntaSpan = document.getElementById('num-pergunta');
const barraProgresso = document.getElementById('barra-progresso');

const feedbackRespostaSection = document.getElementById('feedback-resposta');
const feedbackTitulo = document.getElementById('feedback-titulo');
const feedbackExplicacao = document.getElementById('feedback-explicacao');
const feedbackFonte = document.getElementById('feedback-fonte');
const btnProxima = document.getElementById('btn-proxima');
const pontuacaoFinalTexto = document.getElementById('pontuacao-final');
const btnReiniciar = document.getElementById('btn-reiniciar');
const corpoRanking = document.getElementById('corpo-ranking');

// Estados globais da sessão
let jogadorAtual = "";
let indicePerguntaAtual = 0;
let pontuacao = 0;
let respondeuAHRodadaAtual = false;

// Array que receberá os dados do arquivo JSON externo
let perguntasQuiz = []; 

// CÓPIA DE SEGURANÇA: Garante o funcionamento caso o navegador bloqueie o fetch local (CORS)
const backupPerguntas = [
    {
        categoria: "História da Computação",
        pergunta: "O primeiro bug da história da computação foi causado por um inseto real (uma mariposa) preso em um relé?",
        alternativas: ["CERTO", "ERRADO"],
        correta: 0,
        justificativa: "O episódio aconteceu em 1947. Uma mariposa real foi encontrada presa no Relé 70 do computador Harvard Mark II.",
        link: "https://wikipedia.org"
    },
    {
        categoria: "Hardware",
        pergunta: "Qual dos seguintes componentes é conhecido como o 'cérebro' do computador, responsável pela execução das instruções de um programa?",
        alternativas: [
            "Memória RAM", 
            "Placa de Vídeo (GPU)", 
            "Unidade Central de Processamento (CPU)", 
            "Disco Rígido (HD/SSD)", 
            "Placa-Mãe"
        ],
        correta: 2,
        justificativa: "A CPU (Central Processing Unit) processa as instruções aritméticas e lógicas que fazem os softwares funcionarem.",
        link: "https://wikipedia.org"
    },
    {
        categoria: "Desenvolvimento Web",
        pergunta: "A linguagem CSS é utilizada exclusivamente para definir a estrutura de blocos e textos de um site?",
        alternativas: ["CERTO", "ERRADO"],
        correta: 1,
        justificativa: "O HTML define a estrutura. O CSS serve para aplicar estilos, cores, layouts e o design visual da interface.",
        link: "https://mozilla.org"
    }
];

// ==========================================================================
// 1B. FUNÇÃO ASSÍNCRONA DA API SIMULADA LOCAL (RQ02 / PREMISSA)
// ==========================================================================
async function carregarPerguntasDaAPI() {
    try {
        // Realiza o fetch no arquivo local agindo como um servidor/banco de dados
        const resposta = await fetch('perguntas.json'); 
        if (!resposta.ok) throw new Error('Arquivo JSON não encontrado.');
        perguntasQuiz = await resposta.json();
        console.log("Sucesso: Dados carregados via API Local (perguntas.json)!");
    } catch (erro) {
        console.warn("Ambiente local sem servidor HTTP. Ativando cópia de segurança para não travar:", erro);
        // Garante o funcionamento offline ou por clique duplo direto na pasta
        perguntasQuiz = backupPerguntas; 
    }
}

// Inicializa a carga assim que o script é lido
carregarPerguntasDaAPI();

// ==========================================================================
// 2. EVENTO DE INÍCIO DO QUIZ (RQ01)
// ==========================================================================
formLogin.addEventListener('submit', function(evento) {
    evento.preventDefault(); 
    const nomeDigitado = nomeJogadorInput.value.trim();

    // Trava de segurança: impede o avanço se o nome estiver vazio OU se os dados não carregaram
    if (nomeDigitado === "" || perguntasQuiz.length === 0) return;

    jogadorAtual = nomeDigitado;
    telaInicio.classList.add('oculto');
    telaJogo.classList.remove('oculto');
    
    carregarPergunta();
});

// ==========================================================================
// 3. CARREGAR PERGUNTA (Layout Adaptável Dinâmico)
// ==========================================================================
function carregarPergunta() {
    feedbackRespostaSection.classList.add('oculto');
    respondeuAHRodadaAtual = false; 
    
    const dadosPergunta = perguntasQuiz[indicePerguntaAtual];
    
    categoriaPergunta.textContent = dadosPergunta.categoria;
    textoPergunta.textContent = dadosPergunta.pergunta;
    numPerguntaSpan.textContent = `Pergunta ${indicePerguntaAtual + 1} de ${perguntasQuiz.length}`;
    
    const porcentagemProgresso = ((indicePerguntaAtual + 1) / perguntasQuiz.length) * 100;
    barraProgresso.style.width = `${porcentagemProgresso}%`;
    
    listaOpcoesContainer.innerHTML = "";
    
    // Alinha lado a lado se houver até 2 botões (Certo/Errado) aplicando a classe do CSS Grid
    if (dadosPergunta.alternativas.length <= 2) {
        listaOpcoesContainer.classList.add('modo-duas-colunas');
    } else {
        listaOpcoesContainer.classList.remove('modo-duas-colunas');
    }
    
    dadosPergunta.alternativas.forEach((textoAlternativa, index) => {
        const botao = document.createElement('button');
        botao.classList.add('opcao');
        botao.textContent = textoAlternativa;
        botao.setAttribute('data-index', index);
        botao.setAttribute('tabindex', '0'); // RNF06 & RNF07

        botao.addEventListener('click', function() {
            processarEscolha(index); // RQ06
        });
        
        listaOpcoesContainer.appendChild(botao);
    });
}

// ==========================================================================
// 4. PROCESSAR ESCOLHA E FEEDBACK IMEDIATO (RQ06, RQ03, RNF03, RNF08)
// ==========================================================================
function processarEscolha(indiceSelecionado) {
    const dadosPergunta = perguntasQuiz[indicePerguntaAtual];
    const todosOsBotoes = listaOpcoesContainer.querySelectorAll('.opcao');
    
    todosOsBotoes.forEach((btn, idx) => {
        btn.classList.remove('selecionada');
        if (idx === indiceSelecionado) {
            btn.classList.add('selecionada');
        }
    });

    if (!respondeuAHRodadaAtual) {
        if (indiceSelecionado === dadosPergunta.correta) {
            pontuacao++;
        }
        respondeuAHRodadaAtual = true;
    }

    feedbackTitulo.classList.remove('feedback-correto', 'feedback-invertido');
    
    if (indiceSelecionado === dadosPergunta.correta) {
        feedbackTitulo.textContent = "✔ Resposta Correta!";
        feedbackTitulo.className = "feedback-correto";
    } else {
        feedbackTitulo.textContent = "✖ Resposta Incorreta";
        feedbackTitulo.className = "feedback-incorreto";
    }

    feedbackExplicacao.textContent = dadosPergunta.justificativa;
    feedbackFonte.href = dadosPergunta.link;
    feedbackFonte.textContent = "Saiba mais na fonte";
    
    feedbackRespostaSection.classList.remove('oculto');
}

// ==========================================================================
// 5. AVANÇAR E CONCLUIR (RQ03, RQ04, RQ05)
// ==========================================================================
btnProxima.addEventListener('click', function() {
    indicePerguntaAtual++;
    if (indicePerguntaAtual < perguntasQuiz.length) {
        carregarPergunta();
    } else {
        finalizarQuiz();
    }
});

function finalizarQuiz() {
    telaJogo.classList.add('oculto');
    telaFinal.classList.remove('oculto');
    
    pontuacaoFinalTexto.innerHTML = `Parabéns, <strong>${jogadorAtual}</strong>!<br>Você pontuou <strong>${pontuacao}</strong> de <strong>${perguntasQuiz.length}</strong> questões.`;
    
    gerenciarRankingStorage();
}

function gerenciarRankingStorage() {
    const novoResultado = { nome: jogadorAtual, pontos: pontuacao };
    let listaRanking = JSON.parse(sessionStorage.getItem('rankingQuiz')) || [];
    
    listaRanking.push(novoResultado);
    listaRanking.sort((a, b) => b.pontos - a.pontos);
    sessionStorage.setItem('rankingQuiz', JSON.stringify(listaRanking));
    
    corpoRanking.innerHTML = "";
    listaRanking.forEach((jogador, index) => {
        const linha = document.createElement('tr');
        linha.innerHTML = `
            <td><span class="posicao-num">${index + 1}º</span></td>
            <td><strong>${jogador.nome}</strong></td>
            <td><span style="color: var(--neon-cyan); font-weight: bold;">${jogador.pontos} pts</span></td>
        `;
        corpoRanking.appendChild(linha);
    });
}

btnReiniciar.addEventListener('click', function() {
    indicePerguntaAtual = 0;
    pontuacao = 0;
    nomeJogadorInput.value = "";
    telaFinal.classList.add('oculto');
    telaInicio.classList.remove('oculto');
});
