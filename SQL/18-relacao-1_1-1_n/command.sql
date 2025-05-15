CREATE DATABASE aula_relacionamentos;

CREATE TABLE employees (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	phone VARCHAR(20)
);

CREATE TABLE addresses (
	id SERIAL PRIMARY KEY,
	street VARCHAR(100) NOT NULL,
	number VARCHAR(4),
	complement VARCHAR(20),
	city VARCHAR(100) NOT NULL,
	
	employee_id INT UNIQUE,
	FOREIGN KEY (employee_id) REFERENCES employees (id)
);

-- Crie uma tabela de departamentos
CREATE TABLE departments (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

-- Primeiro adicionamos a coluna
ALTER TABLE employees ADD COLUMN department_id INT;

-- Depois, adicionamos a constraint configurando uma chave estrangeira
ALTER TABLE employees ADD CONSTRAINT fk_department
	FOREIGN KEY (department_id) REFERENCES departments (id); 

-- Excluimos a tabela
DROP TABLE employees;

-- E a criamos novamente já definindo a chave estrangeira na criação
CREATE TABLE employees (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	phone VARCHAR(20),
	
	department_id INT NOT NULL,
	FOREIGN KEY (department_id) REFERENCES departments (id)
);

-- Comece pelos departamentos, a tabela mais simples
INSERT INTO departments (name) VALUES ('Imprensa'), ('Investigação'), ('Diplomacia');

-- Confira os IDs de cada um para usarmos na hora de inserir funcionários
SELECT * FROM departments;

-- Insira os funcionários
INSERT INTO employees (name, phone, department_id) 
	VALUES ('Clark Kent', '1111-1111', 1);

INSERT INTO employees (name, phone, department_id)
	VALUES ('Bruce Wayne', '2222-2222', 2);

INSERT INTO employees (name, phone, department_id)
	VALUES ('Diana Prince', '3333-3333', 3);

INSERT INTO employees (name, phone, department_id)
	VALUES ('John Jones', '4444-4444', 2);
	
-- Confira os IDs de cada um
SELECT * FROM employees;

-- A partir disso, insira os endereços
INSERT INTO addresses (street, city, employee_id)
	VALUES ('Rua A', 'Metropolis', 1);

INSERT INTO addresses (street, city, employee_id)
	VALUES ('Rua B', 'Gotham', 2);

INSERT INTO addresses (street, city, employee_id)
	VALUES ('Rua C', 'Themyscira', 3);

-- Repare que agora não é possível inserir mais endereços para esses IDs
INSERT INTO addresses (street, city, employee_id)
	VALUES ('Fazenda Kent', 'Smallville', 1);

SELECT * FROM employees JOIN addresses ON employees.id = addresses.employee_id;

-- Podemos obter os funcionários com uma junção com a tabela de depertamentos
SELECT * FROM employees JOIN departments ON employees.department_id = departments.id;

-- Ou podemos obter os departamentos com uma junção com a tabela de funcionários
SELECT * FROM departments JOIN employees ON employees.department_id = departments.id;

SELECT
	employees.id AS ID,
	employees.name AS Funcionário,
	employees.phone AS Telefone,
	departments.name AS Departamento
FROM employees JOIN departments ON employees.department_id = departments.id;