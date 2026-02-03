USE ecommerce;

-- Quantidade de produtos por categoria e localização
CREATE VIEW vw_produtos_categoria_local AS
SELECT
    p.Category AS categoria,
    s.storageLocation AS localizacao,
    SUM(ps.Quantity) AS quantidade
FROM product p
JOIN ProductStorage ps ON p.idProduct = ps.idProduct
JOIN Storages s ON s.idProdutctStorage = ps.idStorage
GROUP BY p.Category, s.storageLocation;

-- Categorias e seus fornecedores
CREATE VIEW vw_categoria_fornecedor AS
SELECT
    p.Category AS categoria,
    s.SocialName AS fornecedor
FROM product p
JOIN ProductSupplier ps ON p.idProduct = ps.idProduct
JOIN supplier s ON s.idSupplier = ps.idSupplier;

-- Pedidos por cliente
CREATE VIEW vw_clientes_pedidos AS
SELECT
    concat(c.Fname, " ", c.Lname) AS nome,
    COUNT(o.idOrder) AS total_pedidos
FROM clients c
JOIN orders o ON c.idClient = o.idClient
GROUP BY c.idClient
ORDER BY total_pedidos DESC;

-- Pedidos, clientes e forma de pagamento
CREATE VIEW vw_pedidos_cliente_pagamento AS
SELECT
    o.idOrder,
    concat(c.Fname, " ", c.Lname) AS nome,
    p.TypePayment
FROM orders o
JOIN clients c ON o.idClient = c.idClient
JOIN PaymentOrder p ON o.idOrder = p.idOrder;

GRANT SELECT ON ecommerce.vw_produtos_categoria_local TO 'gerente'@'localhost';

-- Criar usario 
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'senha123';

-- conceder permissão às views
GRANT SELECT ON ecommerce.vw_produtos_categoria_local TO 'gerente'@'localhost';
GRANT SELECT ON ecommerce.vw_categoria_fornecedor TO 'gerente'@'localhost';





















