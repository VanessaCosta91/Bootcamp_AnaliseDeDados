-- PREENCHER TABELA CLIENTES (PF e PJ)
INSERT INTO clientes (clientName, clientType, cpf,  cnpj,        address) VALUES
('Ana Lima',         'PF',     '12345678901', NULL, 'Rua A, 100'),
('Bruno Souza',      'PF',     '98765432100', NULL, 'Rua B, 200'),
('Carla Mendes',     'PF',     '11122233344', NULL, 'Rua C, 300'),
('Diego Rocha',      'PF',     '55566677788', NULL, 'Rua D, 400'),
('Oficina Alfa LTDA','PJ',     NULL, '12345678000155', 'Av. Central, 500'),
('Transporte Beta SA','PJ',    NULL, '00987654000120', 'Av. Sul, 600');

-- PREENCHER TABELA VEÍCULOS (ligados a clientes)
INSERT INTO veiculos (idClient, plate,  modelYear) VALUES
(1, 'ABC1D23', 'Civic 2018'),
(1, 'EFG2H34', 'HB20 2020'),
(2, 'IJK3L45', 'Onix 2019'),
(3, 'MNO4P56', 'Fiesta 2016'),
(5, 'QRS5T67', 'Sprinter 2021'),
(6, 'UVX6Y78', 'Constellation 2017');

-- PREENCHER TABELA MECÂNICOS
INSERT INTO mecanicos (mechanicName, address,          specialty) VALUES
('João Pereira',     'Rua Mec 1, 10', 'Suspensão'),
('Marina Silva',     'Rua Mec 2, 20', 'Freios'),
('Carlos Ramos',     'Rua Mec 3, 30', 'Motor'),
('Paula Nogueira',   'Rua Mec 4, 40', 'Elétrica'),
('Rafael Dias',      'Rua Mec 5, 50', 'Alinhamento');

-- PREENCHER TABELA EQUIPES
INSERT INTO equipes (teamName) VALUES
('Equipe Azul'),
('Equipe Verde');

-- PREENCHER TABELA RELAÇÃO MECÂNICO ↔ EQUIPE
INSERT INTO mecanicoEquipes (idTeam, idMechanic) VALUES
(1, 1), (1, 2), (1, 5),   
(2, 3), (2, 4);           

-- PREENCHER TABELA SERVIÇOS
INSERT INTO servicos (serviceName, price) VALUES
('Troca de óleo',           150.00),
('Alinhamento',             120.00),
('Serviço de freio',        300.00),
('Diagnóstico de motor',    200.00),
('Rodízio de pneus',         80.00);

-- PREENCHER TABELA DE PEÇAS
INSERT INTO pecas (partName, price) VALUES
('Óleo 5W30',                60.00),
('Filtro de óleo',           40.00),
('Pastilha de freio',       250.00),
('Velas de ignição',        180.00),
('Pneu 195/55 R15',         500.00);

-- PREENCHER TABELA ORDENS DE SERVIÇO
INSERT INTO orders (idClient, idVehicle, idTeam, issueDate,  completionDate, price,   statusOrder,  paymentMethod) VALUES
(1, 1, 1, '2025-08-10', '2025-08-10',  250.00, 'Finalizado', 'PIX'),       
(1, 2, 1, '2025-08-15', '2025-08-16',  120.00, 'Finalizado', 'Cartão'),   
(2, 3, 1, '2025-08-18', '2025-08-18',  380.00, 'Finalizado', 'Dinheiro'),  
(3, 4, 2, '2025-08-20', '2025-08-22',  200.00, 'Finalizado', 'PIX'),      
(5, 5, 2, '2025-08-22', '2025-08-24',  860.00, 'Finalizado', 'Cartão'),    
(6, 6, 2, '2025-08-25', NULL,          NULL,    'Aprovado',   'Cartão'),  
(2, 3, 1, '2025-08-27', '2025-08-27',  230.00, 'Finalizado', 'PIX'),       
(4, 4, 1, '2025-08-28', '2025-08-29',  530.00, 'Finalizado', 'Dinheiro');

-- PREENCHER TABELA ITENS DE SERVIÇO POR ORDEM
INSERT INTO valoresServicos (idOrder, idService) VALUES
(1, 1),                 
(2, 2),                 
(3, 3),                 
(4, 4),                 
(5, 5),                
(7, 1), (7, 2),         
(8, 3);                 

-- ITENS DE PEÇAS POR ORDEM
INSERT INTO valoresPecas (idOrder, idPart) VALUES
(1, 1), (1, 2),         
(3, 3),                 
(5, 5),                 
(8, 2);                 
