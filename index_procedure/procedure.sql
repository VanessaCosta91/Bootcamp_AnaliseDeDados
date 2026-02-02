USE ecommerce;

DELIMITER //

CREATE PROCEDURE sp_manage_clients (
    IN p_action INT,
    IN p_idClient INT,
    IN p_Fname VARCHAR(50),
    IN p_Lname VARCHAR(50),
    IN p_CPF VARCHAR(11),
    IN p_CNPJ VARCHAR(14),
    IN p_ClientType CHAR(2),
    IN p_Address VARCHAR(255),
    IN p_DateBirth DATE
)
BEGIN
    IF p_action = 1 THEN
        INSERT INTO clients (Fname, Lname, CPF, CNPJ, ClientType, Address, DateBirth)
        VALUES (p_Fname, p_Lname, p_CPF, p_CNPJ, p_ClientType, p_Address, p_DateBirth);

    ELSEIF p_action = 2 THEN
        UPDATE clients
        SET
            Fname = p_Fname,
            Lname = p_Lname,
            Address = p_Address
        WHERE idClient = p_idClient;

    ELSEIF p_action = 3 THEN
        DELETE FROM clients
        WHERE idClient = p_idClient;
    END IF;
END//

DELIMITER ;sp_manage_clients


-- Inserção
CALL sp_manage_clients(1, NULL, 'João', 'Souza', '11122233344', NULL, 'PF', 'Rua F, 600', '1992-01-01');

-- Atualização
CALL sp_manage_clients(2, 1, 'Ana', 'Silva', NULL, NULL, NULL, 'Rua Nova, 999', NULL);

-- Remoção
CALL sp_manage_clients(3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);sp_manage_clients
