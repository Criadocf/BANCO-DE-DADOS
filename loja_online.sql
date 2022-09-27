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
	CONSTRAINT pedidos_mercadoria_loja_mercadoria2 FOREIGN KEY(loja, mercadoria)
	REFERENCES loja_mercadoria(loja, mercadoria),
	CONSTRAINT pedidos_mercadoria_status_pedido FOREIGN KEY (status)
	REFERENCES status_pedido(idStatus_pedido)
);


