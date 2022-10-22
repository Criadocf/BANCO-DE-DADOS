SELECT nome
FROM clientes INNTER JOIN
	pedidos using(cod_cliente); /*O 'using' só da certo se os campos tiverem o mesmo nome. o 'ON' eu uso com qualquer nome, mas o USING só uso se os campos da tabela forem iguais*/

SELECT nome
FROM clientes NATURAL JOIN pedidos; /*O 'NATURAL JOIN' é exclusivo do PostgreSQL. USO O 'NATURAL JOIN' quando quero fazer um 'INNER JOIN' AND 'ATRIBUTOS TÊM O MESMO NOME'*/

SELECT DISTINCT nome
	FROM clientes NATURAL JOIN pedidos;

--TODO SELECT responde duas perguntas!
-- 1) O que retornar nas consultas? Ou seja, quais campos quero retornar!
-- 2) Qual a condição? (WHERE)

--QUAIS CLIENTES FIZERAM PEDIDOS NO DIA 06/06/2001?

SELECT c.nome, p.data_pedido
	FROM clientes c
	NATURAL JOIN pedidos p
	WHERE p.data_pedido = '06/06/2001'

--QUAIS LIVROS FORAM PEDIDOS PELO CLIENTE GILBERTO NO DIA 06/06/2021?
SELECT l.titulo
	FROM clientes c
	NATURAL JOIN pedidos p
	NATURAL JOIN pedidoslivros pl
	NATURAL JOIN livros l
WHERE c.nome = 'Gilberto Ribeiro de Queiroz' AND p.data_pedido = '06/06/2001';

--QUANTOS PEDIDOS FORAM REALIZADOS?

SELECT COUNT(*) FROM pedidos;

--QUANTOS PEDIDOS FORAM REALIZADOS ACIMA DE R$100,00?
SELECT COUNT(total_pago)
	FROM pedidos
	WHERE total_pago > 100;

--QUAL O MENOR VALOR PAGO EM UM PEDIDO?
SELECT MIN(total_pago)
	FROM pedidos;

--QUAL O MAIOR VALOR PAGO EM UM PEDIDO?
SELECT MAX(total_pago)
	FROM pedidos;

--QUAL O NOME DO PRIMEIRO CLIENTE POR ORDEM ALFABETICA?
SELECT MIN(nome)
	FROM clientes;

--QUAL O NOME DO ÚLTIMO CLIENTE POR ORDEM ALFABETICA?
SELECT MAX(nome)
	FROM clientes;

--QUAL O TITULO E O VALOR DO LIVRO MAIS BARATO?
SELECT titulo, preco
	FROM livros
	WHERE preco = (SELECT MIN(preco) FROM livros); --NESSE CASO SÓ POSSO FAZER COM SUB-CONSULTA(UMA CONSULTA DENTRO DA OUTRA).
	

--QUAL O TITULO DO LIVRO MAIS CARO?
SELECT titulo, preco
	FROM livros
	WHERE preco = (SELECT MAX(preco) FROM livros); --NESSE CASO SÓ POSSO FAZER COM SUB-CONSULTA(UMA CONSULTA DENTRO DA OUTRA).

--QUAL O VALOR DO LIVRO MAIS BARATO?
SELECT MIN(preco)
	FROM livros;

--QUAL O VALOR DO LIVRO MAIS CARO?
SELECT MAX(preco)
	FROM livros;


--QUAL O VALOR TOTAL DOS PEDIDOS?
SELECT SUM(total_pago)
	FROM pedidos;

--QUANTO O CLIENTE GILBERTO RIBEIRO DE QUEIROZ JA GASTOU COM A LIVRARIA?
SELECT SUM(total_pago)
	FROM pedidos
	INNER JOIN clientes
	USING (cod_cliente)  --'cod_cliente' É O ATRIBUTO QUE CONECTA AS DUAS TABELAS(CHAVE PRIMARIA E CHAVE ESTRANGEIRA)
	WHERE nome = 'Gilberto Ribeiro de Queiroz';


--QUAL A MEDIA DOS VALORES PAGOS EM TODOS OS PEDIDOS?
SELECT AVG(total_pago)::NUMERIC(9,2) --USO O '::NUMERIC(9,2)'(se chaha CAST, transformar de um tipo pra outro). USEI PRA ARREDONDAR O VALOR.
	FROM pedidos;


--QUAL A MEDIA DOS PREÇOS LIVROS CADASTRADOS?
SELECT AVG(preco)::NUMERIC(9,2)
	FROM livros;




