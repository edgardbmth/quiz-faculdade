CREATE TABLE perguntas (
    id SERIAL PRIMARY KEY,
    categoria VARCHAR(100) NOT NULL,
    enunciado TEXT NOT NULL,
    justificativa TEXT NOT NULL,
    fonte_url TEXT NOT NULL
);

CREATE TABLE alternativas (
    id SERIAL PRIMARY KEY,
    pergunta_id INT NOT NULL REFERENCES perguntas(id) ON DELETE CASCADE,
    texto_alternativa TEXT NOT NULL,
    eh_correta BOOLEAN NOT NULL DEFAULT FALSE
);

-- =============================================
-- HARDWARE E ARQUITETURA (1 a 5)
-- =============================================

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(1 , 'Hardware e Arquitetura', 'Qual componente de um computador é responsável por realizar as operações aritméticas e lógicas, sendo considerado o "cérebro" do processador?', 'A Unidade Lógica e Aritmética (ULA) é a parte da CPU responsável pelas operações aritméticas e lógicas.', 'VUNESP - Câmara de Sertãozinho/SP');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(1, 'Memória RAM', FALSE),
(1, 'Placa-mãe', FALSE),
(1, 'Unidade Lógica e Aritmética (ULA)', TRUE),
(1, 'Disco Rígido (HD)', FALSE),
(1, 'Fonte de Alimentação', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(2, 'Hardware e Arquitetura', 'Em relação às memórias de um computador, assinale a alternativa que apresenta uma memória do tipo volátil:', 'A memória RAM é volátil, ou seja, perde os dados quando o computador é desligado.', 'IBFC - EBSERH');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(2, 'ROM', FALSE),
(2, 'Flash (Pendrive)', FALSE),
(2, 'RAM', TRUE),
(2, 'Hard Disk (HD)', FALSE),
(2, 'SSD', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(3 ,'Hardware e Arquitetura', 'O barramento responsável por transportar o endereço de memória ou de dispositivo de E/S com o qual o processador deseja se comunicar é chamado de:', 'O Barramento de Endereços carrega a informação de qual posição de memória ou dispositivo o processador quer acessar.', 'QUADRIX - CRN-3');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(3, 'Barramento de Dados', FALSE),
(3, 'Barramento de Endereços', TRUE),
(3, 'Barramento de Controle', FALSE),
(3, 'Barramento Serial (USB)', FALSE),
(3, 'Barramento SATA', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(4 ,'Hardware e Arquitetura', 'Qual das opções a seguir representa o barramento/interface comumente empregado para conexão interna de SSDs de altíssima velocidade em placas-mãe modernas?', 'O M.2 NVMe é o padrão atual para SSDs de alta velocidade conectados diretamente na placa-mãe.', 'FGV - IMBEL');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(4, 'M.2 NVMe', TRUE),
(4, 'VGA', FALSE),
(4, 'RS-232', FALSE),
(4, 'Parallel ATA (IDE)', FALSE),
(4, 'PS/2', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(5, 'Hardware e Arquitetura', 'A memória cache é uma memória de alta velocidade que fica posicionada entre o processador e a memória principal (RAM), com o objetivo de acelerar o acesso aos dados mais frequentemente utilizados.', 'A afirmação está correta. A cache reduz a latência de acesso aos dados mais usados pelo processador.', 'Cebraspe / CESPE - INSS');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(5, 'CERTO', TRUE),
(5, 'ERRADO', FALSE);

-- =============================================
-- REDES DE COMPUTADORES (6 a 10)
-- =============================================

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(6, 'Redes de Computadores', 'No modelo de referência OSI, a camada encarregada do roteamento dos pacotes através da rede, definindo os endereços IP de origem e destino, é a camada de:', 'A Camada de Rede (Camada 3) é responsável pelo endereçamento lógico (IP) e pelo roteamento.', 'FCC - APEX-Brasil');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(6, 'Enlace', FALSE),
(6, 'Transporte', FALSE),
(6, 'Rede', TRUE),
(6, 'Sessão', FALSE),
(6, 'Aplicação', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(7, 'Redes de Computadores', 'Qual protocolo é responsável por atribuir dinamicamente configurações de rede (como endereço IP, máscara e gateway) aos dispositivos conectados?', 'O DHCP (Dynamic Host Configuration Protocol) distribui automaticamente os parâmetros de rede.', 'IBFC - MGS');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(7, 'DNS', FALSE),
(7, 'DHCP', TRUE),
(7, 'FTP', FALSE),
(7, 'SMTP', FALSE),
(7, 'ICMP', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(8, 'Redes de Computadores', 'Em uma rede local (LAN) ethernet, o dispositivo de camada de enlace (Camada 2) que conecta múltiplos equipamentos e utiliza a tabela MAC para encaminhar quadros apenas para a porta de destino correta é o:', 'O Switch trabalha na camada 2 e encaminha os frames com base no endereço MAC.', 'VUNESP - Prefeitura de Osasco/SP');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(8, 'Hub', FALSE),
(8, 'Switch', TRUE),
(8, 'Modem', FALSE),
(8, 'Repetidor', FALSE),
(8, 'Patch Panel', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(9, 'Redes de Computadores', 'O protocolo responsável por traduzir nomes de domínio amigáveis (como www.exemplo.com.br) em endereços IP numéricos é o:', 'O DNS (Domain Name System) faz a tradução de nomes para endereços IP.', 'QUADRIX - CRB-6');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(9, 'HTTP', FALSE),
(9, 'SNMP', FALSE),
(9, 'SSH', FALSE),
(9, 'DNS', TRUE),
(9, 'ARP', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(10, 'Redes de Computadores', 'O protocolo HTTPS utiliza a porta TCP 443 por padrão para realizar a comunicação segura e criptografada entre um navegador e um servidor web.', 'A afirmação está correta. A porta padrão do HTTPS é a 443.', 'Cebraspe / CESPE - Polícia Federal');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(10, 'CERTO', TRUE),
(10, 'ERRADO', FALSE);

-- =============================================
-- SISTEMAS OPERACIONAIS (11 a 15)
-- =============================================

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(11, 'Sistemas Operacionais', 'No sistema operacional Linux, qual comando é utilizado no terminal para listar o conteúdo do diretório atual?', 'O comando ls (list) lista os arquivos e pastas do diretório atual.', 'FGV - MPERJ');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(11, 'cd', FALSE),
(11, 'pwd', FALSE),
(11, 'ls', TRUE),
(11, 'mkdir', FALSE),
(11, 'cp', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(12, 'Sistemas Operacionais', 'No Linux, o comando utilizado para alterar as permissões de acesso de arquivos e diretórios é o:', 'O comando chmod (change mode) altera as permissões de leitura, escrita e execução.', 'IBFC - EBSERH');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(12, 'chown', FALSE),
(12, 'chmod', TRUE),
(12, 'chgrp', FALSE),
(12, 'ps', FALSE),
(12, 'top', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(13, 'Sistemas Operacionais', 'No Windows 10/11, qual atalho de teclado é padrão para abrir o Gerenciador de Tarefas diretamente, sem passar pela tela de segurança?', 'O atalho Ctrl + Shift + Esc abre diretamente o Gerenciador de Tarefas.', 'VUNESP - Prefeitura de São José dos Campos/SP');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(13, 'Ctrl + C', FALSE),
(13, 'Ctrl + Alt + Del', FALSE),
(13, 'Ctrl + Shift + Esc', TRUE),
(13, 'Windows + R', FALSE),
(13, 'Alt + F4', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(14, 'Sistemas Operacionais', 'No sistema Linux, o diretório onde ficam armazenados os arquivos de configuração do sistema (como fstab, resolv.conf, etc.) é o:', 'O diretório /etc concentra a maior parte dos arquivos de configuração do sistema.', 'QUADRIX - CREFONO-4');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(14, '/bin', FALSE),
(14, '/dev', FALSE),
(14, '/etc', TRUE),
(14, '/tmp', FALSE),
(14, '/home', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(15, 'Sistemas Operacionais', 'No Windows, o comando ping executado no Prompt de Comando (cmd) utiliza pacotes do protocolo ICMP para testar a conectividade entre dois nós da rede.', 'A afirmação está correta. O ping usa o protocolo ICMP (Echo Request/Reply).', 'Cebraspe / CESPE - DPE-TO');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(15, 'CERTO', TRUE),
(15, 'ERRADO', FALSE);

-- =============================================
-- BANCO DE DADOS (16 a 20)
-- =============================================

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(16, 'Banco de Dados', 'Em linguagem SQL, qual comando da DML (Data Manipulation Language) é utilizado para selecionar e consultar registros existentes em uma tabela?', 'O comando SELECT é usado para consultar dados em uma ou mais tabelas.', 'FCC - TRT-15');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(16, 'UPDATE', FALSE),
(16, 'INSERT', FALSE),
(16, 'DELETE', FALSE),
(16, 'SELECT', TRUE),
(16, 'CREATE', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(17, 'Banco de Dados', 'Qual chave em uma tabela de Banco de Dados Relacional serve para identificar de forma única cada registro/linha daquela tabela?', 'A Chave Primária (Primary Key) garante a unicidade de cada registro na tabela.', 'FGV - IBGE');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(17, 'Chave Estrangeira (Foreign Key)', FALSE),
(17, 'Chave Primária (Primary Key)', TRUE),
(17, 'Chave Secundária', FALSE),
(17, 'Índices Secundários', FALSE),
(17, 'Chave Composta Externa', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(18, 'Banco de Dados', 'Na linguagem SQL, para inserir uma nova linha com dados em uma tabela existente, utiliza-se a instrução:', 'A instrução INSERT INTO é usada para adicionar novos registros em uma tabela.', 'IBFC - IF-AM');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(18, 'ADD ROW', FALSE),
(18, 'INSERT INTO', TRUE),
(18, 'UPDATE TABLE', FALSE),
(18, 'NEW RECORD', FALSE),
(18, 'CREATE ROW', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(19, 'Banco de Dados', 'O comando da linguagem SQL pertencente ao grupo DDL (Data Definition Language) utilizado para apagar completamente uma tabela e sua estrutura do banco de dados é:', 'O comando DROP TABLE remove a tabela inteira (estrutura + dados).', 'VUNESP - Câmara de Piracicaba/SP');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(19, 'DROP TABLE', TRUE),
(19, 'DELETE TABLE', FALSE),
(19, 'REMOVE TABLE', FALSE),
(19, 'TRUNCATE ONLY', FALSE),
(19, 'CLEAR TABLE', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(20, 'Banco de Dados', 'A Chave Estrangeira (Foreign Key) é utilizada em bancos de dados relacionais para estabelecer e impor um vínculo entre os dados de duas tabelas diferentes.', 'A afirmação está correta. A Foreign Key cria o relacionamento entre tabelas.', 'Cebraspe / CESPE - BNDES');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(20, 'CERTO', TRUE),
(20, 'ERRADO', FALSE);

-- =============================================
-- LINGUAGENS E LÓGICA (21 a 25)
-- =============================================

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(21, 'Linguagens e Lógica', 'Em relação às estruturas de controle em programação, qual estrutura é classificada como uma estrutura de repetição com teste no início?', 'O while testa a condição antes de executar o bloco de código (teste no início).', 'FCC - TRT-2');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(21, 'if ... else', FALSE),
(21, 'switch ... case', FALSE),
(21, 'while', TRUE),
(21, 'do ... while', FALSE),
(21, 'try ... catch', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(22, 'Linguagens e Lógica', 'Em Python, a função nativa utilizada para retornar a quantidade de itens presentes em uma lista ou o número de caracteres em uma string é:', 'A função len() retorna o tamanho de uma sequência (lista, string, etc.).', 'FGV - IMBEL');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(22, 'count()', FALSE),
(22, 'size()', FALSE),
(22, 'len()', TRUE),
(22, 'length()', FALSE),
(22, 'sum()', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(23, 'Linguagens e Lógica', 'Na Programação Orientada a Objetos (POO), o mecanismo pelo qual uma classe filha herda atributos e métodos de uma classe pai é chamado de:', 'Herança é o princípio da POO que permite reutilizar código de uma classe pai.', 'IBFC - EBSERH');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(23, 'Encapsulamento', FALSE),
(23, 'Polimorfismo', FALSE),
(23, 'Herança', TRUE),
(23, 'Abstração', FALSE),
(23, 'Instanciação', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(24, 'Linguagens e Lógica', 'Em lógicas de programação, o operador lógico que resulta em VERDADEIRO apenas se ambas as condições analisadas forem verdadeiras é o operador:', 'O operador AND (E) só retorna verdadeiro quando as duas condições são verdadeiras.', 'VUNESP - DAE de Jundiaí/SP');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(24, 'OR (OU)', FALSE),
(24, 'NOT (NÃO)', FALSE),
(24, 'AND (E)', TRUE),
(24, 'XOR (OU Exclusivo)', FALSE),
(24, 'NAND', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(25, 'Linguagens e Lógica', 'Em linguagens de programação, uma variável do tipo primitivo Boolean (booleana) pode armazenar apenas dois valores possíveis: verdadeiro (True) ou falso (False).', 'A afirmação está correta. O tipo boolean só aceita true ou false.', 'Cebraspe / CESPE - DPE-DF');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(25, 'CERTO', TRUE),
(25, 'ERRADO', FALSE);

-- =============================================
-- SEGURANÇA DA INFORMAÇÃO (26 a 30)
-- =============================================

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(26, 'Segurança da Informação', 'O pilar da Segurança da Informação que garante que a informação esteja acessível apenas por pessoas ou sistemas devidamente autorizados é denominado:', 'Confidencialidade é o pilar que garante o acesso apenas a quem tem autorização.', 'QUADRIX - CRN-3');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(26, 'Disponibilidade', FALSE),
(26, 'Integridade', FALSE),
(26, 'Confidencialidade', TRUE),
(26, 'Autenticidade', FALSE),
(26, 'Não-repúdio', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(27, 'Segurança da Informação', 'Tipo de software malicioso (malware) que criptografa os arquivos da vítima e exige o pagamento de um resgate (geralmente em criptomoedas) para liberar o acesso:', 'Ransomware é o malware que sequestra os dados e exige resgate.', 'IBFC - MGS');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(27, 'Spyware', FALSE),
(27, 'Ransomware', TRUE),
(27, 'Keylogger', FALSE),
(27, 'Adware', FALSE),
(27, 'Rootkit', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(28, 'Segurança da Informação', 'O ataque no qual o invasor tenta se passar por uma entidade confiável (como um banco ou serviço conhecido) por e-mail ou páginas falsas para enganar o usuário e roubar senhas é chamado de:', 'Phishing é a técnica de engenharia social que usa falsificação de identidade para roubar dados.', 'FGV - MPERJ');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(28, 'Phishing', TRUE),
(28, 'Denial of Service (DoS)', FALSE),
(28, 'Man-in-the-Middle', FALSE),
(28, 'Port Scanning', FALSE),
(28, 'IP Spoofing', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(29, 'Segurança da Informação', 'A técnica de segurança que utiliza duas chaves distintas (uma chave pública para criptografar e uma chave privada para descriptografar) é chamada de:', 'A Criptografia Assimétrica usa um par de chaves (pública e privada).', 'VUNESP - Oscar Freire/SP');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(29, 'Criptografia Simétrica', FALSE),
(29, 'Criptografia Assimétrica', TRUE),
(29, 'Hashing Simples', FALSE),
(29, 'Esteganografia', FALSE),
(29, 'Autenticação Básica', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(30, 'Segurança da Informação', 'Um Firewall de rede é um dispositivo de segurança projetado para monitorar e filtrar o tráfego de rede de entrada e saída com base em regras de segurança previamente estabelecidas.', 'A afirmação está correta. O Firewall filtra o tráfego de acordo com regras definidas.', 'Cebraspe / CESPE');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(30, 'CERTO', TRUE),
(30, 'ERRADO', FALSE);

SELECT setval('perguntas_id_seq', (SELECT MAX(id) FROM perguntas));

SELECT 
    p.id, 
    p.categoria, 
    p.enunciado, 
    a.texto_alternativa, 
    a.eh_correta 
FROM perguntas p
JOIN alternativas a ON p.id = a.pergunta_id
WHERE p.id = 1;

