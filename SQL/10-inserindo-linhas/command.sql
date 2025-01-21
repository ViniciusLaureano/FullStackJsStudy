INSERT INTO clientes (name, address, phone, created_at) 
	VALUES ('Isaac', 'Rua A, nº 12', '(11) 99876-5432', '2024-01-31');

INSERT INTO suppliers (name, phone, email, notes)
	VALUES ('ACME Inc.', '(11) 1111-1111', 'acme@email.com', 'N/a');

INSERT INTO snacks (name, price, description) 
	VALUES (
    'Hamburguer',
    8,
    'Pão, carne, alface, tomate, molho especial, batata palha'
  );

INSERT INTO stock_ingredients (name, category, quantity)
VALUES
	('Ovos', 'Diversos', 24),
  ('Tomate', 'Frutas', 14),
  ('Queijo', 'Diversos', 40),
  ('Presunto', 'Carnes', 40);