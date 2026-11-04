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

app.get('/api/perguntas', async (req, res) => {
  const { data, error } = await supabase.from('perguntas').select('*, opcoes(*)');
  if (error) return res.status(500).json({ erro: error.message });
  res.json(data); 
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