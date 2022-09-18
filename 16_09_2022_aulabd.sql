CREATE TABLE endereco (
	idEnderecos INTEGER PRIMARY KEY,
	logradouro VARCHAR(100),
	numero INTEGER,
	complemento VARCHAR(30),
	bairro VARCHAR(50),
	cep INTEGER,
	cidade VARCHAR(100),
	sigla_estado VARCHAR(2)
);

CREATE TABLE forma_pagamento(
	idFormaPag INTEGER PRIMARY KEY,
	descricao VARCHAR(50)
);

CREATE TABLE status_pedido(
	idStatus_pedido INTEGER PRIMARY KEY,
	descricao VARCHAR(50)
);

CREATE TABLE tipo_mercadoria(
	idTipoMercadoria INTEGER PRIMARY KEY,
	descricao VARCHAR(100)
);

CREATE TABLE cliente (
	email VARCHAR(50) PRIMARY KEY,
	endereco INTEGER,
	nome VARCHAR(50),
	data_nascimento DATE,
	fone_residencial INTEGER,
	fone_celular INTEGER,
	cpf INTEGER,
	senha VARCHAR(8),
	CONSTRAINT endereco_cliente FOREIGN KEY(endereco)
	REFERENCES endereco(idEnderecos)
);


CREATE TABLE loja(
	numero_loja INTEGER PRIMARY KEY,
	endereco INTEGER,
	nome VARCHAR(100),
	telefone_contato INTEGER,
	CONSTRAINT loja_endereco FOREIGN KEY(endereco)
	REFERENCES endereco(idEnderecos)
);

CREATE TABLE mercadoria(
	codigo INT PRIMARY KEY,
	tipo_mercadoria INTEGER,
	descricao VARCHAR(300),
	preco_vendas FLOAT,
	CONSTRAINT mercadoria_tipo_mercadoria FOREIGN KEY(tipo_mercadoria)
	REFERENCES tipo_mercadoria(idTipoMercadoria)
);

CREATE TABLE loja_mercadoria(
	loja INTEGER,
	mercadoria INTEGER,
	quantidade INTEGER,
	PRIMARY KEY(loja, mercadoria),
	CONSTRAINT loja_mercadoria_loja FOREIGN KEY (loja)
	REFERENCES loja(numero_loja),
	CONSTRAINT loja_mercadoria_mercadoria FOREIGN KEY(mercadoria)
	REFERENCES mercadoria(codigo)
);

CREATE TABLE pedidos(
	numeros_pedidos INTEGER PRIMARY KEY,
	cliente_email VARCHAR(50),
	endereco_entrega INTEGER,
	forma_pagamento INTEGER,
	status_pedido INTEGER,
	data_expedicao DATE,
	valor_total FLOAT,
	CONSTRAINT pedidos_cliente FOREIGN KEY(cliente_email)
	REFERENCES cliente(email),
	CONSTRAINT pedidos_endereco FOREIGN KEY(endereco_entrega)
	REFERENCES endereco(idEnderecos),
	CONSTRAINT pedidos_forma_pagamento FOREIGN KEY(forma_pagamento)
	REFERENCES forma_pagamento(idFormaPag),
	CONSTRAINT pedidos_status_pedido FOREIGN KEY(status_pedido)
	REFERENCES status_pedido(idStatus_pedido)
);

CREATE TABLE pedidos_mercadorias(
	pedido INTEGER,
	loja INTEGER,
	mercadoria INTEGER,
	status INTEGER,
	quantidade_pedida INTEGER,
	data_entrega DATE,
	valor_unitario FLOAT,
	PRIMARY KEY(pedido, loja, mercadoria),
	CONSTRAINT pedido_mercadorias_pedidos FOREIGN KEY(pedido)
	REFERENCES pedidos(numeros_pedidos),
	
	CONSTRAINT pedidos_mercadorias_loja_mercadoria FOREIGN KEY(loja,mercadoria)
	REFERENCES loja_mercadoria(loja, mercadoria),
	
	CONSTRAINT pedidos_mercadoria_status_pedido FOREIGN KEY (status)
	REFERENCES status_pedido(idStatus_pedido)
);

INSERT INTO endereco(idEnderecos, logradouro, numero, complemento, bairro, cep, cidade, sigla_estado)
VALUES(1, 'Rua zeferino vieira',1544,'térreo','Macaúba',64019020,'Teresina','PI');

INSERT INTO cliente(email, endereco, nome, data_nascimento, fone_residencial, fone_celular, cpf, senha)
VALUES('kleberjr2016@outlook.com', 1, 'Kleber de Sousa Júnior','11/10/1993', 32185234, 86994924, 0527782, '15461546');

INSERT INTO loja(numero_loja, endereco, nome, telefone_contato)
VALUES(1,1, 'FOMFOM MODAS', 88188229);

INSERT INTO forma_pagamento(idFormaPag, descricao)
VALUES (1,'à vista');

INSERT INTO status_pedido(idStatus_pedido, descricao)
VALUES(1,'pago');

INSERT INTO tipo_mercadoria(idTipoMercadoria, descricao)
VALUES(1,'acessório');

INSERT INTO mercadoria(codigo, tipo_mercadoria, descricao, preco_vendas)
VALUES(1,1, 'controles de videogame', 12.323);

INSERT INTO pedidos(numeros_pedidos, cliente_email, endereco_entrega, forma_pagamento, status_pedido, data_expedicao, valor_total)
VALUES(70, 'kleberjr2016@outlook.com', 1, 1, 1, '15/07/2022', 55000.00);

INSERT INTO loja_mercadoria(loja, mercadoria, quantidade)
VALUES(1,1, 54);

INSERT INTO pedidos_mercadorias(pedido, loja, mercadoria, status, quantidade_pedida, data_entrega, valor_unitario)
VALUES(70, 1, 1, 1, 57, '05/10/2022', 15);
