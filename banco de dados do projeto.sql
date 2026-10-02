CREATE TABLE perguntas (
    id SERIAL PRIMARY KEY,
    categoria VARCHAR(100) NOT NULL,
    enunciado TEXT NOT NULL,
    justificativa TEXT NOT NULL,
    fonte_url TEXT NOT NULL
);

-- 1. Limpeza das tabelas existentes e reinício dos IDs
TRUNCATE TABLE alternativas, perguntas RESTART IDENTITY CASCADE;

-- =============================================
-- ENGENHARIA DE SOFTWARE E DESENVOLVIMENTO (1 a 6)
-- =============================================

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(1, 'Engenharia de Software', 'Qual é o papel principal das Histórias de Usuário (User Stories) no framework Scrum?', 'Uma História de Usuário descreve uma funcionalidade do ponto de vista do usuário final, servindo como item do Product Backlog para expressar valor de negócio.', 'https://scrumguides.org/scrum-guide.html');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(1, 'Definir a arquitetura física dos servidores de banco de dados.', FALSE),
(1, 'Descrever uma funcionalidade sob a perspectiva do usuário para gerar valor de negócio.', TRUE),
(1, 'Mapear a alocação de memória RAM dos componentes do sistema.', FALSE),
(1, 'Substituir os testes unitários da aplicação.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(2, 'Engenharia de Software', 'Qual é a diferença fundamental entre Testes de Unidade e Testes de Integração?', 'Testes de Unidade validam a menor unidade isolada do código (com mocks nas dependências), enquanto Testes de Integração verificam a comunicação entre múltiplos módulos.', 'https://martinfowler.com/articles/practical-test-pyramid.html');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(2, 'Testes de Unidade testam o sistema completo e Testes de Integração testam apenas funções isoladas.', FALSE),
(2, 'Testes de Unidade validam módulos isoladamente; Testes de Integração validam a interface e comunicação entre os módulos.', TRUE),
(2, 'Testes de Integração são executados manualmente pelo usuário final.', FALSE),
(2, 'Não há diferença técnica entre os dois tipos de teste.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(3, 'Engenharia de Software', 'O que estabelece o Princípio da Inversão de Dependência (DIP) do SOLID?', 'Módulos de alto nível não devem depender de módulos de baixo nível; ambos devem depender de abstrações (interfaces ou classes abstratas).', 'https://www.digitalocean.com/community/conceptual-articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design-pt');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(3, 'Classes filhas nunca devem herdar métodos da classe pai.', FALSE),
(3, 'Módulos de alto e baixo nível devem depender de abstrações, reduzindo o acoplamento.', TRUE),
(3, 'Uma classe deve ter múltiplas responsabilidades na aplicação.', FALSE),
(3, 'Todas as variáveis do programa devem ser globais.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(4, 'Engenharia de Software', 'No modelo MPS.BR, qual é a finalidade dos Níveis de Maturidade (de G a A)?', 'Avaliar e atestar a capacidade e evolução dos processos de software de uma organização.', 'https://softex.br/mpsbr/');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(4, 'Medir a velocidade de processamento do hardware.', FALSE),
(4, 'Graduar a capacidade e maturidade dos processos de software da organização.', TRUE),
(4, 'Definir o nível de criptografia das conexões de rede.', FALSE),
(4, 'Classificar a licença comercial dos softwares produzidos.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(5, 'Engenharia de Software', 'No diagrama de classes UML, qual a diferença entre Agregação e Composição?', 'Na Agregação a parte existe independentemente do todo; na Composição a destruição do todo implica na destruição das partes.', 'https://www.uml.org/');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(5, 'Na Agregação a vida do filho está acoplada ao pai; na Composição o filho sobrevive sem o pai.', FALSE),
(5, 'Na Agregação o objeto parte pode existir sem o todo; na Composição o objeto parte depende do ciclo de vida do todo.', TRUE),
(5, 'Agregação só é usada em bancos relacionais e Composição em NoSQL.', FALSE),
(5, 'Ambas possuem exatamente a mesma semântica na UML.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(6, 'Engenharia de Software', 'Qual é a característica principal da Arquitetura de Microsserviços em comparação com o Monolito?', 'Decompor a aplicação em serviços pequenos, autônomos, fracamente acoplados e implantáveis de forma independente.', 'https://learn.microsoft.com/pt-br/azure/architecture/guide/architecture-styles/microservices');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(6, 'Unificar todo o código fonte em uma única base de dados centralizada e indivisível.', FALSE),
(6, 'Dividir a aplicação em serviços independentes que podem ser implantados e escalados individualmente.', TRUE),
(6, 'Eliminar o uso de APIs HTTP/REST nas comunicações do sistema.', FALSE),
(6, 'Obrigá-los a utilizar o mesmo banco de dados relacional para todos os serviços.', FALSE);

-- =============================================
-- BANCO DE DADOS (7 a 12)
-- =============================================

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(7, 'Banco de Dados', 'O que representam as propriedades ACID em SGBDs Relacionais?', 'Atomicidade, Consistência, Isolamento e Durabilidade — garantias para transações confiáveis.', 'https://www.postgresql.org/docs/current/tutorial-transactions.html');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(7, 'Acesso, Controle, Integridade e Desempenho.', FALSE),
(7, 'Atomicidade, Consistência, Isolamento e Durabilidade.', TRUE),
(7, 'Autenticação, Criptografia, Identificação e Difusão.', FALSE),
(7, 'Agrupamento, Consulta, Inserção e Deleção.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(8, 'Banco de Dados', 'Qual a regra principal para que uma tabela esteja na Terceira Forma Normal (3FN)?', 'Estar na 2FN e não possuir dependências funcionais transitivas entre atributos não-chave.', 'https://docs.oracle.com/en/database/');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(8, 'Possuir pelo menos duas chaves estrangeiras cadastradas.', FALSE),
(8, 'Estar na 2FN e não apresentar dependências transitivas entre colunas não-chave.', TRUE),
(8, 'Permitir campos com múltiplos valores separados por vírgula.', FALSE),
(8, 'Ter todos os campos indexados no B-Tree.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(9, 'Banco de Dados', 'Qual a diferença entre as cláusulas WHERE e HAVING em comandos SQL?', 'WHERE filtra linhas antes do agrupamento; HAVING filtra os grupos resultantes das funções de agregação.', 'https://www.w3schools.com/sql/sql_having.asp');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(9, 'WHERE é usado em bancos NoSQL e HAVING em bancos SQL.', FALSE),
(9, 'WHERE filtra registros individuais antes do GROUP BY; HAVING filtra dados agregados após o GROUP BY.', TRUE),
(9, 'HAVING é executado primeiro que o WHERE em todos os casos.', FALSE),
(9, 'Ambas as cláusulas desempenham exatamente a mesma função.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(10, 'Banco de Dados', 'Qual o principal benefício e o custo de se criar um Índice (ex: B-Tree) em uma tabela?', 'Acelera a velocidade das consultas de leitura (SELECT), mas adiciona custo em disco e sobrecarga de escrita (INSERT/UPDATE/DELETE).', 'https://www.postgresql.org/docs/current/indexes.html');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(10, 'Aumenta o tempo de resposta das consultas e reduz o tamanho do banco em disco.', FALSE),
(10, 'Acelera consultas de busca, porém exige mais espaço em disco e torna modificações (escrita) ligeiramente mais lentas.', TRUE),
(10, 'Garante que os dados fiquem criptografados automaticamente.', FALSE),
(10, 'Impede a ocorrência de deadlocks na tabela.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(11, 'Banco de Dados', 'De acordo com o Teorema CAP, quais propriedades um sistema distribuído não consegue garantir 100% simultaneamente?', 'Consistência (Consistency), Disponibilidade (Availability) e Tolerância a Partição (Partition Tolerance).', 'https://aws.amazon.com/pt/nosql/');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(11, 'Criptografia, Autenticação e Privacidade.', FALSE),
(11, 'Consistência, Disponibilidade e Tolerância a Partições de Rede.', TRUE),
(11, 'Concorrência, Algoritmos e Processamento.', FALSE),
(11, 'Compressão, Armazenamento e Performance.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(12, 'Banco de Dados', 'Qual a diferença entre os comandos SQL TRUNCATE TABLE e DELETE FROM?', 'DELETE é DML, apaga linhas registrando logs individualmente e permite WHERE; TRUNCATE é DDL, limpa a tabela desalocando páginas de forma rápida.', 'https://learn.microsoft.com/pt-br/sql/t-sql/statements/truncate-table-transact-sql');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(12, 'TRUNCATE apaga o banco de dados inteiro; DELETE apaga apenas o schema da tabela.', FALSE),
(12, 'DELETE apaga linhas permitindo filtro WHERE com registro linha a linha; TRUNCATE reefetua o esvaziamento completo da tabela via DDL de forma rápida.', TRUE),
(12, 'Não há nenhuma diferença técnica entre TRUNCATE e DELETE.', FALSE),
(12, 'TRUNCATE só funciona se a tabela tiver chave estrangeira ativa.', FALSE);

-- =============================================
-- REDES E SEGURANÇA DA INFORMAÇÃO (13 a 18)
-- =============================================

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(13, 'Redes e Segurança', 'Qual a diferença fundamental na Camada de Transporte entre os protocolos TCP e UDP?', 'O TCP é orientado à conexão com garantia de entrega e ordem; o UDP é não orientado à conexão e focado em baixa latência.', 'https://datatracker.ietf.org/doc/html/rfc793');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(13, 'UDP garante a entrega de 100% dos pacotes e o TCP não faz verificação de erros.', FALSE),
(13, 'TCP é orientado à conexão e garante a entrega dos pacotes; UDP não é orientado à conexão e foca em velocidade.', TRUE),
(13, 'TCP opera na Camada de Aplicação e UDP na Camada Física.', FALSE),
(13, 'Ambos possuem exatamente as mesmas características de controle de fluxo.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(14, 'Redes e Segurança', 'O que caracteriza um ataque do tipo DDoS (Distributed Denial of Service)?', 'Negação de serviço causada pela sobrecarga de recursos do alvo por múltiplas origens (botnet).', 'https://www.cloudflare.com/pt-br/learning/ddos/what-is-a-ddos-attack/');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(14, 'Injeção de código SQL em formulários web.', FALSE),
(14, 'Inundação maliciosa de tráfego coordenada a partir de múltiplos dispositivos para indisponibilizar um serviço.', TRUE),
(14, 'Roubo de senhas por meio de chamadas telefônicas falsas.', FALSE),
(14, 'Criptografia não autorizada do sistema de arquivos.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(15, 'Redes e Segurança', 'Na Criptografia Assimétrica, qual chave é usada para Criptografar e qual é usada para Assinar digitalmente?', 'Criptografa-se com a Chave Pública do destinatário; assina-se com a Chave Privada do remetente.', 'https://pkiconsortium.org/');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(15, 'Criptografa-se com a chave privada e assina-se com o endereço IP.', FALSE),
(15, 'Para confidencialidade usa-se a Chave Pública do destinatário; para Assinatura Digital usa-se a Chave Privada do remetente.', TRUE),
(15, 'Ambas as operações utilizam obrigatoriamente a mesma chave simétrica de 128 bits.', FALSE),
(15, 'Chaves públicas não podem ser compartilhadas com terceiros.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(16, 'Redes e Segurança', 'Qual o papel do protocolo TLS (Transport Layer Security) em conexões HTTPS?', 'Prover confidencialidade, integridade e autenticação através do estabelecimento de um canal criptografado.', 'https://datatracker.ietf.org/doc/html/rfc8446');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(16, 'Aumentar a velocidade do download compactando imagens.', FALSE),
(16, 'Garantir a confidencialidade e integridade da comunicação via criptografia na camada de transporte.', TRUE),
(16, 'Converter endereços IP em nomes de domínio legíveis.', FALSE),
(16, 'Substituir o uso de roteadores na rede local.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(17, 'Redes e Segurança', 'O que indica a notação CIDR /24 em um endereço IPv4 (ex: 192.168.1.0/24)?', 'Que os primeiros 24 bits correspondem à rede (máscara 255.255.255.0), restando 8 bits para hosts.', 'https://datatracker.ietf.org/doc/html/rfc4632');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(17, 'Que a rede possui no máximo 24 computadores conectados.', FALSE),
(17, 'Que os primeiros 24 bits identificam a sub-rede (equivalente à máscara 255.255.255.0).', TRUE),
(17, 'Que o protocolo utilizado é o IPv6.', FALSE),
(17, 'Que a velocidade da placa de rede é de 24 Mbps.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(18, 'Redes e Segurança', 'Qual é a função básica do protocolo ARP (Address Resolution Protocol)?', 'Mapear um endereço IP (Camada 3) em um endereço MAC físico (Camada 2) correspondente na LAN.', 'https://datatracker.ietf.org/doc/html/rfc826');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(18, 'Bloquear pacotes de vírus provenientes da internet.', FALSE),
(18, 'Mapear o endereço IP lógico de um host para o seu endereço físico MAC na rede local.', TRUE),
(18, 'Sincronizar o relógio dos servidores da rede.', FALSE),
(18, 'Enviar e-mails de forma automatizada.', FALSE);

-- =============================================
-- GOVERNANÇA, GESTÃO E LEGISLAÇÃO (19 a 24)
-- =============================================

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(19, 'Governança e Legislação', 'Qual o foco principal do framework COBIT (especialmente em sua versão 2019)?', 'Alinhar a Governança e a Gestão da Tecnologia da Informação aos objetivos estratégicos do negócio.', 'https://www.isaca.org/resources/cobit');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(19, 'Especificar a sintaxe de código em linguagens de programação.', FALSE),
(19, 'Fornecer uma estrutura para Governança e Gestão de TI alinhada ao negócio.', TRUE),
(19, 'Definir regras para montagem de cabeamento estruturado.', FALSE),
(19, 'Substituir a legislação de proteção de dados pessoais.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(20, 'Governança e Legislação', 'O que é o Sistema de Valor de Serviço (SVS) na ITIL v4?', 'Uma estrutura modular que demonstra como os componentes da organização trabalham juntos para co-criar valor.', 'https://www.axelos.com/certifications/itil-service-management');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(20, 'Um banco de dados exclusivo para armazenar senhas de usuários.', FALSE),
(20, 'O modelo da ITIL v4 que descreve a integração de componentes e atividades para criação de valor por meio de serviços.', TRUE),
(20, 'Um software proprietário para gerenciamento de chamados.', FALSE),
(20, 'Um método de contabilidade para calcular o custo do hardware.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(21, 'Governança e Legislação', 'Segundo a LGPD (Lei nº 13.709/2018), o que são Dados Pessoais Sensíveis?', 'Dados sobre origem racial, convicção religiosa, saúde, biometria, genética ou vida sexual.', 'https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(21, 'Apenas o número de telefone e o endereço IP do usuário.', FALSE),
(21, 'Dados sobre origem racial, convicções religiosas, saúde, genética ou biometria.', TRUE),
(21, 'Qualquer informação pública compartilhada em redes sociais.', FALSE),
(21, 'Dados corporativos que não possuem relação com pessoas físicas.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(22, 'Governança e Legislação', 'Quais são os pilares fundamentais da Segurança da Informação segundo a norma ISO/IEC 27001?', 'Confidencialidade, Integridade e Disponibilidade (Tríade CID).', 'https://www.iso.org/isoiec-27001-information-security.html');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(22, 'Rapidez, Usabilidade e Custo.', FALSE),
(22, 'Confidencialidade, Integridade e Disponibilidade.', TRUE),
(22, 'Autenticidade, Criptografia e Backup.', FALSE),
(22, 'Hardware, Software e Pessoas.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(23, 'Governança e Legislação', 'Na LGPD, qual a diferença entre os papéis do Controlador e do Operador?', 'O Controlador toma as decisões sobre o tratamento; o Operador realiza o tratamento em nome do Controlador.', 'https://www.gov.br/anpd/pt-br');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(23, 'O Operador define as regras da lei e o Controlador apenas executa o backup.', FALSE),
(23, 'O Controlador toma as decisões relativas ao tratamento dos dados; o Operador trata os dados segundo as orientações do Controlador.', TRUE),
(23, 'Ambos os termos são sinônimos e possuem exatamente a mesma função jurídica.', FALSE),
(23, 'O Operador é sempre o titular dos dados pessoais.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(24, 'Governança e Legislação', 'Qual a mudança conceitual marcante introduzida no PMBOK 7ª Edição?', 'Adoção de Princípios de Entrega de Projetos e Domínios de Desempenho no lugar de processos engessados.', 'https://www.pmi.org/pmbok-guide-standards');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(24, 'Proibição total do uso de métodos ágeis em gerenciamento de projetos.', FALSE),
(24, 'Transição de uma estrutura focada em Processos/Áreas de Conhecimento para Princípios e Domínios de Desempenho.', TRUE),
(24, 'Tornar obrigatória a utilização do software Microsoft Project em todos os projetos.', FALSE),
(24, 'Foco exclusivo na fase de encerramento do contrato.', FALSE);

-- =============================================
-- SISTEMAS OPERACIONAIS E DEVOPS (25 a 30)
-- =============================================

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(25, 'Sistemas Operacionais', 'O que é Deadlock e quais são as 4 condições necessárias para sua ocorrência?', 'Bloqueio mútuo de processos. As 4 condições de Coffman são: Exclusão Mútua, Posse e Espera, Não Preempção e Espera Circular.', 'https://www.pearson.com/');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(25, 'Desligamento abrupto por falta de energia solar.', FALSE),
(25, 'Bloqueio permanente de processos devido às condições de Exclusão Mútua, Posse e Espera, Não Preempção e Espera Circular.', TRUE),
(25, 'Falha no disco rígido por superaquecimento.', FALSE),
(25, 'Uma técnica de otimização de memória RAM.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(26, 'Sistemas Operacionais', 'Qual a diferença entre Virtualização via Máquina Virtual (VM) e Conteinerização (ex: Docker)?', 'VMs virtualizam o hardware e executam um Guest OS completo; Containers compartilham o Kernel do SO hospedeiro.', 'https://docs.docker.com/get-started/overview/');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(26, 'Containers são mais lentos e consomem mais memória que Máquinas Virtuais.', FALSE),
(26, 'VMs virtualizam o hardware com um SO Convidado próprio; Containers compartilham o Kernel do SO hospedeiro sendo mais leves.', TRUE),
(26, 'Não é possível rodar bancos de dados dentro de containers.', FALSE),
(26, 'VMs só funcionam no Windows e Containers no Linux.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(27, 'Sistemas Operacionais', 'Como funciona o Escalonamento de Processos Preemptivo em um Sistema Operacional?', 'O SO pode interromper um processo em execução para conceder a CPU a outro processo com prioridade/tempo.', 'https://www.geeksforgeeks.org/cpu-scheduling-in-operating-systems/');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(27, 'Um processo roda até finalizar voluntariamente sem que o SO possa interrompê-lo.', FALSE),
(27, 'O SO pode interromper temporariamente a execução de um processo para dar vez a outro segundo seu algoritmo.', TRUE),
(27, 'Os processos são executados estritamente por ordem de tamanho de arquivo.', FALSE),
(27, 'Só é utilizado quando o computador não possui memória RAM.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(28, 'Sistemas Operacionais', 'No Linux, o que significam as permissões `755` aplicadas via comando `chmod`?', 'Leitura, Escrita e Execução (7) para o Dono; Leitura e Execução (5) para o Grupo e Outros.', 'https://man7.org/linux/man-pages/man1/chmod.1.html');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(28, 'Apenas o administrador pode ler o arquivo.', FALSE),
(28, 'Dono com permissão total (rwx = 7); Grupo e Outros apenas com leitura e execução (r-x = 5).', TRUE),
(28, 'O arquivo torna-se oculto para todos os usuários.', FALSE),
(28, 'Deleta o arquivo após 755 segundos.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(29, 'DevOps', 'No contexto do DevOps, o que significam as práticas de CI/CD?', 'CI é a Integração Contínua (compilação e testes automatizados); CD é a Entrega/Implantação Contínua na produção.', 'https://www.redhat.com/pt-br/topics/devops/what-is-ci-cd');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(29, 'Criptografia Interna e Descriptografia de Dados.', FALSE),
(29, 'Integração Contínua (automção de builds/testes) e Entrega/Implantação Contínua no ambiente de destino.', TRUE),
(29, 'Criação de Interfaces e Controle de Diagramas.', FALSE),
(29, 'Consulta de Informações e Catalogação de Dados.', FALSE);

INSERT INTO perguntas (id, categoria, enunciado, justificativa, fonte_url) VALUES
(30, 'DevOps', 'Qual é a principal responsabilidade da plataforma Kubernetes (k8s)?', 'Orquestrar e automatizar a implantação, o escalamento e o gerenciamento de aplicações em containers.', 'https://kubernetes.io/docs/concepts/overview/');
INSERT INTO alternativas (pergunta_id, texto_alternativa, eh_correta) VALUES
(30, 'Compilar código Java para plataformas mobile.', FALSE),
(30, 'Orquestrar e automatizar a implantação, escalamento e operação de containers em cluster.', TRUE),
(30, 'Substituir a necessidade de escrever queries SQL.', FALSE),
(30, 'Gerenciar o hardware físico dos datacenters.', FALSE);

-- Ajustar a sequência do PostgreSQL após o insert dos IDs
SELECT setval('perguntas_id_seq', (SELECT MAX(id) FROM perguntas));
