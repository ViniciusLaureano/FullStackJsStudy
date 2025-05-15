-- UPDATE nome_da_tabela 
-- SET campo1 = valor1, campo2 = valor2 
-- WHERE condicao;

UPDATE tvseries SET status = 'Airing' WHERE status = 'Ongoing';

UPDATE movies SET title='Star Wars: A New Hope', genre='Sci-Fi/Fantasy' WHERE id=2;

UPDATE movies SET rating=8;


-- DELETE FROM nome_da_tabela 
-- WHERE condicao;

DELETE FROM tvseries WHERE title='The Office';

DELETE FROM tvseries WHERE release_year < 2000 AND seasons > 5;

DELETE FROM tvseries;