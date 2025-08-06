CREATE SCHEMA IF NOT EXISTS ecommerce_tech;
USE ecommerce_tech;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    genero CHAR(1),
    estado VARCHAR(2),
    data_cadastro DATE
);

-- Tabela de Produtos
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    categoria VARCHAR(50),
    preco DECIMAL(10,2)
);

-- Tabela de Vendas
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    data_venda DATE,
    quantidade INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Clientes
INSERT INTO clientes VALUES
(1, 'Ana Souza', 'F', 'SP', '2024-01-12'),
(2, 'Carlos Lima', 'M', 'RJ', '2024-02-20'),
(3, 'Fernanda Alves', 'F', 'MG', '2024-03-05'),
(4, 'João Pedro', 'M', 'BA', '2024-04-15');

-- Produtos
INSERT INTO produtos VALUES
(1, 'Notebook Dell', 'Informática', 4500.00),
(2, 'Mouse Logitech', 'Periféricos', 120.00),
(3, 'Monitor LG 27"', 'Periféricos', 1100.00),
(4, 'Smartphone Samsung', 'Telefonia', 3200.00);

-- Vendas
INSERT INTO vendas VALUES
(1, 1, 1, '2024-06-10', 1),
(2, 2, 2, '2024-06-15', 2),
(3, 1, 3, '2024-06-18', 1),
(4, 3, 2, '2024-07-01', 1),
(5, 4, 4, '2024-07-10', 1),
(6, 1, 2, '2024-07-12', 3);