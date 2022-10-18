SELECT c.nome, p.num_pedido, p.data_pedido,
	p.total_pago
FROM clientes c
	INNER JOIN pedidos p
	ON c.cod_cliente = p.cod_cliente;


SELECT c.nome, p.num_pedido, p.data_pedido,
	p.total_pago
FROM clientes c
	LEFT JOIN pedidos p
	ON c.cod_cliente = p.cod_cliente;

SELECT c.nome, p.num_pedido, p.data_pedido,
	p.total_pago
FROM clientes c
	RIGHT JOIN pedidos p
	ON c.cod_cliente = p.cod_cliente;

SELECT c.nome, e.data_encomenda, e.prazo_estimado
FROM clientes c
	INNER JOIN encomendas e
	ON c.cod_cliente = e.cod_cliente;


SELECT c.nome, e.data_encomenda, e.prazo_estimado
FROM clientes c
	LEFT JOIN encomendas e
	ON c.cod_cliente = e.cod_cliente;


SELECT c.nome, e.data_encomenda, e.prazo_estimado
FROM clientes c
	RIGHT JOIN encomendas e
	ON c.cod_cliente = e.cod_cliente;

SELECT c.nome, p.num_pedido, f.nome, p.data_pedido
FROM clientes c
INNER JOIN pedidos p
ON c.cod_cliente = p.cod_cliente
INNER JOIN funcionarios f
ON p.cod_funcionario = f.cod_funcionario;

SELECT c.nome, p.num_pedido, l.titulo
FROM clientes c
INNER JOIN pedidos p
ON c.cod_cliente = p.cod_cliente
INNER JOIN pedidoslivros pl
ON p.num_pedido = pl.num_pedido
INNER JOIN livros l
ON pl.isbn = l.isbn;
