-- criação do banco de dados para cenario de E-commerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- criar tabela cliente
CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Lname VARCHAR(20),
    CPF CHAR(11) UNIQUE,
    CNPJ CHAR(15) UNIQUE,
	ClientType ENUM('PF','PJ'),
    Address VARCHAR(255),
    DateBirth DATE
);

-- Criar tabela produto
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    PName VARCHAR(100),
    Category ENUM('Eletronico', 'Vestuario', 'Brinquedos', 'Alimentos'),
    Descriptions VARCHAR(255),
    PRICE DECIMAL(10,2),
    Evaluation FLOAT DEFAULT 0	
);

-- criar tabela pedido
CREATE TABLE orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    orderStatus ENUM('Cancelado', 'Confirmado', 'Processando', 'Enviado', 'Entregue') DEFAULT 'Processando',
    orderDescription VARCHAR(255),
    Freight DECIMAL(10,2),
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_orders_client FOREIGN KEY (idClient) REFERENCES clients(idclient)
);

-- criar tabela de pagamentos
CREATE TABLE payments(
	idPayment INT AUTO_INCREMENT PRIMARY KEY,
    typePayment ENUM('PIX', 'Boleto', 'Cartão', 'Dois Cartões'),
    limitAvailable FLOAT
);

-- criar tabela de pagamentos por pedido
CREATE TABLE PaymentOrder(
    idPayment INT,
    idOrder INT,
    Installments INT,
    TypePayment VARCHAR(45),
    PRIMARY KEY(idPayment, idOrder),
    FOREIGN KEY (idPayment) REFERENCES payments(idPayment),
    FOREIGN KEY (idOrder) REFERENCES Orders(idOrder)
);

-- criar tabela estoque
CREATE TABLE Storages(
	idProdutctStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(100),
    quantity INT DEFAULT 0    
);

-- criar tabela estoque por produto
CREATE TABLE ProductStorage (
    idProduct INT,
    idStorage INT,
    Quantity INT DEFAULT 0,
    PRIMARY KEY(idProduct, idStorage),
    FOREIGN KEY (idProduct) REFERENCES Product(idProduct),
    FOREIGN KEY (idStorage) REFERENCES Storages(idProdutctStorage)
);

-- criar tabela fornecedor
CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) UNIQUE NOT NULL,
    contact CHAR(20)
);

-- criar tabela produtor por fornecedor
CREATE TABLE ProductSupplier (
    idProduct INT,
    idSupplier INT,
    SupplierPrice DECIMAL(10,2),
    PRIMARY KEY(idProduct, idSupplier),
    FOREIGN KEY (idProduct) REFERENCES Product(idProduct),
    FOREIGN KEY (idSupplier) REFERENCES Supplier(idSupplier)
);

-- criar tabela vendedor parceiro
CREATE TABLE seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    TradeName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) UNIQUE,
    Endereço VARCHAR(255)
);

-- criar tabela produto
CREATE TABLE ProductSeller(
	idPSeller INT,
    idProduct INT,
    quantity INT DEFAULT 0,
    PRIMARY kEY (idPSeller, idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPSeller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)    
);

CREATE TABLE  productOrder(
	idPOproduct INT,
    idPOrder INT,
    poQuantity INT,
    poStatuas ENUM('Disponivel', 'Sem Estoque') DEFAULT 'Disponivel',
    PRIMARY KEY(idPOproduct, idPOrder),
    CONSTRAINT fk_product FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_order FOREIGN KEY (idPOrder) REFERENCES orders(idOrder)   
);

-- criar tabela entrega
CREATE TABLE Delivery (
    idDelivery INT AUTO_INCREMENT PRIMARY KEY,
    idOrder INT NOT NULL,
    Status ENUM('Pendente','Em Transporte','Entregue','Devolvido') DEFAULT 'Pendente',
    TrackingCode VARCHAR(45),
    FOREIGN KEY (idOrder) REFERENCES Orders(idOrder)
);
