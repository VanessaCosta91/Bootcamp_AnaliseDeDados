USE ecommerce;

-- Criar backup de clientes
CREATE TABLE clients_backup AS SELECT * FROM clients WHERE 1=0;

DELIMITER //

CREATE TRIGGER trg_before_delete_client
BEFORE DELETE ON clients
FOR EACH ROW
BEGIN
    INSERT INTO clients_backup
    VALUES (OLD.idClient, OLD.Fname, OLD.Lname, OLD.CPF, OLD.CNPJ, OLD.ClientType, OLD.Address, OLD.DateBirth);
END//

DELIMITER ;

DELIMITER //

-- Atualizar de status do pedido
CREATE TRIGGER trg_before_update_order
BEFORE UPDATE ON orders
FOR EACH ROW
BEGIN
    IF OLD.orderStatus = 'Entregue' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pedidos entregues não podem ser alterados';
    END IF;
END//

DELIMITER ;



