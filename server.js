require('dotenv').config();
const express = require('express');
const path = require('path'); // Adicionado para indicar caminhos de pastas no servidor
const { createClient } = require('@supabase/supabase-js');

const app = express();

// 1. ALTERAÇÃO PRINCIPAL: Ler a porta dinâmica informada pelo Render (process.env.PORT)
const porta = process.env.PORT || 3000;

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

app.use(express.json());

// 2. ALTERAÇÃO: Usar caminho absoluto para a pasta 'public' (evita falhas em servidores Linux)
app.use(express.static(path.join(__dirname, 'public')));

app.get('/api/perguntas', async (req, res) => {
  const { data, error } = await supabase.from('perguntas').select('*, alternativas(*)');

  if (error) {
    return res.status(500).json({ erro: error.message });
  }
  
  res.json(data); 
});

app.post('/api/pontuacao', async (req, res) => {
  const informacaoDoSite = req.body; 

  const { data, error } = await supabase.from('pontuacoes').insert([informacaoDoSite]);

  if (error) {
    return res.status(500).json({ erro: error.message });
  }

  res.json({ mensagem: 'Pontuação salva com sucesso!' });
});

app.get('/api/ranking', async (req, res) => {
  // Puxa as 5 melhores pontuações do banco de dados, da maior para a menor
  const { data, error } = await supabase
    .from('pontuacoes')
    .select('*')
    .order('pontos', { ascending: false })
    .limit(5);

  if (error) {
    return res.status(500).json({ erro: error.message });
  }

  res.json(data);
});

app.listen(porta, () => {
  console.log(`Servidor rodando na porta ${porta}`);
  console.log('Banco de dados configurado!');
});