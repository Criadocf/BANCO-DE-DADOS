CREATE TABLE Clientes
(
  cod_cliente   SERIAL          NOT NULL,
  nome          VARCHAR(40)     NOT NULL,
  telefone      VARCHAR(20)     NULL,
  identidade    VARCHAR(20)     NULL UNIQUE,
  sexo          CHAR(1)         NULL,
  rua           VARCHAR(40)     NULL,
  numero        VARCHAR(10)     NULL,
  bairro        VARCHAR(40)     NULL,
  cep           VARCHAR(8)      NULL,
  cidade        VARCHAR(40)     NULL,
  uf            CHAR(2)         NULL,
  PRIMARY KEY(cod_cliente )
);

CREATE TABLE Funcionarios
(
  cod_funcionario SERIAL       NOT NULL,
  nome            VARCHAR(40)  NULL,
  data_nascimento DATE         NULL,
  identidade      VARCHAR(20)  NOT NULL UNIQUE,
  cpf             VARCHAR(11)  NULL,
  sexo            CHAR(1)      NULL,
  rua             VARCHAR(40)  NULL,
  numero          VARCHAR(10)  NULL,
  bairro          VARCHAR(40)  NULL,
  cep             VARCHAR(8)   NULL,
  cidade          VARCHAR(40)  NULL,
  telefone        VARCHAR(15)  NULL,
  data_adimissao  DATE         NULL,
  data_demissao   DATE         NULL,
  salario         NUMERIC(9,2) NULL,
  PRIMARY KEY(cod_funcionario)
);

CREATE TABLE Pedidos
(
  num_pedido       SERIAL  NOT NULL,
  cod_funcionario  INTEGER NOT NULL,
  cod_cliente      INTEGER NOT NULL,
  data_pedido      DATE    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  total_pago       NUMERIC(9,2) NOT NULL CHECK (total_pago > '0.00' AND total_pago < '20000.00') ,
  PRIMARY KEY(num_pedido),
  CONSTRAINT REST_PedidosClientes FOREIGN KEY (cod_cliente)
       REFERENCES Clientes(cod_cliente) ON DELETE CASCADE
                                       ON UPDATE CASCADE,
  CONSTRAINT REST_PedidosFuncionarios FOREIGN KEY (cod_funcionario)
       REFERENCES Funcionarios(cod_funcionario) ON DELETE CASCADE
                                       ON UPDATE CASCADE
);




CREATE TABLE Autores
(
  cod_autor SERIAL       NOT NULL,
  nome      VARCHAR(40)  NULL,
  PRIMARY KEY(cod_autor)
);


CREATE TABLE PalavrasChaves
(
  cod_palavra SERIAL       NOT NULL,
  descricao   VARCHAR(30)  NULL,
  PRIMARY KEY(cod_palavra)
);


CREATE TABLE Editoras
(
  cod_editora  SERIAL       NOT NULL,
  nome         VARCHAR(40)  NOT NULL,
  telefone     VARCHAR(15) NULL,
  PRIMARY KEY(cod_editora)
);

CREATE TABLE CategoriaLivros
(
  cod_categoria   SERIAL      NOT NULL,
  desc_categoria  VARCHAR(30) NULL,
  PRIMARY KEY(cod_categoria)
);

CREATE TABLE Encomendas
(
  num_encomenda    SERIAL   NOT NULL,
  cod_funcionario  INTEGER  NOT NULL,
  cod_cliente      INTEGER  NOT NULL,
  data_encomenda   DATE     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  prazo_estimado   INTEGER  NOT NULL DEFAULT 5,
  PRIMARY KEY(num_encomenda),
  CONSTRAINT REST_EncomendasClientes FOREIGN KEY (cod_cliente)
       REFERENCES Clientes(cod_cliente) ON DELETE CASCADE
                                       ON UPDATE CASCADE,

  CONSTRAINT REST_EncomendasFuncionarios FOREIGN KEY (cod_funcionario)
       REFERENCES Funcionarios(cod_funcionario) ON DELETE CASCADE
                                       ON UPDATE CASCADE
);


CREATE TABLE Livros
(
  isbn            VARCHAR(15)  NOT NULL,
  cod_categoria   INTEGER      NOT NULL,
  cod_editora     INTEGER      NOT NULL,
  titulo          VARCHAR(40)  NOT NULL,
  data_publicacao DATE         NOT NULL,
  num_edicao      INTEGER      NULL,
  volume          INTEGER      NULL,
  preco           NUMERIC(7,2) NULL,
  PRIMARY KEY(isbn),
  CONSTRAINT REST_CategoriaLivros FOREIGN KEY (cod_categoria)
       REFERENCES CategoriaLivros(cod_categoria) ON DELETE CASCADE
                                                 ON UPDATE CASCADE,
  CONSTRAINT REST_EditorasLivros FOREIGN KEY (cod_editora)
       REFERENCES Editoras(cod_editora) ON DELETE CASCADE
                                                 ON UPDATE CASCADE                                               
);

CREATE TABLE PedidosLivros
(
  isbn        VARCHAR(15) NOT NULL,
  num_pedido  INTEGER     NOT NULL,
  quantidade  INTEGER     NOT NULL,
  PRIMARY KEY(isbn, num_pedido),
  CONSTRAINT REST_PedidosLivrosLivros FOREIGN KEY (isbn)
       REFERENCES Livros(isbn) ON DELETE CASCADE
                               ON UPDATE CASCADE,
  CONSTRAINT REST_PedidosLivrosPedidos FOREIGN KEY (num_pedido)
       REFERENCES Pedidos(num_pedido) ON DELETE CASCADE
                                                 ON UPDATE CASCADE                             
);

CREATE TABLE EncomendasLivros
(
  num_encomenda   INTEGER     NOT NULL,
  isbn            VARCHAR(15) NOT NULL,
  quantidade  INTEGER     NOT NULL,
  PRIMARY KEY(num_encomenda, isbn),
  CONSTRAINT REST_EncomendasLivrosLivros FOREIGN KEY (isbn)
       REFERENCES Livros(isbn) ON DELETE CASCADE
                               ON UPDATE CASCADE,
  CONSTRAINT REST_EncomendasLivrosEncomendas FOREIGN KEY (num_encomenda)
       REFERENCES Encomendas(num_encomenda) ON DELETE CASCADE
                                                 ON UPDATE CASCADE
);

CREATE TABLE PalavrasChavesLivros
(
  isbn         VARCHAR(15) NOT NULL,
  cod_palavra  INTEGER     NOT NULL,
  PRIMARY KEY(isbn, cod_palavra),
  CONSTRAINT REST_PalavrasChavesLivrosLivros FOREIGN KEY (isbn)
       REFERENCES Livros(isbn) ON DELETE CASCADE
                               ON UPDATE CASCADE,
  CONSTRAINT REST_PalavrasChavesLivrosPalavrasChaves FOREIGN KEY (cod_palavra)
       REFERENCES PalavrasChaves(cod_palavra) ON DELETE CASCADE
                                                 ON UPDATE CASCADE
);

CREATE TABLE AutoresLivros
(
  isbn       VARCHAR(15) NOT NULL,
  cod_autor  INTEGER     NOT NULL,
  PRIMARY KEY(isbn, cod_autor),
  CONSTRAINT REST_AutoresLivrosLivros FOREIGN KEY (isbn)
       REFERENCES Livros(isbn) ON DELETE CASCADE
                               ON UPDATE CASCADE,
  CONSTRAINT REST_AutoresLivrosAutores FOREIGN KEY (cod_autor)
       REFERENCES Autores(cod_autor) ON DELETE CASCADE
                                                 ON UPDATE CASCADE
);

--INSERCAO DE REGISTROS
INSERT INTO autores (nome)
           VALUES ('Roger S. Pressman');

INSERT INTO autores (nome)
           VALUES ('Meilir Page-Jones');

INSERT INTO autores (nome)
           VALUES ('José Ramalho');

INSERT INTO autores (nome)
           VALUES ('C. J. Date');

INSERT INTO autores (nome)
           VALUES ('João Antônio Lopes');

INSERT INTO autores (nome)
           VALUES ('Hélio de Barros');

INSERT INTO autores (nome)
           VALUES ('Othon Passos');

INSERT INTO autores (nome)
           VALUES ('Louis Leithold');

INSERT INTO autores (nome)
           VALUES ('Machado de Assis');

INSERT INTO autores (nome)
           VALUES ('Tanenbaum');

--
-- INSERINDO DADOS NA TABELA categorialivros
--

INSERT INTO categorialivros (desc_categoria) VALUES ('Informática');

INSERT INTO categorialivros (desc_categoria) VALUES ('Engenharia');

INSERT INTO categorialivros (desc_categoria) VALUES ('Turismo');

INSERT INTO categorialivros (desc_categoria) VALUES ('Direito');

INSERT INTO categorialivros (desc_categoria) VALUES ('Literatura');


--
-- INSERINDO DADOS NA TABELA PALVRASCHAVES
--

INSERT INTO palavraschaves (descricao)
                   VALUES ('Métricas');

INSERT INTO palavraschaves (descricao)
                   VALUES ('Capitu');

INSERT INTO palavraschaves (descricao)
                   VALUES ('Direito Civil');

INSERT INTO palavraschaves (descricao)
                   VALUES ('Redes');

INSERT INTO palavraschaves (descricao)
                   VALUES ('Banco de Dados');

INSERT INTO palavraschaves (descricao)
                   VALUES ('TCP/IP');

INSERT INTO palavraschaves (descricao)
                   VALUES ('DNS');

INSERT INTO palavraschaves (descricao)
                   VALUES ('CASE');

INSERT INTO palavraschaves (descricao)
                   VALUES ('DER');

INSERT INTO palavraschaves (descricao)
                   VALUES ('DFD');

--
-- INSERINDO DADOS NA TABELA editoras
--

INSERT INTO editoras (nome, telefone)
             VALUES ('Makron Books', '(11)3849-8604');

INSERT INTO editoras (nome, telefone)
             VALUES ('Campus', '(11)3849-8784');

INSERT INTO editoras (nome, telefone)
             VALUES ('Bookman', '(31)2227-7784');

INSERT INTO editoras (nome, telefone)
             VALUES ('Prentice-Hall', '(31)2228-7784');

INSERT INTO editoras (nome, telefone)
             VALUES ('Saraiva', '(31)2229-7784');

INSERT INTO editoras (nome, telefone)
             VALUES ('Globo', '(21)222-7784');


--
-- INSERINDO DADOS NA TABELA clientes
--

INSERT INTO clientes (nome, rua, numero, bairro, 
                     cidade, uf, cep, telefone, identidade,
                     sexo)
             VALUES ('Gilberto Ribeiro de Queiroz', 'Aquárius', '258',
                     'Vila São José', 'São José dos Campos', 'MG',
                     '12227320', '3911-7707', 'M-X.XXX.XXX', 'M');

INSERT INTO clientes (nome, rua, numero, bairro, 
                     cidade, uf, cep, telefone, identidade,
                     sexo)
             VALUES ('Eduardo Ribeiro de Queiroz', 'Albino Sartori',
                     '95', 'Vila São José', 'Ouro Preto', 'MG',
                     '35400000', '3551-4243', 'M-X.23X.0X4', 'M');

INSERT INTO clientes (nome, rua, numero, bairro, 
                     cidade, uf, cep, telefone, identidade,
                     sexo)
             VALUES ('Telma Ribeiro de Queiroz', '36', '1020',
                     'Centro', 'Ituiutaba', 'SP',
                     '36400000', '3921-1248', 'M-19.239.013', 'F');


INSERT INTO clientes (nome, rua, numero, bairro, 
                     cidade, uf, cep, telefone, identidade,
                     sexo)
             VALUES (1,'Ângela Tóffolo de Queiroz', 'Pandiá Calógeras',
                    '580', 'Cabeças', 'Ouro Preto', 'MT', '35400000',
                    '3551-1807', 'M-9.239.019', 'F');


INSERT INTO clientes (nome, rua, numero, bairro, 
                     cidade, uf, cep, telefone, identidade,
                     sexo)
             VALUES ('Gilberto Queiroz da Silva', 'Goiás', '58',
                     'Centro', 'Santa Vitória', 'GO',
                     '12327320', '4911-7707', 'M-9.239.000', 'M');


--
-- INSERINDO DADOS NA TABELA FUNCIONARIOS
--

INSERT INTO funcionarios (nome, data_nascimento,
                         identidade, cpf, rua, numero, bairro, cidade,
                         telefone, data_adimissao, sexo)
                 VALUES ('Emanuel', '1976-12-30', 'M-999.999.999',
                        '12345678900', '13 de Maio', '13', 'São João',
                        'São João Nepomuceno', '333-3333', '1996-01-01',
                        'M');

--
-- INSERINDO DADOS NA TABELA livros
--

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Engenharia de Software', '8534602379',
                   '1995-01-01', 3, 0, 1, 1, '75.00');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Redes de Computadores', '0000000001',  '1993-01-01',
                   3, 0, 1, 2, '95.00');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Clipper 5.2 – Iniciação e Referência', '0000000002',
                   '1998-01-01', 2, 1, 1, 1, '65.00');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Clipper 5.2 – Avançado', '0000000003',
                   '1999-01-01', 1, 2, 1, 1, '45.00');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Sistemas Operacionais Modernos', '0000000004',
                   '1992-01-01', 2, 0, 1, 4, '125.00');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Cálculo com Geometria Analítica', '0000000005',
                   '1990-01-01', 6, 1, 2, 1, '99.99');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Organização Hoteleira', '0000000006',
                   '2001-01-01', 1, 0, 3, 3, '29.90');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Código Civil Comentado', '0000000007',
                   '2000-01-01', 1, 0, 4, 5, '129.90');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Helena', '0000000008', '1996-01-01', 1, 0, 5, 6,
                   '9.90');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Dom Casmurro', '0000000009', '1996-02-01', 1, 0, 5,
                   6, '9.90');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Iaiá Garcia', '0000000010', '1996-03-01', 1, 0, 5,
                   6, '9.90');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('A Mão e a Luva', '0000000011', '1996-04-01', 1, 0,
                   5, 6, '9.90');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Quincas Borba', '0000000012', '1996-05-01', 1, 0,
                   5, 6, '9.90');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Memórias Póstumas de Brás Cubas', '0000000013',
                   '1996-06-01', 1, 0, 5, 6, '9.90');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('SQL Server 7.0 – Iniciação e Referência',
                   '0000000014', '1998-01-01', 1, 0, 1, 1, '165.00');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Introdução a Sistema de Bancos de Dados', 
                   '0000000015', '1995-01-01', 4, 0, 1, 2,  '64.00');

INSERT INTO livros (titulo, isbn, data_publicacao, num_edicao,
                   volume, cod_categoria, cod_editora, preco)
           VALUES ('Projeto Orientado a Objetos', 
                   '0000000016', '2001-01-01', 1, 0, 1, 1,  '264.00');


--
-- INSERINDO DADOS NA TABELA pedidos
--

INSERT INTO pedidos (data_pedido, total_pago, cod_cliente,
                    cod_funcionario)
            VALUES ('1999-06-06', '74.90', 1, 1);

INSERT INTO pedidos (data_pedido, total_pago, cod_cliente,
                    cod_funcionario)
            VALUES ('2000-06-06', '74.90', 1, 1);

INSERT INTO pedidos (data_pedido, total_pago, cod_cliente,
                    cod_funcionario)
            VALUES ('2001-06-06', '198', 1, 1);

INSERT INTO pedidos (data_pedido, total_pago, cod_cliente,
                    cod_funcionario)
            VALUES ('2001-06-06', '157.08', 2, 1);


--
-- INSERINDO DADOS NA TABELA pedidoslivros
--

INSERT INTO pedidoslivros (num_pedido, isbn, quantidade)
                  VALUES (1, '0000000010', 1);

INSERT INTO pedidoslivros (num_pedido, isbn, quantidade)
                  VALUES (1, '0000000002', 1);

INSERT INTO pedidoslivros (num_pedido, isbn, quantidade)
                  VALUES (2, '0000000010', 1);

INSERT INTO pedidoslivros (num_pedido, isbn, quantidade)
                  VALUES (3, '0000000001', 1);

INSERT INTO pedidoslivros (num_pedido, isbn, quantidade)
                  VALUES (3, '0000000004', 2);

INSERT INTO pedidoslivros (num_pedido, isbn, quantidade)
                  VALUES (4, '0000000014', 1);

INSERT INTO pedidoslivros (num_pedido, isbn, quantidade)
                  VALUES (4, '0000000013', 1);

INSERT INTO pedidoslivros (num_pedido, isbn, quantidade)
                  VALUES (4, '0000000012', 2);


--
-- INSERINDO DADOS NA TABELA autoreslivros
--

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('8534602379', 1);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000016', 2);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000002', 3);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000003', 3);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000014', 3);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000015', 4);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000006', 5);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000007', 6);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000007', 7);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000005', 8);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000008', 9);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000009', 9);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000010', 9);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000011', 9);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000012', 9);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000013', 9);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000001', 10);

INSERT INTO autoreslivros (isbn, cod_autor)
                 VALUES ('0000000004', 10);



--ATIVIDADE DE BANCO DE DADOS BASEADO NO BANCO DE DADOS LIVRARIA.
/*Utilizando o banco de dados livraria, crie as consultas para responder as seguintes questões:
a)    Obter todos os dados de todos os funcionários:
b)    Obter todos os dados de todos os clientes:
c)    Obter o código, nome e telefone de todos os clientes:
d)    Obter os pedidos com total pago maior que R$120,00:
e)    Obter os pedidos com total pago maior que R$120,00, com o valor convertido para dólar ($1,00 = R$2,50):
f)     Obter os pedidos com total pago maior que R$120,00 do cliente 1, com o valor convertido para dólar ($1,00 = R$2,50):
g)    Listar os clientes em ordem alfabética crescente de nomes:
h)    Listar os livros em ordem decrescente de preço:
i)     Listar os livros em ordem decrescente de preço e se houver empate de preços colocar em ordem alfabética crescente pelo título:
j)     Verificar se existe algum livro com o título: “ENGENHARIA DE SOFTWARE”:
k)    Listar os clientes que começam com a palavra “Gilberto”:
l)     Atualizar o nome do bairro do cadastro do cliente "Gilberto Ribeiro de Queiroz" (cod_cliente = 1) para "Jardim da Granja":
m)  Remover os clientes do estado de Minas Gerais:*/


--a)Obter todos os dados de todos os funcionários:
SELECT * FROM funcionarios

--b)Obter todos os dados de todos os clientes:
SELECT * FROM clientes

--c)Obter o código, nome e telefone de todos os clientes:
SELECT cod_cliente, nome, telefone FROM clientes

--d)Obter os pedidos com total pago maior que R$120,00:
SELECT * FROM pedidos
WHERE total_pago > 120

--e)Obter os pedidos com total pago maior que R$120,00, com o valor convertido para dólar ($1,00 = R$2,50):
SELECT * FROM pedidos
WHERE total_pago > (120/2.50)

--f)Obter os pedidos com total pago maior que R$120,00 do cliente 1, com o valor convertido para dólar ($1,00 = R$2,50):
SELECT * FROM pedidos
WHERE cod_cliente = 1

--g) Listar os clientes em ordem alfabética crescente de nomes:
SELECT * FROM clientes
ORDER BY nome

--h) Listar os livros em ordem decrescente de preço:
SELECT * FROM livros
ORDER BY preco DESC

--i) Listar os livros em ordem decrescente de preço e se houver empate de preços colocar em ordem alfabética crescente pelo título:
SELECT * FROM livros
ORDER BY preco,titulo DESC

--j)Verificar se existe algum livro com o título: “ENGENHARIA DE SOFTWARE”:
SELECT * FROM livros
WHERE titulo ILIKE 'EnGeNHARIA de SOftwarE'

--k)Listar os clientes que começam com a palavra “Gilberto”:
SELECT * FROM clientes
WHERE nome SIMILAR TO '[GIlbertO]%'

--l)Atualizar o nome do bairro do cadastro do cliente "Gilberto Ribeiro de Queiroz" (cod_cliente = 1) para "Jardim da Granja":
UPDATE clientes
SET  bairro = 'Jardim da Granja'
WHERE cod_cliente = 1

--m)Remover os clientes do estado de Minas Gerais:
DELETE FROM clientes
WHERE uf = 'MG'
