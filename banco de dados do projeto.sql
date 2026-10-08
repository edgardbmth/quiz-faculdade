-- ============================================================
-- SCRIPT DE CRIAÇÃO E POVOAMENTO - TECHQUIZ / TECH TRIVIA
-- Banco de Dados: PostgreSQL
-- ============================================================

-- Tabela de Categorias (Temas da Tecnologia)
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de Perguntas
CREATE TABLE perguntas (
    id SERIAL PRIMARY KEY,
    categoria_id INT NOT NULL REFERENCES categorias(id) ON DELETE CASCADE,
    enunciado TEXT NOT NULL,
    contexto TEXT, -- Contexto/fato introduzido antes das opções
    explicacao TEXT NOT NULL, -- Explicação do acerto/erro
    fonte_nome VARCHAR(150) NOT NULL, -- Nome do site/instituição da fonte
    fonte_url TEXT NOT NULL -- Link direto para a fonte oficial
);

-- Tabela de Opções/Alternativas (Com indicação de resposta correta)
CREATE TABLE opcoes (
    id SERIAL PRIMARY KEY,
    pergunta_id INT NOT NULL REFERENCES perguntas(id) ON DELETE CASCADE,
    texto_opcao VARCHAR(50) NOT NULL,
    eh_correta BOOLEAN NOT NULL DEFAULT FALSE
);

-- Tabela de Usuários (Para apoio ao RQ01)
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Pontuações (Para apoio ao RQ03 e RQ04)
CREATE TABLE pontuacoes (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    pontos INT NOT NULL,
    data_sessao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- 2. INSERÇÃO DOS DADOS (POPULANDO O BANCO DE DADOS)
-- ============================================================

-- Inserção das Categorias
INSERT INTO categorias (id, nome) VALUES 
(1, 'História da Computação'),
(2, 'Arquitetura de Sistemas & Redes'),
(3, 'Desenvolvimento de Software & Algoritmos'),
(4, 'Banco de Dados & Engenharia de Dados'),
(5, 'Nuvem, DevOps & Infraestrutura'),
(6, 'Cibersegurança & Criptografia'),
(7, 'Inteligência Artificial & Dados'),
(8, 'Testes & Qualidade de Software'),
(9, 'Engenharia de Desempenho & Web'),
(10, 'Sistemas Operacionais & Conceitos');

-- ------------------------------------------------------------
-- INSERÇÃO DAS PERGUNTAS E OPÇÕES (50 TRIVIAS TÉCNICAS)
-- ------------------------------------------------------------

-- Pergunta 1 (Baseada no Protótipo do Documento de Requisitos)
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(1, 1, 'O primeiro bug de computador foi realmente um inseto de verdade?', 
'Em 1947, técnicos trabalhando no computador Harvard Mark II encontraram uma mariposa presa em um relé e registraram o episódio no diário da equipe.',
'O episódio realmente aconteceu em 9 de setembro de 1947: uma mariposa foi encontrada presa no Relé 70 do Harvard Mark II e colada com fita adesiva na página do diário de operações, ao lado da frase "first actual case of bug being found". O caderno original está hoje preservado no Smithsonian.',
'National Museum of American History (Smithsonian)',
'https://americanhistory.si.edu/collections/search/object/nmah_334663');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(1, 'CERTO', TRUE),
(1, 'ERRADO', FALSE);

-- Pergunta 2
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(2, 2, 'O Teorema CAP permite que um sistema distribuído garanta Consistência, Disponibilidade e Tolerância a Partições ao mesmo tempo durante falhas?',
'Sistemas distribuídos precisam lidar constantemente com partições e falhas na rede.',
'O Teorema CAP demonstra matematicamente que, na presença de uma partição de rede (P), um sistema distribuído deve escolher entre manter a Consistência (C) ou a Disponibilidade (A), não sendo possível garantir ambos simultaneamente.',
'Martin Kleppmann Blog',
'https://martin.kleppmann.com/2015/09/17/critique-of-the-cap-theorem.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(2, 'CERTO', FALSE),
(2, 'ERRADO', TRUE);

-- Pergunta 3
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(3, 2, 'O protocolo gRPC utiliza HTTP/2 e Protocol Buffers para obter melhor desempenho que o REST/JSON tradicional?',
'Modernas arquiteturas de microserviços buscam alternativas mais eficientes ao tráfego JSON sobre HTTP/1.1.',
'O gRPC utiliza HTTP/2 para multiplexação de conexões e Protocol Buffers (binário) como linguagem de definição de interface, garantindo menor tamanho de payload e maior velocidade no transporte de dados.',
'gRPC Official Documentation',
'https://grpc.io/about/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(3, 'CERTO', TRUE),
(3, 'ERRADO', FALSE);

-- Pergunta 4
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(4, 2, 'No Handshake de 3 vias do TCP, o primeiro pacote enviado pelo cliente é o ACK?',
'O estabelecimento de conexão orientada a transporte no protocolo TCP exige uma sequência específica de sincronização.',
'A sequência correta do Handshake de 3 vias do TCP inicia com o cliente enviando SYN, o servidor responde com SYN-ACK, e finaliza com o cliente enviando ACK.',
'IETF RFC 793 Specification',
'https://datatracker.ietf.org/doc/html/rfc793');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(4, 'CERTO', FALSE),
(4, 'ERRADO', TRUE);

-- Pergunta 5
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(5, 2, 'O servidor Root DNS devolve diretamente o endereço IP final do site solicitado pelo usuário?',
'A resolução de nomes de domínio envolve uma hierarquia de servidores em cadeia.',
'Os Root Servers não conhecem os IPs finais dos sites; eles apenas direcionam o resolvedor para os servidores autoritativos do TLD correspondente (como .com ou .org).',
'Cloudflare Learning Center',
'https://www.cloudflare.com/learning/dns/what-is-dns/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(5, 'CERTO', FALSE),
(5, 'ERRADO', TRUE);

-- Pergunta 6
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(6, 2, 'O protocolo TLS 1.3 reduziu o tempo de negociação no handshake para 1 RTT (Round Trip Time)?',
'A evolução do protocolo TLS buscou reduzir a latência de criptografia na web.',
'O TLS 1.3 eliminou etapas redundantes de negociação de algoritmos, permitindo que o handshake seja concluído em apenas 1 RTT contra os 2 RTTs do TLS 1.2.',
'IETF RFC 8446 Specification',
'https://datatracker.ietf.org/doc/html/rfc8446');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(6, 'CERTO', TRUE),
(6, 'ERRADO', FALSE);

-- Pergunta 7
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(7, 3, 'Concorrência e Paralelismo são sinônimos e dependem obrigatoriamente de múltiplos núcleos de CPU?',
'Diferentes abordagens são usadas para lidar com a execução de múltiplas tarefas na programação.',
'Concorrência é sobre a estrutura do código para lidar com múltiplas tarefas simultâneas (mesmo em 1 único núcleo), enquanto Paralelismo é a execução física e simultânea de tarefas em múltiplos núcleos.',
'Go Dev Talks (Rob Pike)',
'https://go.dev/talks/2012/waza.slide');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(7, 'CERTO', FALSE),
(7, 'ERRADO', TRUE);

-- Pergunta 8
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(8, 3, 'O Princípio da Substituição de Liskov (L do SOLID) indica que uma classe filha deve poder substituir sua classe pai sem quebrar o programa?',
'A programação orientada a objetos utiliza os princípios SOLID para garantir um código sustentável.',
'O Princípio de Liskov dita que instâncias de uma classe derivada devem ser capazes de substituir objetos da classe base sem alterar as propriedades corretas do programa.',
'Clean Coder Blog (Robert C. Martin)',
'https://blog.cleancoder.com/uncle-bob/2020/10/18/Solid-Relevance.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(8, 'CERTO', TRUE),
(8, 'ERRADO', FALSE);

-- Pergunta 9
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(9, 3, 'Uma busca com complexidade O(log n) acessa a posição da memória instantaneamente sem fazer divisões?',
'Estruturas de dados possuem diferentes eficiências assintóticas para busca de elementos.',
'O acesso instantâneo via índice possui complexidade O(1). A complexidade O(log n) envolve divisões sucessivas do espaço de busca, como ocorre na busca binária.',
'MIT OpenCourseWare Algorithms',
'https://ocw.mit.edu/courses/6-006-introduction-to-algorithms-fall-2011/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(9, 'CERTO', FALSE),
(9, 'ERRADO', TRUE);

-- Pergunta 10
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(10, 3, 'O algoritmo Mark-and-Sweep de Garbage Collection identifica primeiro os objetos ativos para depois liberar os não marcados?',
'Mecanismos de gerenciamento de memória em linguagens como Java e C# automatizam a liberação de espaço.',
'O algoritmo Mark-and-Sweep funciona em duas etapas: na fase Mark ele navega pelos objetos acessíveis marcando-os; na fase Sweep ele varre a memória removendo os objetos não marcados.',
'Oracle Java Documentation',
'https://docs.oracle.com/en/java/javase/17/gctuning/introduction-garbage-collection-tuning.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(10, 'CERTO', TRUE),
(10, 'ERRADO', FALSE);

-- Pergunta 11
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(11, 3, 'Na passagem de parâmetros por valor, alterar a variável dentro do método modifica a variável original no chamador?',
'O comportamento de argumentos em funções varia entre passagem por valor e por referência.',
'Na passagem por valor, uma cópia do dado é enviada. Alterações feitas na cópia dentro da função não afetam a variável original externa.',
'Microsoft C# Programming Guide',
'https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/passing-parameters');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(11, 'CERTO', FALSE),
(11, 'ERRADO', TRUE);

-- Pergunta 12
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(12, 3, 'Um Memory Leak acontece quando uma aplicação retém referências a objetos que não são mais necessários?',
'Problemas de consumo excessivo de RAM frequentemente ocorrem devido ao mau gerenciamento de referências.',
'O vazamento de memória (Memory Leak) ocorre quando blocos de memória inacessíveis pela lógica do negócio continuam alocados porque ainda existem referências retidas para eles.',
'MDN Web Docs Memory Management',
'https://developer.mozilla.org/en-US/docs/Web/JavaScript/Memory_management');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(12, 'CERTO', TRUE),
(12, 'ERRADO', FALSE);

-- Pergunta 13
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(13, 3, 'Injeção de Dependência é uma implementação do padrão de Inversão de Controle (IoC)?',
'Padrões de projeto ajudam a descompilar acoplamentos rígidos entre classes.',
'Injeção de Dependência é uma forma concreta de aplicar a Inversão de Controle, fornecendo as dependências externas a um componente em vez de deixá-lo instanciá-las internamente.',
'Martin Fowler Design Patterns',
'https://martinfowler.com/articles/injection.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(13, 'CERTO', TRUE),
(13, 'ERRADO', FALSE);

-- Pergunta 14
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(14, 4, 'A propriedade Durabilidade do ACID garante a permanência dos dados mesmo em caso de falha de energia imediatamente após o commit?',
'Transações em Bancos de Dados Relacionais seguem regras estritas para garantir confiabilidade.',
'A Durabilidade garante que, uma vez confirmada (committed) a transação, suas alterações persistirão no banco mesmo se houver falha de hardware, energia ou crash do sistema.',
'PostgreSQL Official Documentation',
'https://www.postgresql.org/docs/current/tutorial-transactions.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(14, 'CERTO', TRUE),
(14, 'ERRADO', FALSE);

-- Pergunta 15
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(15, 4, 'Índices Hash em bancos relacionais são mais indicados que B-Tree para consultas com operadores de intervalo (< e >)?',
'A escolha do tipo de índice impacta diretamente o plano de execução e performance de queries SQL.',
'Índices Hash funcionam apenas para buscas de igualdade exata (=). Para consultas de intervalo (<, >, BETWEEN), os índices B-Tree são os adequados por manterem os dados ordenados.',
'MySQL Reference Manual',
'https://dev.mysql.com/doc/refman/8.0/en/mysql-indexes.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(15, 'CERTO', FALSE),
(15, 'ERRADO', TRUE);

-- Pergunta 16
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(16, 4, 'O problema N+1 em ORMs acontece quando o sistema executa 1 query principal e N queries adicionais para trazer os relacionamentos de cada registro?',
'Mapeadores Objeto-Relacional como Hibernate ou Entity Framework exigem cuidados com estratégias de carregamento.',
'O problema N+1 é um gargalo comum em ORMs onde o carregamento preguiçoso (lazy loading) gera N consultas separadas ao banco para obter os relacionamentos dos N itens trazidos na consulta inicial.',
'Hibernate ORM User Guide',
'https://docs.jboss.org/hibernate/orm/current/userguide/html_single/Hibernate_User_Guide.html#fetching');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(16, 'CERTO', TRUE),
(16, 'ERRADO', FALSE);

-- Pergunta 17
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(17, 4, 'O conceito de Sharding consiste na divisão horizontal do banco de dados entre múltiplos servidores físicos independentes?',
'Estratégias de escalabilidade de bancos de dados são cruciais para grandes volumes de informação.',
'Sharding distribui registros de uma tabela entre instâncias/servidores distintos (horizontalmente), diferente do particionamento tradicional que ocorre no mesmo servidor.',
'MongoDB Manual - Sharding',
'https://www.mongodb.com/docs/manual/sharding/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(17, 'CERTO', TRUE),
(17, 'ERRADO', FALSE);

-- Pergunta 18
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(18, 4, 'Todos os bancos de dados NoSQL utilizam estritamente o modelo Chave-Valor?',
'Sistemas NoSQL oferecem flexibilidade para armazenar dados não estruturados.',
'O modelo NoSQL abrange quatro categorias principais: Documentos (ex: MongoDB), Chave-Valor (ex: Redis), Família de Colunas (ex: Cassandra) e Grafos (ex: Neo4j).',
'AWS NoSQL Documentation',
'https://aws.amazon.com/nosql/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(18, 'CERTO', FALSE),
(18, 'ERRADO', TRUE);

-- Pergunta 19
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(19, 4, 'Em uma arquitetura Primary-Secondary (Master-Replica), as escritas ocorrem no nó Primário e são replicadas para os Secundários?',
'Padrões de replicação são adotados para alta disponibilidade e separação de leituras/escritas.',
'O nó primário concentra as operações de modificação (INSERT/UPDATE/DELETE) e sincroniza os dados com as réplicas secundárias, que servem para distribuir as operações de leitura.',
'Redis Documentation',
'https://redis.io/docs/latest/operate/oss_and_stack/management/replication/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(19, 'CERTO', TRUE),
(19, 'ERRADO', FALSE);

-- Pergunta 20
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(20, 5, 'Containers Docker compartilham o mesmo kernel do sistema operacional hospedeiro?',
'A tecnologia de containerização revolucionou o empacotamento de software ao ser mais leve que máquinas virtuais.',
'Containers compartilham o kernel do sistema operacional do host e isolam apenas os processos de aplicação, diferente de VMs que sobem um SO completo com seu próprio kernel.',
'Docker Documentation',
'https://docs.docker.com/get-started/overview/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(20, 'CERTO', TRUE),
(20, 'ERRADO', FALSE);

-- Pergunta 21
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(21, 5, 'No Kubernetes, os Worker Nodes são os responsáveis únicos por tomar decisões de agendamento de Pods?',
'Arquiteturas de orquestração dividem responsabilidades entre nós de controle e nós de trabalho.',
'O agendamento (scheduling) de Pods é feito pelo componente kube-scheduler, que pertence estritamente ao Control Plane e não aos Worker Nodes.',
'Kubernetes Documentation',
'https://kubernetes.io/docs/concepts/overview/components/#control-plane-components');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(21, 'CERTO', FALSE),
(21, 'ERRADO', TRUE);

-- Pergunta 22
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(22, 5, 'Infraestrutura como Código (IaC) permite gerenciar e provisionar ambientes usando arquivos de configuração declarativos?',
'A automação de infraestrutura moderna reduz erros manuais em ambientes de nuvem.',
'Ferramentas como Terraform ou CloudFormation usam linguagens declarativas para versionar e aplicar a criação de recursos de infraestrutura via código.',
'HashiCorp Terraform Documentation',
'https://developer.hashicorp.com/terraform/intro');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(22, 'CERTO', TRUE),
(22, 'ERRADO', FALSE);

-- Pergunta 23
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(23, 5, 'A estratégia de deploy Blue/Green exige manter o sistema indisponível por várias horas para atualização?',
'Técnicas modernas de deploy visam minimizar o tempo de inatividade (downtime).',
'O deploy Blue/Green reduz o downtime a zero alternando o roteador de tráfego instantaneamente do ambiente atual (Blue) para o novo ambiente já atualizado (Green).',
'AWS Well-Architected Framework',
'https://docs.aws.amazon.com/whitepapers/latest/blue-green-deployments/introduction.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(23, 'CERTO', FALSE),
(23, 'ERRADO', TRUE);

-- Pergunta 24
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(24, 5, 'No modelo Serverless (FaaS), o desenvolvedor não precisa alocar ou gerenciar servidores físicos e virtuais?',
'A computação orientada a eventos abstrai a gestão direta do sistema operacional.',
'No modelo Serverless, o provedor de nuvem gerencia o provisionamento, dimensionamento e manutenção dos servidores, cobrando estritamente pelo tempo de execução da função.',
'Cloudflare Learning Center',
'https://www.cloudflare.com/learning/serverless/what-is-serverless/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(24, 'CERTO', TRUE),
(24, 'ERRADO', FALSE);

-- Pergunta 25
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(25, 5, 'Integração Contínua (CI) é o processo manual de copiar os arquivos de código para o servidor de produção?',
'Práticas de DevOps automatizam o ciclo de vida do desenvolvimento de software.',
'Integração Contínua (CI) é a prática automatizada de integrar alterações de código em um repositório compartilhado executando builds e testes automáticos.',
'GitLab Documentation',
'https://docs.gitlab.com/ee/ci/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(25, 'CERTO', FALSE),
(25, 'ERRADO', TRUE);

-- Pergunta 26
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(26, 5, 'Microserviços dividem uma aplicação em pequenos serviços independentes que comunicam-se via rede?',
'Arquiteturas de software mudaram do modelo monolítico para componentes desacoplados.',
'Na arquitetura de microserviços, cada funcionalidade de negócio é tratada como um serviço autônomo com seu próprio ciclo de vida e deploy separado.',
'Red Hat Architecture Topics',
'https://www.redhat.com/en/topics/microservices/what-are-microservices');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(26, 'CERTO', TRUE),
(26, 'ERRADO', FALSE);

-- Pergunta 27
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(27, 6, 'O uso de Prepared Statements (Consultas Parametrizadas) é a principal defesa contra vulnerabilidades de SQL Injection?',
'SQL Injection continua sendo uma das principais ameaças a sistemas web segundo a OWASP.',
'Consultas parametrizadas garantem que o mecanismo do banco trate os dados inseridos pelo usuário estritamente como parâmetros, impedindo a interpretação de comandos SQL maliciosos.',
'OWASP Top 10 Specification',
'https://owasp.org/Top10/A03_2021-Injection/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(27, 'CERTO', TRUE),
(27, 'ERRADO', FALSE);

-- Pergunta 28
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(28, 6, 'A Criptografia Assimétrica utiliza uma única chave privada compartilhada para cifrar e decifrar as mensagens?',
'Algoritmos de criptografia são a base da segurança da informação na internet.',
'A criptografia que usa uma única chave é a Simétrica. A Criptografia Assimétrica utiliza um par de chaves matematicamente conectadas: uma Chave Pública (cifrar) e uma Chave Privada (decifrar).',
'NIST Computer Security Resource Center',
'https://csrc.nist.gov/glossary/term/asymmetric_cryptography');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(28, 'CERTO', FALSE),
(28, 'ERRADO', TRUE);

-- Pergunta 29
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(29, 6, 'Ataques de Cross-Site Scripting (XSS) injetam scripts maliciosos em páginas navegadas por outros usuários?',
'Falhas de segurança em aplicações web frequentemente exploram o contexto do navegador.',
'O XSS permite que atacantes injetem scripts do lado do cliente (como JavaScript) em páginas legítimas, podendo roubar cookies, tokens de sessão ou manipular o DOM do usuário.',
'OWASP Cheat Sheet Series',
'https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(29, 'CERTO', TRUE),
(29, 'ERRADO', FALSE);

-- Pergunta 30
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(30, 6, 'O protocolo OAuth 2.0 exige que o usuário passe sua senha mestre para a aplicação de terceiros acessar seus dados?',
'Sistemas de autorização moderna evitam o compartilhamento direto de credenciais de usuário.',
'O OAuth 2.0 concede acesso a recursos por meio de tokens de autorização específicos (Access Tokens), sem que o usuário precise expor suas credenciais ou senhas para a aplicação terceira.',
'IETF RFC 6749 Specification',
'https://datatracker.ietf.org/doc/html/rfc6749');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(30, 'CERTO', FALSE),
(30, 'ERRADO', TRUE);

-- Pergunta 31
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(31, 6, 'O Princípio do Menor Privilégio exige que usuários recebam apenas as permissões mínimas necessárias para suas tarefas?',
'Políticas de segurança corporativa buscam restringir o raio de alcance de possíveis incidentes.',
'Esse princípio de segurança dita que qualquer entidade (usuário ou processo) deve ter acesso apenas aos recursos estritamente necessários para desempenhar suas atribuições legítimas.',
'CISA Security Guidelines',
'https://www.cisa.gov/uscert/bsi/articles/knowledge/principles/least-privilege');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(31, 'CERTO', TRUE),
(31, 'ERRADO', FALSE);

-- Pergunta 32
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(32, 6, 'A política CORS impede que um próprio servidor aceite requisições vindas do seu próprio domínio original?',
'Mecanismos de segurança em navegadores limitam interações entre origens distintas.',
'O CORS (Cross-Origin Resource Sharing) bloqueia ou permite requisições feitas por domínios/origens *diferentes* do servidor. Requisições da mesma origem (same-origin) são sempre liberadas.',
'W3C Recommendation',
'https://www.w3.org/TR/cors/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(32, 'CERTO', FALSE),
(32, 'ERRADO', TRUE);

-- Pergunta 33
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(33, 6, 'Autenticação valida a identidade do usuário e Autorização determina suas permissões no sistema?',
'Controle de acesso é dividido em duas etapas distintas na arquitetura de software.',
'Autenticação responde à pergunta "Quem é você?" (validação de credencial), enquanto Autorização responde "O que você tem permissão para fazer?".',
'Okta Developer Documentation',
'https://developer.okta.com/docs/concepts/auth-overview/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(33, 'CERTO', TRUE),
(33, 'ERRADO', FALSE);

-- Pergunta 34
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(34, 7, 'Overfitting ocorre quando um modelo de IA performa perfeitamente nos dados de treino, mas falha em dados novos?',
'Treinar modelos de Machine Learning exige um equilíbrio delicado entre generalização e capacidade de ajuste.',
'Overfitting acontece quando o modelo decorou os ruídos e detalhes específicos dos dados de treinamento, perdendo a capacidade de generalizar para dados nunca vistos anteriormente.',
'Scikit-Learn User Guide',
'https://scikit-learn.org/stable/modules/learning_curve.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(34, 'CERTO', TRUE),
(34, 'ERRADO', FALSE);

-- Pergunta 35
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(35, 7, 'A arquitetura Transformer utiliza o mecanismo de Self-Attention para processar textos em paralelo?',
'Modelos de Linguagem de Grande Porte (LLMs) dependem da arquitetura Transformer lançada em 2017.',
'Diferente das redes recorrentes (RNNs) que processavam palavra por palavra em sequência, o Transformer processa todas as palavras simultaneamente com atenção global.',
'arXiv Research Paper (Vaswani et al.)',
'https://arxiv.org/abs/1706.03762');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(35, 'CERTO', TRUE),
(35, 'ERRADO', FALSE);

-- Pergunta 36
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(36, 7, 'O Aprendizado Não-Supervisionado exige dados anotados com rótulos e respostas conhecidas previamente?',
'Algoritmos de aprendizado de máquina são classificados pelo modo como processam dados de entrada.',
'O aprendizado que usa dados rotulados é o Supervisionado. O Não-Supervisionado trabalha com dados sem rótulos para identificar padrões e agrupamentos ocultos (ex: clustering).',
'IBM Machine Learning Concepts',
'https://www.ibm.com/topics/unsupervised-learning');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(36, 'CERTO', FALSE),
(36, 'ERRADO', TRUE);

-- Pergunta 37
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(37, 7, 'A técnica RAG (Retrieval-Augmented Generation) consulta bases de dados externas para enriquecer as respostas de um LLM?',
'Reduzir alucinações e trazer fatos atualizados para modelos de linguagem é um desafio em IA.',
'A RAG busca dados atualizados em uma base de conhecimento externa e os repassa como contexto no prompt do modelo de linguagem antes de gerar a resposta final.',
'AWS Machine Learning Guides',
'https://aws.amazon.com/what-is/retrieval-augmented-generation/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(37, 'CERTO', TRUE),
(37, 'ERRADO', FALSE);

-- Pergunta 38
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(38, 7, 'O algoritmo Gradient Descent é projetado para maximizar a taxa de erro de um modelo preditivo?',
'O ajuste de pesos em redes neurais depende de algoritmos matemáticos de otimização.',
'O Gradient Descent é um algoritmo otimizador que busca *minimizar* a função de perda (erro) ajustando iterativamente os parâmetros do modelo na direção oposta ao gradiente.',
'DeepLearning.AI Notes',
'https://www.deeplearning.ai/ai-notes/optimization/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(38, 'CERTO', FALSE),
(38, 'ERRADO', TRUE);

-- Pergunta 39
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(39, 8, 'O ciclo básico do TDD (Test-Driven Development) é conhecido pela sequência Red, Green, Refactor?',
'Desenvolvimento orientado a testes propõe uma mudança na ordem tradicional de codificação.',
'No TDD, o desenvolvedor escreve primeiro um teste que falha (Red), implementa o código estritamente necessário para passar (Green) e depois melhora a estrutura do código (Refactor).',
'Agile Alliance Glossary',
'https://www.agilealliance.org/glossary/tdd/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(39, 'CERTO', TRUE),
(39, 'ERRADO', FALSE);

-- Pergunta 40
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(40, 8, 'Testes Unitários dependem da conexão com redes e bancos de dados em produção para validar funções isoladas?',
'A pirâmide de testes separa a abrangência e isolamento das baterias de testes automatizados.',
'Testes unitários devem ser totalmente isolados de dependências externas (como bancos ou APIs). Para isso, utilizam-se Mocks e Stubs para simular essas dependências com velocidade.',
'Google Testing Blog',
'https://testing.googleblog.com/2015/04/just-say-no-to-more-end-to-end-tests.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(40, 'CERTO', FALSE),
(40, 'ERRADO', TRUE);

-- Pergunta 41
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(41, 8, 'Objetos Mock são simulações programadas para verificar expectativas e chamadas em testes automatizados?',
'A criação de dublês de testes ajuda na verificação de comportamento em código orientado a objetos.',
'Mocks são tipos de objetos dublês que vêm pré-programados com expectativas sobre as chamadas de métodos que se espera que recebam durante o teste.',
'Martin Fowler - Mocks Aren''t Stubs',
'https://martinfowler.com/articles/mocksArentStubs.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(41, 'CERTO', TRUE),
(41, 'ERRADO', FALSE);

-- Pergunta 42
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(42, 9, 'A métrica LCP (Largest Contentful Paint) mede o tempo de renderização do maior elemento visível da página?',
'O Google utiliza as métricas Core Web Vitals para avaliar a experiência do usuário e performance web.',
'O LCP avalia a velocidade percebida de carregamento medindo quando o bloco de conteúdo principal (como uma imagem de destaque ou título grande) é renderizado.',
'web.dev (Google)',
'https://web.dev/articles/lcp');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(42, 'CERTO', TRUE),
(42, 'ERRADO', FALSE);

-- Pergunta 43
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(43, 9, 'CDNs reduzem o tempo de carregamento ao centralizar todas as requisições em um único servidor em um país específico?',
'Redes de Distribuição de Conteúdo garantem velocidade global no acesso a páginas web.',
'CDNs funcionam exatamente de forma contrária: distribuem réplicas de arquivos estáticos em servidores geograficamente próximos aos usuários finais (Edge Locations) para mitigar a latência.',
'Akamai CDN Insights',
'https://www.akamai.com/our-thinking/cdn-network-overview');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(43, 'CERTO', FALSE),
(43, 'ERRADO', TRUE);

-- Pergunta 44
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(44, 9, 'O HTTP/3 adota o protocolo QUIC baseado em UDP para evitar o bloqueio de início de fila (Head-of-Line Blocking)?',
'A evolução das especificações da web visa resolver limitações do protocolo TCP.',
'O HTTP/3 utiliza QUIC sobre UDP, garantindo que a perda de um pacote em um fluxo individual de dados não trave a transferência das demais conexões multiplexadas.',
'IETF RFC 9114 Specification',
'https://datatracker.ietf.org/doc/html/rfc9114');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(44, 'CERTO', TRUE),
(44, 'ERRADO', FALSE);

-- Pergunta 45
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(45, 9, 'No padrão Write-Through, a atualização do cache ocorre em segundo plano horas após o registro no banco?',
'A sincronização de cache exige estratégias alinhadas aos requisitos de consistência da aplicação.',
'Na estratégia Write-Through, a gravação na camada de cache ocorre simultaneamente e de forma síncrona com a escrita no banco de dados primário.',
'Microsoft Cloud Patterns',
'https://learn.microsoft.com/en-us/azure/architecture/patterns/cache-aside');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(45, 'CERTO', FALSE),
(45, 'ERRADO', TRUE);

-- Pergunta 46
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(46, 10, 'No Linux, o sinal SIGKILL (sinal 9) pode ser interceptado por uma aplicação para salvar dados antes de encerrar?',
'O gerenciamento de processos via sinais POSIX possui níveis diferentes de privilégio.',
'O sinal SIGKILL força a interrupção imediata pelo kernel e não pode ser capturado, bloqueado ou ignorado pela aplicação. Para finalização graciosa, utiliza-se o SIGTERM.',
'Linux Man Pages - Signal(7)',
'https://man7.org/linux/man-pages/man7/signal.7.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(46, 'CERTO', FALSE),
(46, 'ERRADO', TRUE);

-- Pergunta 47
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(47, 10, 'Condições de Corrida (Race Conditions) acontecem quando múltiplos processos acessam e alteram um recurso compartilhado sem controle concorrente?',
'Sistemas multithreaded exigem mecanismos de trava (Mutex) para manter consistência de memória.',
'Race conditions ocorrem quando o resultado final da execução depende da ordem temporal imprevisível em que duas ou mais threads lêem ou gravam na mesma variável.',
'MIT CSAIL Course Notes',
'https://web.mit.edu/6.005/www/fa15/classes/20-thread-safety/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(47, 'CERTO', TRUE),
(47, 'ERRADO', FALSE);

-- Pergunta 48
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(48, 10, 'A Memória Virtual permite ao sistema operacional alocar endereços lógicos maiores que a memória RAM física instalada?',
'A gestão de memória em sistemas operacionais utiliza a paginação e o disco para estender recursos.',
'A memória virtual abstrai a memória física, usando espaço em disco (swap/paging) para permitir que processos rodem mesmo ultrapassando a capacidade instalada de memória RAM física.',
'Operating System Concepts (Silberschatz)',
'https://www.os-book.com/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(48, 'CERTO', TRUE),
(48, 'ERRADO', FALSE);

-- Pergunta 49
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(49, 10, 'O conceito de SRE (Site Reliability Engineering) defende a execução manual de tarefas repetitivas de infraestrutura?',
'Práticas criadas no Google unem engenharia de software com operações para garantir a disponibilidade de sistemas.',
'O SRE atua no sentido oposto: incentiva a automação contínua de tarefas operacionais repetitivas (denominadas "toil") para que os engenheiros foquem em evolução do sistema.',
'Google SRE Book',
'https://sre.google/sre-book/introduction/');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(49, 'CERTO', FALSE),
(49, 'ERRADO', TRUE);

-- Pergunta 50
INSERT INTO perguntas (id, categoria_id, enunciado, contexto, explicacao, fonte_nome, fonte_url) VALUES
(50, 10, 'A Lei de Conway estabelece que a arquitetura de um software reflete as estruturas de comunicação da empresa que o criou?',
'Estudos sobre sociologia das organizações influenciam o design de software moderno.',
'Formulada por Melvin Conway, a lei afirma que o design dos sistemas desenvolvidos por uma organização tende a espelhar rigorosamente as suas próprias estruturas de comunicação interna.',
'Mel Conway Official Paper',
'http://www.melconway.com/research/committees.html');

INSERT INTO opcoes (pergunta_id, texto_opcao, eh_correta) VALUES
(50, 'CERTO', TRUE),
(50, 'ERRADO', FALSE);

-- ============================================================
-- 3. CONSULTA DE VERIFICAÇÃO (PARA TESTAR NO PGADMIN)
-- ============================================================

SELECT 
    p.id,
    c.nome AS categoria,
    p.enunciado,
    o.texto_opcao,
    o.eh_correta,
    p.explicacao,
    p.fonte_nome,
    p.fonte_url
FROM perguntas p
JOIN categorias c ON p.categoria_id = c.id
JOIN opcoes o ON o.pergunta_id = p.id
ORDER BY p.id, o.id;