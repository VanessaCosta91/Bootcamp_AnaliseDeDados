-- Clientes
INSERT INTO clients (Fname, Lname, CPF, CNPJ, ClientType, Address, DateBirth) VALUES
('Ana', 'Silva', '12345678901', NULL, 'PF', 'Rua A, 100', '1990-05-10'),
('Carlos', 'Pereira', NULL, '12345678000199', 'PJ', 'Av. B, 200', NULL),
('Maria', 'Oliveira', '98765432100', NULL, 'PF', 'Rua C, 300', '1985-08-15');

-- Produtos
INSERT INTO product (PName, Category, Descriptions, PRICE, Evaluation) VALUES
('Notebook', 'Eletronico', 'Notebook Dell i5', 3500.00, 4.5),
('Camisa', 'Vestuario', 'Camisa Polo Azul', 120.00, 4.2),
('Boneca', 'Brinquedos', 'Boneca Barbie', 90.00, 4.8),
('Chocolate', 'Alimentos', 'Chocolate Nestlé', 8.50, 4.1);

-- Pedidos
INSERT INTO orders (idClient, orderStatus, orderDescription, Freight) VALUES
(1, 'Confirmado', 'Compra de notebook', 50.00),
(2, 'Enviado', 'Compra de roupas', 20.00),
(1, 'Entregue', 'Compra de chocolates', 10.00);

-- Pagamentos
INSERT INTO payments (typePayment, limitAvailable) VALUES
('Cartão', 5000.00),
('PIX', 99999.00),
('Boleto', 2000.00);

-- Pagamentos por pedido
INSERT INTO PaymentOrder (idPayment, idOrder, Installments, TypePayment) VALUES
(1, 1, 10, 'Cartão Crédito'),
(2, 2, 1, 'PIX'),
(3, 3, 2, 'Boleto');

-- Fornecedores
INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
('Tech Supplier Ltda', '11111111000111', '11999999999'),
('Moda Import SA', '22222222000122', '11888888888');

-- Produto por fornecedor
INSERT INTO ProductSupplier (idProduct, idSupplier, SupplierPrice) VALUES
(1, 1, 3000.00),
(2, 2, 80.00);

-- Vendedores parceiros
INSERT INTO seller (SocialName, TradeName, CNPJ, Endereço) VALUES
('Loja do João', 'João Eletro', '33333333000133', 'Rua D, 400'),
('Moda da Ana', 'Ana Fashion', '44444444000144', 'Av. E, 500');

-- Produto por vendedor
INSERT INTO ProductSeller (idPSeller, idProduct, quantity) VALUES
(1, 1, 5),
(2, 2, 50);

-- Estoques
INSERT INTO Storages (storageLocation, quantity) VALUES
('Centro-SP', 500),
('Rio de Janeiro', 300);

-- Produto por estoque
INSERT INTO ProductStorage (idProduct, idStorage, Quantity) VALUES
(1, 1, 10),
(2, 1, 30),
(3, 2, 50);

-- Entregas
INSERT INTO Delivery (idOrder, Status, TrackingCode) VALUES
(1, 'Em Transporte', 'BR12345'),
(2, 'Entregue', 'BR67890'),
(3, 'Devolvido', 'BR99999');
