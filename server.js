require('dotenv').config();
const express = require('express');
const { createClient } = require('@supabase/supabase-js');

const app = express();
const porta = 3000;

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

app.use(express.json());
app.use(express.static('public'));

app.get('/api/perguntas', async (req, res) => {
 
  const { data, error } = await supabase.from('perguntas').select('*');

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

app.listen(porta, () => {
  console.log(`Servidor rodando em http://localhost:${porta}`);
  console.log('Banco de dados configurado!');
});

Edgard_fez_essa_parte_hehe