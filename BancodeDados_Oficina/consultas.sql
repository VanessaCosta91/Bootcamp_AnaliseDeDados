-- Consultas
USE oficina;

-- Soma dos serviços finalizados
SELECT SUM(price)
FROM orders
WHERE statusOrder = 'Finalizado';

-- Lista Clientes
SELECT *
FROM clientes
ORDER BY clientName;

-- Filtra veiculos de clientes PF
SELECT v.Plate AS placas,v.modelYear AS Modelo_Ano
FROM veiculos v
JOIN clientes c ON  v.idClient = c.idClient
WHERE c.clientType = "PF"
ORDER BY placas;

-- Quantidade de dias do serviço, valor dos itens, lucro
SELECT
	o.idOrder,
	DATEDIFF(o.completiondate, o.issueDate) AS duracao_serviço,
    COALESCE(SUM(s.Price),0) + COALESCE(SUM(p.Price),2) AS custo_total_serviço,
    o.Price - COALESCE(SUM(s.Price),0) + COALESCE(SUM(p.Price),2)   AS lucro
FROM orders o
LEFT JOIN valoresServicos vs ON vs.idOrder = o.idOrder
LEFT JOIN servicos s ON s.idService = vs.idService
LEFT JOIN valoresPecas vp ON vp.idOrder = o.idOrder
LEFT JOIN pecas p ON p.idParts = vp.idParts
GROUP BY o.idOrder, o.price, o.issueDate, o.completionDate;    
