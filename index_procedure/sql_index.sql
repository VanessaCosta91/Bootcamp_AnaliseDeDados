USE ecommerce;

-- Consultas frequentes
-- Qual categoria possui mais produtos em estoque
SELECT
	p.Category AS categoria,
    SUM(ps.Quantity) AS total_produto
FROM product p
JOIN ProductStorage ps
	 ON p.idProduct = ps.idProduct
GROUP BY p.Category
ORDER BY total_produto DESC
LIMIT 1;

-- Index para consultas de departamento
CREATE INDEX idx_product_category ON product(Category);
CREATE INDEX idx_productstorage_idproduct ON ProductStorage(idProduct);

-- Quais categorias de produtos existem por localização de estoque
SELECT
	s.storageLocation AS localizacao,
    p.Category AS categoria
FROM Storages s
JOIN ProductStorage ps 
    ON s.idProdutctStorage = ps.idStorage
JOIN product p 
    ON p.idProduct = ps.idProduct
ORDER BY localizacao, categoria;

CREATE INDEX idx_storages_location ON Storages(storageLocation);
CREATE INDEX idx_productStorage_idstorage ON ProductStorage(idStorage);

-- Relação de produtos por categoria
SELECT
    Category AS categoria,
    PName AS produto
FROM product
ORDER BY Category, PName;

CREATE INDEX idx_product_category_pname ON product(Category, PName);


SHOW INDEX FROM Category;
SHOW INDEX FROM product;
SHOW INDEX FROM Storages;
SHOW INDEX FROM ProductStorage;

	

	

