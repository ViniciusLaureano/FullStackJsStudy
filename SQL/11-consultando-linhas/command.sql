SELECT * FROM clients;

SELECT id, name, phone, email FROM suppliers;

SELECT
	id AS Código,
	name AS Lanche,
	description AS Descrição,
	price AS Preço
FROM snacks;

-- Obtém os ingredientes com quantidade menor que 20
SELECT * FROM stock_ingredients WHERE quantity < 20;

-- Obtém os ingredientes da categoria Diversos
SELECT * FROM stock_ingredients WHERE category = 'Diversos';

-- Operador E (AND)
SELECT * FROM stock_ingredients WHERE category = 'Diversos' AND quantity < 25;

-- Operador OU (OR)
SELECT * FROM stock_ingredients WHERE category = 'Diversos' OR quantity < 25;

-- Operador IN para obter uma coluna pertencente a um conjunto
SELECT * FROM stock_ingredients WHERE category IN ('Carnes', 'Frutas');