CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students (id),
    FOREIGN KEY (course_id) REFERENCES courses (id)
);

-- Insira dados na tabela de estudantes
INSERT INTO students (name) VALUES ('Peter'), ('Matt'), ('Tony'), ('Reed');

-- Insira dados na tabela de cursos
INSERT INTO courses (name) VALUES ('Fotografia'), ('Direito'), ('Física'), ('Engenharia');

SELECT * FROM students;
SELECT * FROM courses;

INSERT INTO student_courses (student_id, course_id) VALUES
	(1, 1),
	(1, 3),
	(2, 2),
	(3, 3),
	(3, 4),
	(4, 3),
	(4, 4);

-- Repare que a chave primária composta não permite
-- um mesmo estudante de um mesmo curso na tabela
INSERT INTO student_courses (student_id, course_id) VALUES (1, 3); -- ERRO

-- Visualize todos os estudantes e os cursos em que estão matriculados
SELECT
		students.id AS ID_Estudante,
    students.name AS Estudante,
    courses.id AS ID_Curso,
    courses.name AS Curso
FROM
    student_courses
JOIN students ON student_courses.student_id = students.id
JOIN courses ON student_courses.course_id = courses.id;
