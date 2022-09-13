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
)