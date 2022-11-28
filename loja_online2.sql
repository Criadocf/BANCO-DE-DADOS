--Criar um arquivo texto contendo os 
--comandos DDL da SQL

CREATE TABLE forma_pagamento (
  idformapag SERIAL NOT NULL,
  descricao VARCHAR(50) NULL,
  PRIMARY KEY(idformapag)
);

CREATE TABLE tipo_mercadoria (
  idtipomercadoria SERIAL NOT NULL,
  descricao VARCHAR(100) NULL,
  PRIMARY KEY(idtipomercadoria)
);

CREATE TABLE status_pedido (
  idstatuspedido SERIAL NOT NULL,
  descricao VARCHAR(50) NULL,
  PRIMARY KEY(idstatuspedido)
);

CREATE TABLE endereco (
  idenderecos SERIAL NOT NULL,
  logradouro VARCHAR(100) NULL,
  numero INTEGER NULL,
  complemento VARCHAR(30) NULL,
  bairro VARCHAR(50) NULL,
  cep INTEGER NULL,
  cidade VARCHAR(100) NULL,
  sigla_estado VARCHAR(2) NULL,
  PRIMARY KEY(idenderecos)
);

CREATE TABLE mercadoria (
  codigo INTEGER NOT NULL,
  tipo_mercadoria INTEGER NOT NULL,
  descricao VARCHAR(300) NULL,
  preco_venda FLOAT NOT NULL
		  CHECK (preco_venda > 0.00),
  PRIMARY KEY(codigo),
  FOREIGN KEY(tipo_mercadoria)
    REFERENCES Tipo_mercadoria(idtipomercadoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE cliente (
  email VARCHAR(50) NOT NULL,
  endereco INTEGER  NOT NULL,
  nome VARCHAR(50) NULL,
  data_nascimento DATE NULL,
  fone_residencial INTEGER  NULL,
  fone_celular INTEGER  NULL,
  cpf INTEGER  NULL,
  senha VARCHAR(8) NULL,
  PRIMARY KEY(email),
  FOREIGN KEY(endereco)
    REFERENCES Endereco(idenderecos)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE loja (
  numero_loja INTEGER NOT NULL,
  endereco INTEGER NOT NULL,
  nome VARCHAR(100) NULL,
  telefone_contato INTEGER NULL,
  PRIMARY KEY(numero_loja),
  FOREIGN KEY(endereco)
    REFERENCES Endereco(idenderecos)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE loja_mercadoria (
  loja INTEGER  NOT NULL,
  mercadoria INTEGER NOT NULL,
  quantidade INTEGER NULL,
  PRIMARY KEY(loja, mercadoria),
  FOREIGN KEY(loja)
    REFERENCES loja(numero_loja)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(mercadoria)
    REFERENCES mercadoria(codigo)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE pedidos (
  numero_pedidos INTEGER NOT NULL,
  cliente_email VARCHAR(50) NOT NULL,
  endereco_entrega INTEGER NOT NULL,
  forma_pagamento INTEGER NOT NULL,
  status_pedido INTEGER NOT NULL,
  data_expedicao DATE NULL,
  valor_total FLOAT NULL,
  PRIMARY KEY(numero_pedidos),
  FOREIGN KEY(status_pedido)
    REFERENCES status_pedido(idstatuspedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(forma_pagamento)
    REFERENCES forma_pagamento(idFormaPag)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(endereco_entrega)
    REFERENCES endereco(idenderecos)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cliente_email)
    REFERENCES cliente(email)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE pedido_mercadorias (
  pedido INTEGER NOT NULL,
  mercadoria INTEGER NOT NULL,
  loja INTEGER NOT NULL,
  status INTEGER NOT NULL,
  quantidade_pedida INTEGER NULL,
  data_entrega DATE NULL,
  valor_unitario FLOAT NULL,
  PRIMARY KEY(pedido, mercadoria, loja),
  FOREIGN KEY(loja, mercadoria)
    REFERENCES loja_mercadoria(loja, mercadoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(pedido)
    REFERENCES pedidos(numero_pedidos)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(status)
    REFERENCES status_pedido(idstatuspedido)
      ON DELETE NO ACTION /*.*/
      ON UPDATE NO ACTION
);

# Lista 3
# Inserindo dados teste
#
INSERT INTO endereco VALUES (1,'Rua Celso Pinheiro',378,NULL,'Monte Castelo',64014600,'Teresina','PI');
INSERT INTO endereco VALUES (2,'Rua Frei Serafim',1436,NULL,'Frei Serafim',64000310,'Teresina','PI');
INSERT INTO endereco VALUES (3,'Rua Lucidio Freitas',1144,NULL,'Centro',64000020,'Teresina','PI');
INSERT INTO endereco VALUES (4,'Rua Simplicio Mendes',1030,NULL,'Centro',64000090,'Teresina','PI');
INSERT INTO endereco VALUES (5,'Rua Irma Mercedes',3478,NULL,'Cristo Rei',64014310,'Teresina','PI');
INSERT INTO endereco VALUES (6,'Rua Barao de Castelo Branco',345,NULL,'Picarra',64020098,'Teresina','PI');
INSERT INTO endereco VALUES (7,'Rua Principal',1090,NULL,'Saci',64314310,'Teresina','PI');
INSERT INTO endereco VALUES (8,'Rua Decio Amaral',456,NULL,'Dirceu Arcoverde',64714310,'Teresina','PI');
INSERT INTO endereco VALUES (9,'Rua Olava Bilac',347,NULL,'Centro',64004310,'Teresina','PI');
INSERT INTO endereco VALUES (10,'Rua Riachuelo',350,'Sala 345','Cristo Rei',64014310,'Teresina','PI');


INSERT INTO cliente VALUES ('ana@email.com.br',4,'Ana Veloso','1959-10-21',39450004,NULL,333333333,'ana');
INSERT INTO cliente VALUES ('clara@email.com.br',6,'Clara Magno','1968-12-22',39450006,NULL,555555555,'clara');
INSERT INTO cliente VALUES ('joao@email.com.br',3,'Joao Carvalho','1956-09-12',39450003,NULL,333333333,'joao');
INSERT INTO cliente VALUES ('jose@email.com.br',2,'Jose Silva','1976-12-12',39450002,NULL,222222222,'jose');
INSERT INTO cliente VALUES ('marcos@email.com.br',5,'Marcos Silva','1993-10-11',39450005,NULL,444444444,'marcos');
INSERT INTO cliente VALUES ('maria@email.com.br',1,'Maria Silva','1980-12-30',39450001,NULL,1111111111,'maria');



INSERT INTO forma_pagamento VALUES (1,'Cartao de Credito');
INSERT INTO forma_pagamento VALUES (2,'Dinheiro');
INSERT INTO forma_pagamento VALUES (3,'Cheque');

INSERT INTO loja VALUES (1,7,'Loja de Departamento Neves',2229930);
INSERT INTO loja VALUES (2,8,'Loja de Departamento Neves II',2220611);

INSERT INTO loja_mercadoria VALUES (1,1,10);
INSERT INTO loja_mercadoria VALUES (1,2,10);
INSERT INTO loja_mercadoria VALUES (1,3,5);
INSERT INTO loja_mercadoria VALUES (1,4,8);
INSERT INTO loja_mercadoria VALUES (1,5,15);
INSERT INTO loja_mercadoria VALUES (1,6,10);
INSERT INTO loja_mercadoria VALUES (1,7,20);
INSERT INTO loja_mercadoria VALUES (1,8,2);
INSERT INTO loja_mercadoria VALUES (1,9,34);
INSERT INTO loja_mercadoria VALUES (1,10,10);
INSERT INTO loja_mercadoria VALUES (1,11,6);
INSERT INTO loja_mercadoria VALUES (1,12,7);
INSERT INTO loja_mercadoria VALUES (2,1,1);
INSERT INTO loja_mercadoria VALUES (2,2,0);
INSERT INTO loja_mercadoria VALUES (2,3,7);
INSERT INTO loja_mercadoria VALUES (2,4,0);
INSERT INTO loja_mercadoria VALUES (2,5,8);
INSERT INTO loja_mercadoria VALUES (2,6,6);

INSERT INTO mercadoria VALUES (1,4,'Notebook Toshiba LT-2300',4500);
INSERT INTO mercadoria VALUES (2,4,'iPOD Toshiba 2300',1500);
INSERT INTO mercadoria VALUES (3,1,'TV Toshiba 21\"',650);
INSERT INTO mercadoria VALUES (4,1,'Micro System Gradiente',1500);
INSERT INTO mercadoria VALUES (5,2,'Casaco Feminino',450);
INSERT INTO mercadoria VALUES (6,2,'Camisa Manga Curta',45);
INSERT INTO mercadoria VALUES (7,3,'Sapato Feminino',50);
INSERT INTO mercadoria VALUES (8,3,'Sapato Infantil',45);
INSERT INTO mercadoria VALUES (9,4,'Camera Digital Sony',450);
INSERT INTO mercadoria VALUES (10,1,'Geladeira Consul 310l',1200);
INSERT INTO mercadoria VALUES (11,2,'Moleton Infantil',15);
INSERT INTO mercadoria VALUES (12,3,'Tenis Nike',120);


--TOU AQUI
INSERT INTO pedido_mercadorias VALUES (1,1,1,4,2,'2005-01-02',4500);
INSERT INTO pedido_mercadorias VALUES (1,2,1,4,1,'2005-01-02',1500);
INSERT INTO pedido_mercadorias VALUES (2,10,1,4,2,'2005-01-04',1200);
INSERT INTO pedido_mercadorias VALUES (3,5,2,4,3,'2005-01-10',450);
INSERT INTO pedido_mercadorias VALUES (4,4,2,4,1,'2005-02-02',1500);
INSERT INTO pedido_mercadorias VALUES (5,11,1,4,3,'2005-02-23',15);
INSERT INTO pedido_mercadorias VALUES (6,3,1,4,1,'2005-02-23',650);
INSERT INTO pedido_mercadorias VALUES (6,4,1,4,1,'2005-02-23',1500);
INSERT INTO pedido_mercadorias VALUES (6,12,1,4,2,'2005-02-23',1200);

INSERT INTO pedidos VALUES (1,'ana@email.com.br',1,1,4,'2005-01-02',NULL);
INSERT INTO pedidos VALUES (2,'clara@email.com.br',2,1,4,'2005-01-04',NULL);
INSERT INTO pedidos VALUES (3,'joao@email.com.br',3,1,4,'2005-01-10',NULL);
INSERT INTO pedidos VALUES (4,'jose@email.com.br',4,3,4,'2005-02-02',NULL);
INSERT INTO pedidos VALUES (5,'marcos@email.com.br',10,2,3,'2005-02-23',NULL);
INSERT INTO pedidos VALUES (6,'maria@email.com.br',9,1,3,'2005-02-23',NULL);

INSERT INTO status_pedido VALUES (1,'Confirmado');
INSERT INTO status_pedido VALUES (2,'Em espera');
INSERT INTO status_pedido VALUES (3,'Despachado');
INSERT INTO status_pedido VALUES (4,'Entregue');

INSERT INTO tipo_mercadoria VALUES (1,'Eletrodomestico');
INSERT INTO tipo_mercadoria VALUES (2,'Vestuario');
INSERT INTO tipo_mercadoria VALUES (3,'Calcados');
INSERT INTO tipo_mercadoria VALUES (4,'Eletronicos');



#
# Alterando nome do cliente para Almir
#

UPDATE Cliente SET nome= 'Almir' WHERE email='ana@email.com.br'


#
# Aumentar em 10% o valor de todos os eletrodomesticos
#

UPDATE Mercadoria SET preco_venda = preco_venda * 1.1 WHERE tipo_mercadoria IN (Select idTipoMercadoria from Tipo_mercadoria where descricao = 'Eletrodomestico')

#
# Apagar linhas específicas da tabela cliente
#

DELETE FROM Cliente WHERE email='maria@email.com.br' 

/*a) - Alterar o nome de um cliente para ‘Almir’
b) - Aumentar em 10% o valor de todas as televisões
c) - Apagar linhas específicas da tabela cliente
d) - Liste todos os clientes ordenados por ordem crescente e seus endereços
e) - Quantos pedidos foram expedidos no mês de janeiro
f) - Quantos pedidos foram entregues em algum endereço diferente do endereço do cliente
g) - Qual a média de valor gasto pelos clientes anualmente
h) - Quem é o cliente com maior número de pedidos
i) - Qual a mercadoria mais vendida*/

--a) - Alterar o nome de um cliente para ‘Almir’
UPDATE cliente
SET nome = 'Almir'
WHERE nome = 'Ana Veloso'

--b) - Aumentar em 10% o valor de todas as televisões
UPDATE mercadoria
SET preco_venda = (preco_venda*1.1)
WHERE codigo = 3

--c) - Apagar linhas específicas da tabela cliente
DELETE FROM cliente
WHERE senha = 'jose'


