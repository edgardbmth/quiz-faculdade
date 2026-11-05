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

// Rota de perguntas estruturada de forma robusta
app.get('/api/perguntas', async (req, res) => {
  try {
    // Busca todas as perguntas e opções usando as tabelas do projeto
    const { data: perguntasData, error: errP } = await supabase.from('perguntas').select('*');
    if (errP) throw errP;

    const { data: opcoesData, error: errO } = await supabase.from('opcoes').select('*');
    if (errO) throw errO;

    // Agrupa as opções nas respetivas perguntas com base na chave estrangeira pergunta_id
    const resultado = perguntasData.map(pergunta => {
      const opcoesDaPergunta = opcoesData
        .filter(op => op.pergunta_id === pergunta.id)
        .map(op => ({
          id: op.id,
          texto_opcao: op.texto_opcao,
          eh_correta: op.eh_correta
        }));

      return {
        id: pergunta.id,
        enunciado: pergunta.enunciado,
        contexto: pergunta.contexto,
        explicacao: pergunta.explicacao,
        fonte_nome: pergunta.fonte_nome,
        fonte_url: pergunta.fonte_url,
        opcoes: opcoesDaPergunta
      };
    });

    res.json(resultado);
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