// ==========================================================================
// 1. MAPEAMENTO DOS ELEMENTOS DO HTML
// ==========================================================================
let listaDePerguntas = [];
let indicePerguntaAtual = 0; // Adicione esta linha também, se não a tiver

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
let pontuacao = 0;
let respondeuAHRodadaAtual = false;

// Array que receberá os dados do arquivo JSON externo
let perguntasQuiz = []; 

// ==========================================================================
// 1. EVENTO DE INÍCIO DO QUIZ (RQ01)
// ==========================================================================
formLogin.addEventListener('submit', function(evento) {
    evento.preventDefault(); 
    const nomeDigitado = nomeJogadorInput.value.trim();

    // Trava de segurança: impede o avanço se o nome estiver vazio OU se os dados não carregaram
    if (nomeDigitado === "" || listaDePerguntas.length === 0) return;

    jogadorAtual = nomeDigitado;
    telaInicio.classList.add('oculto');
    telaJogo.classList.remove('oculto');
    
    carregarPergunta();
});

// ==========================================================================
// 2. CARREGAR PERGUNTA (Layout Adaptável Dinâmico)
// ==========================================================================
function carregarPergunta() {
    feedbackRespostaSection.classList.add('oculto');
    respondeuAHRodadaAtual = false; 
    
    const dadosPergunta = listaDePerguntas[indicePerguntaAtual];
    
    categoriaPergunta.textContent = dadosPergunta.categoria;
    textoPergunta.textContent = dadosPergunta.enunciado;
    
    // CORREÇÃO: Variável duplicada removida e texto do contador corrigido
    numPerguntaSpan.textContent = `Pergunta ${indicePerguntaAtual + 1} de ${listaDePerguntas.length}`;
    
    const porcentagemProgresso = ((indicePerguntaAtual + 1) / listaDePerguntas.length) * 100;
    barraProgresso.style.width = `${porcentagemProgresso}%`;
    
    listaOpcoesContainer.innerHTML = "";
    
    // Alinha lado a lado se houver até 2 botões (Certo/Errado) aplicando a classe do CSS Grid
    if (dadosPergunta.alternativas.length <= 2) {
        listaOpcoesContainer.classList.add('modo-duas-colunas');
    } else {
        listaOpcoesContainer.classList.remove('modo-duas-colunas');
    }
    
    dadosPergunta.alternativas.forEach((alternativa, index) => {
        const botao = document.createElement('button');
        botao.classList.add('opcao');
        
        // Agora dizemos ao código para puxar exatamente o "texto_alternativa" que vimos no seu print
        botao.textContent = alternativa.texto_alternativa; 
        
        botao.setAttribute('data-index', index);
        botao.setAttribute('tabindex', '0');

        botao.addEventListener('click', function() {
            processarEscolha(index); 
        });

        listaOpcoesContainer.appendChild(botao);
    });
}

// ==========================================================================
// 3. PROCESSAR ESCOLHA E FEEDBACK IMEDIATO (RQ06, RQ03, RNF03, RNF08)
// ==========================================================================
function processarEscolha(indiceSelecionado) {
    // CORREÇÃO: Definidas as variáveis que faltavam nesta função para não dar erro
    const dadosPergunta = listaDePerguntas[indicePerguntaAtual];
    const todosOsBotoes = document.querySelectorAll('.opcao');

    todosOsBotoes.forEach((btn, idx) => {
        btn.classList.add('selecionada');
    });

    // 1. Verifica se a alternativa que o jogador clicou é a verdadeira
    const acertou = dadosPergunta.alternativas[indiceSelecionado].eh_correta === true;

    if (!respondeuAHRodadaAtual) {
        if (acertou) {
            pontuacao++;
        }
        respondeuAHRodadaAtual = true;
    }

    feedbackTitulo.classList.remove('feedback-correto', 'feedback-invertido');

    // 2. Dá o feedback visual (Verde ou Vermelho)
    if (acertou) {
        feedbackTitulo.textContent = "✔ Resposta Correta!";
        feedbackTitulo.className = "feedback-correto";
    } else {
        feedbackTitulo.textContent = "✖ Resposta Incorreta!";
        feedbackTitulo.className = "feedback-incorreto";
    }

    // 3. Mostra a justificativa e o link correto do banco de dados
    feedbackExplicacao.textContent = dadosPergunta.justificativa;
    feedbackFonte.href = dadosPergunta.fonte_url;
    feedbackFonte.textContent = "Saiba mais na fonte";

    feedbackRespostaSection.classList.remove('oculto');
}

// ==========================================================================
// 4. AVANÇAR E CONCLUIR (RQ03, RQ04, RQ05)
// ==========================================================================
btnProxima.addEventListener('click', function() {
    indicePerguntaAtual++;
   if (indicePerguntaAtual < listaDePerguntas.length)  {
        carregarPergunta();
    } else {
        finalizarQuiz();
    }
});

function finalizarQuiz() {
    telaJogo.classList.add('oculto');
    telaFinal.classList.remove('oculto');
    
    // CORREÇÃO: alterado perguntasQuiz para listaDePerguntas
    pontuacaoFinalTexto.innerHTML = `Parabéns, <strong>${jogadorAtual}</strong>!<br>Você pontuou <strong>${pontuacao}</strong> de <strong>${listaDePerguntas.length}</strong> questões.`;
    
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

function exibirPergunta() {
  const perguntaAtual = listaDePerguntas[indicePerguntaAtual];
  
  // CORREÇÃO: texto_da_pergunta alterado para enunciado para não travar
  textoPergunta.innerText = perguntaAtual.enunciado; 
  categoriaPergunta.innerText = perguntaAtual.categoria;
  
  numPerguntaSpan.innerText = `${indicePerguntaAtual + 1} / ${listaDePerguntas.length}`;
  listaOpcoesContainer.innerHTML = "";
}

async function carregarPerguntas() {
  try {
    const resposta = await fetch('http://localhost:3000/api/perguntas');
    listaDePerguntas = await resposta.json();
    
    console.log("Perguntas recebidas do banco:", listaDePerguntas);
    
    // Se vieram perguntas do banco, exibe a primeira na tela
    if (listaDePerguntas.length > 0) {
      exibirPergunta();
    }
    
  } catch (erro) {
    console.error("Erro ao buscar perguntas:", erro);
  }
}
carregarPerguntas();