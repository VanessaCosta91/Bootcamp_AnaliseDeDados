CREATE DATABASE oficina;
USE oficina;

-- CRIA TABELA DE CLIENTES
CREATE TABLE clientes(
	idClient INT PRIMARY KEY AUTO_INCREMENT,
    clientName VARCHAR(225) NOT NULL,
    clientType ENUM('PF','PJ') NOT NULL,
    cpf CHAR (11) UNIQUE,
    cnpj CHAR(14) UNIQUE,
    address VARCHAR(255)
);

-- CRIA TABELA DE VEICULOS
CREATE TABLE veiculos(
	idVehicle INT PRIMARY KEY AUTO_INCREMENT,
	idClient INT NOT NULL,
    Plate CHAR(7) UNIQUE NOT NULL,
    modelYear VARCHAR(255),
    CONSTRAINT fk_vehicle_client FOREIGN KEY (idClient) REFERENCES clientes(idClient)
);

-- CRIA TABELA MECÂNICOS
CREATE TABLE mecanicos(
	idMechanic INT PRIMARY KEY AUTO_INCREMENT,
    mechanicName VARCHAR(225) NOT NULL,
    address VARCHAR(255),
    specialty VARCHAR(255)
);

-- CRIA TABELA EQUIPE
CREATE TABLE equipes(
	idTeam INT PRIMARY KEY AUTO_INCREMENT,
    TeamName VARCHAR(225) NOT NULL
);

-- CRIA TABELA RELACAO MECANICOEQUIPE
CREATE TABLE mecanicoEquipes(
	idTeam INT NOT NULL,
    idMechanic INT NOT NULL,
    PRIMARY KEY (idTeam, idMechanic),
    CONSTRAINT fk_mechanic FOREIGN KEY (idMechanic) REFERENCES mecanicos(idMechanic),
    CONSTRAINT fk_team FOREIGN KEY (idTeam) REFERENCES equipes(idTeam)
);

-- CRIA TABELA ORDEM DE SERVIÇO
CREATE TABLE orders(
	idOrder INT PRIMARY KEY AUTO_INCREMENT,
    IdClient INT NOT NULL,
    idVehicle INT NOT NULL,
    idTeam INT NOT NULL,
    issueDate DATE NOT NULL,
    completiondate DATE,
    price DECIMAL(10,2),
    statusOrder ENUM('Pendente', 'Aprovado', 'Em execução', 'Finalizado', 'Encerrado', 'Cancelado'),
    paymentMethod ENUM('PIX', 'Dinheiro', 'Cartão'),
    CONSTRAINT fk_order_client FOREIGN KEY (idClient) REFERENCES clientes(idClient),
    CONSTRAINT fk_order_vehicle FOREIGN KEY (idVehicle) REFERENCES veiculos(idVehicle),
    CONSTRAINT fk_order_team FOREIGN KEY (idTeam) REFERENCES equipes(idTeam)
);

-- CRIA TABELA SERVIÇO
CREATE TABLE servicos(
	idService INT PRIMARY KEY AUTO_INCREMENT,
    ServiceName VARCHAR(225) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

-- CRIA TABELA PEÇAS
CREATE TABLE pecas(
	idParts INT PRIMARY KEY AUTO_INCREMENT,
    PartceName VARCHAR(225) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

-- CRIA TABELA RELAÇÃO VALORESERVIÇO
CREATE TABLE ValoresServicos(
	idService INT NOT NULL,
    idOrder INT NOT NULL,
    PRIMARY KEY (idService, idOrder),
    CONSTRAINT fk_service_order FOREIGN KEY (idOrder) REFERENCES orders(idOrder),
    CONSTRAINT fk_service_service FOREIGN KEY (idService) REFERENCES servicos(idService)
);

-- CRIA TABELA RELÇÃO VALOREPEÇAS
CREATE TABLE ValoresPecas(
	idParts INT NOT NULL,
    idOrder INT NOT NULL,
    PRIMARY KEY (idParts, idOrder),
    CONSTRAINT fk_part_order FOREIGN KEY (idOrder) REFERENCES orders(idOrder),
    CONSTRAINT fk_part_part FOREIGN KEY (idParts) REFERENCES pecas(idParts)
);