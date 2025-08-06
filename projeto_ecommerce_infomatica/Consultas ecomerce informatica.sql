-- DQL -> DATA QUERY LENGUAGE

-- Vendas por estado
SELECT c.estado, SUM(v.quantidade) AS vendas
	FROM vendas v
JOIN clientes c ON c.id_cliente = v.id_cliente
GROUP BY (c.estado)
ORDER BY vendas DESC;

-- Cliente que comprou mais de uma vez
SELECT c.nome, COUNT(v.id_cliente) AS qtd_compra
	FROM vendas v
JOIN clientes c ON c.id_cliente = v.id_cliente
GROUP BY (c.nome)
HAVING qtd_compra > 1
ORDER BY c.nome;

-- Ticket médio por cliente
SELECT c.nome, SUM(p.preco * v.quantidade) / COUNT(DISTINCT v.id_venda) AS ticket
	FROM vendas v
JOIN clientes c ON c.id_cliente = v.id_cliente
JOIN produtos p ON p.id_produto = v.id_produto
GROUP BY (v.id_cliente)
ORDER BY ticket DESC;

-- Três produtos mais vendidos
SELECT p.nome_produto, SUM(v.quantidade) AS qtd_vendida
	FROM vendas v
JOIN produtos p ON p.id_produto = v.id_produto
GROUP BY (v.id_produto)
ORDER BY qtd_vendida DESC
LIMIT 3;

-- Faturamento por Categoria
SELECT p.categoria, SUM(p.preco*v.quantidade) AS faturamento_total
	FROM vendas v
JOIN produtos p ON p.id_produto = v.id_produto
GROUP BY (p.categoria)
ORDER BY faturamento_total DESC;


-- Quais clientes compraram pela categoria "Periféricos"
SELECT c.nome, p.categoria
	FROM vendas v
JOIN clientes c ON c.id_cliente = v.id_cliente
JOIN produtos p ON p.id_produto = v.id_produto
WHERE p.categoria = 'Periféricos'
GROUP BY(c.nome)
ORDER BY c.nome;

-- Dia com maior faturamento
SELECT v.data_venda, SUM(p.preco*v.quantidade) AS faturamento
	FROM vendas v
JOIN produtos p ON p.id_produto = v.id_produto
GROUP BY(v.data_venda)
ORDER BY faturamento DESC
LIMIT 1;

-- Clientes que nunca compram
SELECT c.nome, v.id_venda
FROM clientes c
LEFT JOIN vendas v ON c.id_cliente = v.id_cliente
WHERE v.id_venda IS NULL
ORDER BY c.nome;

-- Total vendido por produto, com quantidade e valor total
SELECT p.nome_produto as produto, SUM(v.quantidade) AS qtd_vendida, SUM(p.preco) AS faturamento_total
	FROM vendas v
JOIN produtos p ON p.id_produto = v.id_produto
GROUP BY (v.id_produto)
ORDER BY faturamento_total DESC;

-- Vendas por Gênero
SELECT c.genero, SUM(v.quantidade) AS qtd_vendas
	FROM vendas v
JOIN clientes c ON c.id_cliente = v.id_cliente
GROUP BY (c.genero);

-- faturamento da categoria por estado
SELECT c.estado, p.categoria, SUM(p.preco*v.quantidade) AS fatusramento
	FROM vendas v
JOIN clientes c ON c.id_cliente = v.id_cliente
JOIN produtos p ON p.id_produto = v.id_produto
GROUP BY c.estado, p.categoria
ORDER BY faturamento DESC;

