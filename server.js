require('dotenv').config();
const express = require('express');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');

const app = express();
const porta = process.env.PORT || 3000;

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// Rota de perguntas ajustada para evitar erros de Foreign Key no Supabase
app.get('/api/perguntas', async (req, res) => {
  try {
    // 1. Busca todas as perguntas
    const { data: perguntas, error: errPerguntas } = await supabase.from('perguntas').select('*');
    if (errPerguntas) throw errPerguntas;

    // 2. Busca todas as opções de resposta
    const { data: opcoes, error: errOpcoes } = await supabase.from('opcoes').select('*');
    if (errOpcoes) throw errOpcoes;

    // 3. Combina as opções dentro de cada pergunta correspondente
    const perguntasComOpcoes = perguntas.map(pergunta => {
      return {
        ...pergunta,
        opcoes: opcoes.filter(opcao => opcao.pergunta_id === pergunta.id)
      };
    });

    res.json(perguntasComOpcoes);
  } catch (error) {
    console.error("Erro ao carregar perguntas:", error.message);
    res.status(500).json({ erro: error.message });
  }
});

app.post('/api/pontuacao', async (req, res) => {
  const { nome_jogador, pontos } = req.body; 

  const { data, error } = await supabase
    .from('pontuacoes')
    .insert([{ nome_jogador: nome_jogador, pontos: pontos }]);

  if (error) {
    console.error("Erro ao salvar pontuação:", error.message);
    return res.status(500).json({ erro: error.message });
  }

  res.json({ mensagem: 'Pontuação salva com sucesso!' });
});

app.get('/api/ranking', async (req, res) => {
  const { data, error } = await supabase
    .from('pontuacoes')
    .select('nome_jogador, pontos')
    .order('pontos', { ascending: false })
    .limit(5);

  if (error) {
    console.error("Erro ao carregar ranking:", error.message);
    return res.status(500).json({ erro: error.message });
  }

  res.json(data);
});

app.listen(porta, () => {
  console.log(`Servidor a rodar na porta ${porta}`);
});