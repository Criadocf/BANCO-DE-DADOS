CREATE TABLE Endereco(
	idEnderecos INTEGER PRIMARY KEY,
	logradouro VARCHAR(100),
	numero INTEGER,
	complemento VARCHAR(30),
	bairro VARCHAR(50),
	cep INTEGER,
	cidade VARCHAR(100),
	sigla_estado VARCHAR(2)
);

CREATE TABLE Forma_pagamento(
	idFormaPag INTEGER PRIMARY KEY,
	descricao VARCHAR(50)
);

CREATE TABLE Status_pedido(
	idStatus_pedido INTEGER PRIMARY KEY,
	descricao VARCHAR(100)
);

CREATE TABLE Tipo_mercadoria(
	idTipoMercadoria INTEGER PRIMARY KEY,
	descricao VARCHAR(100)
);

CREATE TABLE Cliente(
	email VARCHAR(50) PRIMARY KEY,
	endereco INTEGER,
	nome VARCHAR,
	data_nascimento DATE,
	fone_residencial INTEGER,
	fone_celular INTEGER,
	cpf INTEGER,
	senha VARCHAR(8),
	CONSTRAINT endereco_cliente_fk FOREIGN KEY(endereco)
	REFERENCES Endereco(idEnderecos)
);

CREATE TABLE Pedidos(
	numeros_pedidos INTEGER PRIMARY KEY,
	Cliente_email VARCHAR(50),
	endereco_entrega INTEGER,
	forma_pagamento INTEGER,
	status_pedido INTEGER,
	data_expedicao DATE,
	valor_total FLOAT,
	CONSTRAINT pedidos_cliente_fk FOREIGN KEY(Cliente_email)
	REFERENCES Cliente(email),
	CONSTRAINT pedidos_endereco_fk FOREIGN KEY(endereco_entrega)
	REFERENCES Endereco(idEnderecos),
	CONSTRAINT pedidos_Forma_pagamento_fk FOREIGN KEY(forma_pagamento)
	REFERENCES forma_pagamento(idFormaPag),
	CONSTRAINT pedidos_Status_pedido_fk FOREIGN KEY(status_pedido)
	REFERENCES Status_pedido(idStatus_pedido)
);

CREATE TABLE Loja(
	numero_loja INTEGER PRIMARY KEY,
	endereco INTEGER,
	nome VARCHAR(100),
	telefone_contato INTEGER,
	CONSTRAINT loja_Endereco_fk FOREIGN KEY(endereco)
	REFERENCES Endereco(idEnderecos)
);

CREATE TABLE Mercadoria(
	codigo INTEGER PRIMARY KEY,
	tipo_mercadoria INTEGER,
	descricao VARCHAR(300),
	preco_venda FLOAT,
	CONSTRAINT mercadoria_Tipo_mercadoria_fk FOREIGN KEY(tipo_mercadoria)
	REFERENCES Tipo_Mercadoria(idTipoMercadoria)
);

CREATE TABLE Loja_mercadoria(
	loja INTEGER,
	mercadoria INTEGER,
	quantidade INTEGER,
	PRIMARY KEY(loja, mercadoria),
	CONSTRAINT loja_mercadoria_loja_fk FOREIGN KEY(loja)
	REFERENCES loja(numero_loja),
	CONSTRAINT loja_mercadoria_Pedidos_mercadorias_fk FOREIGN KEY(mercadoria)
	REFERENCES Mercadoria(codigo)
);


CREATE TABLE Pedidos_mercadorias(
	pedido INTEGER,
	loja INTEGER,
	mercadoria INTEGER,
	status INTEGER,
	quantidade_pedida INTEGER,
	data_entrega DATE,
	valor_unitario FLOAT,
	PRIMARY KEY(pedido, loja, mercadoria),
	CONSTRAINT pedidos_mercadoria_pedidos_fk FOREIGN KEY(pedido)
	REFERENCES Pedidos(numeros_pedidos),
	CONSTRAINT Pedidos_mercadorias_loja_mercadoria2_fk FOREIGN KEY(loja, mercadoria)
	REFERENCES Loja_mercadoria(loja, mercadoria),
	CONSTRAINT Pedidos_mercadorias_Status_pedido_fk FOREIGN KEY(status)
	REFERENCES Status_pedido(idStatus_pedido)
	
);