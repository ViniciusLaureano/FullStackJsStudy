-- Fill `clients` table
-- INSERT INTO clients (name, phone, address) VALUES
--   ('Nadeen Nassy', '(894) 3770999', '344 Comanche Circle'),
--   ('Rufe Woolforde', '(876) 3190195', '1199 Garrison Junction'),
--   ('Erl Bumphrey', '(828) 4611193', '279 Carey Way'),
--   ('Libbey Allbut', '(780) 9682663', '0 Tennyson Pass'),
--   ('Vick Saterthwait', '(858) 2707342', '8098 Carpenter Crossing'),
--   ('Valma Leathlay', '(988) 1855788', '52 Pankratz Point'),
--   ('Cathrin Balcers', '(854) 2908154', '58 Kipling Alley'),
--   ('Fidelity Hurleston', '(169) 2896946', '99412 Nova Place'),
--   ('Lane Beggio', '(102) 4251437', '625 Mcguire Place'),
--   ('Abigale Ofield', '(414) 2709709', '4526 Ronald Regan Point'),
--   ('Melisse Stappard', '(828) 1752818', '4 Sunnyside Lane'),
--   ('Vito Breach', '(516) 2554781', '86120 Towne Court'),
--   ('Jessalin Duckett', '(333) 6498842', '02 Artisan Center'),
--   ('Bo Collie', '(163) 2032492', '0 Straubel Terrace'),
--   ('Raphaela Krates', '(916) 8872820', '7798 3rd Street'),
--   ('Lucian Draxford', '(827) 4937186', '739 Toban Way'),
--   ('Philippa Sidon', '(475) 4933015', '64985 Clarendon Way'),
--   ('Cordie Voce', '(937) 6629079', '767 Prairieview Road'),
--   ('Easter Petrescu', '(135) 9137473', '32 Dayton Crossing');

-- Ordena pelo nome em ordem alfabética decrescente
SELECT * FROM Clients ORDER BY name DESC;

-- Ordena por telefone baseado nos primeiros dígitos em ordem crescente
SELECT * FROM Clients ORDER BY phone ASC;

SELECT * FROM Clients LIMIT 4;

SELECT * FROM Clients LIMIT 4 OFFSET 4;

SELECT COUNT(id) AS Usuários FROM Clients;

SELECT SUM(quantity) AS Total FROM stock_ingredients;

SELECT AVG(quantity) AS Média FROM stock_ingredients;

-- Obtém todos os clientes com nome começando com 'V'
SELECT * FROM Clients WHERE name LIKE 'V%';

-- Obtém todos os clientes onde a segunda letra do nome é 'a'
SELECT * FROM Clients WHERE name LIKE '_a%';

-- Obtém todos os clientes onde a última letra do nome é 'd'
SELECT * FROM Clients WHERE name LIKE '%d';

-- Obtém todos os clientes que possuem 'an' em alguma parte do nome
SELECT * FROM Clients WHERE name LIKE '%an%';

-- Obtém os clientes com a letra 'B' em qualquer parte do nome
SELECT * FROM Clients WHERE name LIKE '%B%';

-- Obtém os clientes com as letras 'B' ou 'b' em qualquer parte do nome
SELECT * FROM Clients WHERE name ILIKE '%B%';