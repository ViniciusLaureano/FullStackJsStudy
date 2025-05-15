-- Crie o banco
CREATE DATABASE exercicio2_sql;

-- Crie a tabela de filmes
CREATE TABLE IF NOT EXISTS movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    director VARCHAR(255),
    release_year INT,
    genre VARCHAR(100),
    duration INT,
    rating DECIMAL(3, 2),
    box_office DECIMAL(15, 2),
    production_cost DECIMAL(15, 2)
);

-- Crie a tabela de séries de TV
CREATE TABLE IF NOT EXISTS tvseries (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    creator VARCHAR(255),
    release_year INT,
    genre VARCHAR(100),
    seasons INT,
    episodes INT,
    rating DECIMAL(3, 2),
    network VARCHAR(100),
    status VARCHAR(50)
);

-- Linhas da tabela de filmes
INSERT INTO movies (title, director, release_year, genre, duration, rating, box_office, production_cost) VALUES
	('Mad Max: Fury Road', 'George Miller', 2015, 'Action', 120, 8.1, 375200000.00, 150000000.00),
	('Star Wars', 'George Lucas', 1977, 'Sci-Fi', 121, 8.6, 775398007.00, 11000000.00),
	('Super Mario Bros', 'Aaron Horvath, Michael Jelenic', 2023, 'Animation', 92, 7.3, 1300000000.00, 100000000.00),
	('Pride and Prejudice', 'Joe Wright', 2005, 'Romance', 129, 7.8, 121147947.00, 28000000.00),
	('Back to the Future', 'Robert Zemeckis', 1985, 'Sci-Fi', 116, 8.5, 381109762.00, 19000000.00),
	('The Godfather', 'Francis Ford Coppola', 1972, 'Crime', 175, 9.2, 246120974.00, 6000000.00),
	('The Lord of the Rings: The Return of the King', 'Peter Jackson', 2003, 'Fantasy', 201, 9.0, 1146030912.00, 94000000.00),
	('Treasure Planet', 'Ron Clements, John Musker', 2002, 'Animation', 95, 7.2, 109578115.00, 140000000.00),
	('Jurassic Park', 'Steven Spielberg', 1993, 'Adventure', 127, 8.1, 1043580597.00, 63000000.00),
	('About Time', 'Richard Curtis', 2013, 'Romance', 123, 7.8, 87100000.00, 12000000.00),
	('Transformers', 'Michael Bay', 2007, 'Action', 144, 7.0, 709709780.00, 150000000.00);

-- Linhas da tabela de séries
INSERT INTO tvseries (title, creator, release_year, genre, seasons, episodes, rating, network, status) VALUES
	('Breaking Bad', 'Vince Gilligan', 2008, 'Drama', 5, 62, 9.5, 'AMC', 'Ended'),
	('Game of Thrones', 'David Benioff, D.B. Weiss', 2011, 'Fantasy', 8, 73, 9.3, 'HBO', 'Ended'),
	('Stranger Things', 'The Duffer Brothers', 2016, 'Sci-Fi', 4, 34, 8.7, 'Netflix', 'Ongoing'),
	('Friends', 'David Crane, Marta Kauffman', 1994, 'Comedy', 10, 236, 8.9, 'NBC', 'Ended'),
	('The Office', 'Greg Daniels', 2005, 'Comedy', 9, 201, 8.8, 'NBC', 'Ended'),
	('Vikings', 'Michael Hirst', 2013, 'Historical Drama', 6, 89, 8.5, 'History Channel', 'Ended'),
	('Lost', 'J.J. Abrams, Damon Lindelof', 2004, 'Mystery', 6, 121, 8.4, 'ABC', 'Ended'),
	('Once Upon a Time', 'Edward Kitsis, Adam Horowitz', 2011, 'Fantasy', 7, 155, 7.7, 'ABC', 'Ended'),
	('The Mentalist', 'Bruno Heller', 2008, 'Crime', 7, 151, 8.1, 'CBS', 'Ended'),
	('Star Trek', 'Gene Roddenberry', 1966, 'Sci-Fi', 3, 79, 8.4, 'NBC', 'Ended'),
	('Cobra Kai', 'Josh Heald, Jon Hurwitz, Hayden Schlossberg', 2018, 'Action', 6, 50, 8.6, 'Netflix', 'Ongoing');

-- CONSULTAS
SELECT * FROM movies ORDER BY title;

SELECT * FROM movies WHERE box_office > 500000000.00;

SELECT id, title, release_year, genre, seasons, episodes, rating, status
FROM tvseries ORDER BY release_year DESC;

SELECT * FROM tvseries WHERE status = 'Ended' ORDER BY rating DESC;

SELECT * FROM movies WHERE release_year < 2000;

SELECT id, title, release_year, genre, rating FROM movies ORDER BY rating DESC;

SELECT * FROM movies WHERE release_year < 2000;

SELECT id, title, release_year, genre, rating FROM movies ORDER BY rating DESC;

SELECT
    AVG(CASE WHEN duration <= 120 THEN rating ELSE NULL END) AS avg_rating_up_to_2_hours,
    AVG(CASE WHEN duration > 120 THEN rating ELSE NULL END) AS avg_rating_over_2_hours
FROM movies;

SELECT id, title, release_year, rating, (box_office - production_cost) AS profit FROM movies ORDER BY profit DESC;