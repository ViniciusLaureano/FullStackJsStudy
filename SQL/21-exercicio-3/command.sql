-- Tabela de pacientes
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    date_of_birth DATE,
    gender CHAR(1),
    phone VARCHAR(20),
    address VARCHAR(255)
);

-- Tabela de especializações
CREATE TABLE specializations (
    id SERIAL PRIMARY KEY,
    specialization_name VARCHAR(100)
);

-- Tabela de médicos
CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    phone VARCHAR(15),
    specialization_id INT,
    FOREIGN KEY (specialization_id) REFERENCES specializations(id)
);

-- Tabela de consultas
CREATE TABLE consultations (
    id SERIAL PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    consultation_date DATE,
    observations VARCHAR(255),
    service_type VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);

-- Tabela de tratamentos
CREATE TABLE Treatments (
    id SERIAL PRIMARY KEY,
    consultation_id INT,
    medications VARCHAR(255),
    treatment_description TEXT,
    FOREIGN KEY (consultation_id) REFERENCES consultations(id)
);

-- Inserindo dados na tabela de especializações
INSERT INTO specializations (specialization_name) VALUES
	('Cardiologia'),
	('Dermatologia'),
	('Neurologia'),
	('Pediatria'),
	('Ortopedia');

-- Inserindo dados na tabela de médicos
INSERT INTO doctors (full_name, phone, specialization_id) VALUES
	('Dr. João Silva', '123456789', 1),  -- Cardiologia
	('Dr. Maria Souza', '987654321', 2), -- Dermatologia
	('Dr. Carlos Oliveira', '555555555', 3), -- Neurologia
	('Dr. Ana Lima', '444444444', 4), -- Pediatria
	('Dr. Pedro Santos', '333333333', 5); -- Ortopedia

-- Inserindo dados na tabela de pacientes
INSERT INTO patients (full_name, date_of_birth, gender, phone, address) VALUES
	('José da Silva', '1980-01-01', 'M', '111111111', 'Rua A, 123'),
	('Maria Pereira', '1990-02-02', 'F', '222222222', 'Rua B, 456'),
	('Carlos Alberto', '2000-03-03', 'M', '333333333', 'Rua C, 789'),
	('Ana Paula', '2010-04-04', 'F', '444444444', 'Rua D, 1011'),
	('Pedro Henrique', '1975-05-05', 'M', '555555555', 'Rua E, 1213');

-- Inserindo dados na tabela de consultas
INSERT INTO consultations (patient_id, doctor_id, consultation_date, observations, service_type) VALUES
	(1, 1, '2024-06-01', 'Paciente com dores no peito.', 'Particular'),
	(2, 2, '2024-06-01', 'Paciente com irritações na pele.', 'Particular'),
	(3, 3, '2024-06-01', 'Paciente com dores de cabeça.', 'Plano de Saúde B'),
	(4, 4, '2024-06-02', 'Paciente com febre e tosse.', 'Particular'),
	(5, 5, '2024-06-02', 'Paciente com dores nas costas.', 'Particular'),
	(1, 3, '2024-06-02', 'Paciente com tonturas.', 'Plano de Saúde A'),
	(2, 4, '2024-06-02', 'Paciente com dor de garganta.', 'Particular'),
	(3, 1, '2024-06-04', 'Paciente com pressão alta.', 'Particular'),
	(4, 2, '2024-06-05', 'Paciente com alergias.', 'Particular'),
	(5, 3, '2024-06-06', 'Paciente com enxaqueca.', 'Plano de Saúde A');

-- Inserindo dados na tabela de tratamentos
INSERT INTO treatments (consultation_id, medications, treatment_description) VALUES
	(1, 'Aspirina', 'Repouso e medicação para dor.'),
	(2, 'Pomada Antialérgica', 'Aplicação tópica diária.'),
	(3, 'Paracetamol', 'Medicação para dor e repouso.'),
	(4, 'Antibiótico', 'Medicação para infecção e repouso.'),
	(5, 'Analgésico', 'Medicação para dor e fisioterapia.'),
	(6, 'Vertizine', 'Medicação para vertigem e repouso.'),
	(7, 'Antitérmico', 'Medicação para febre e repouso.'),
	(8, 'Anti-hipertensivo', 'Medicação para controle da pressão.'),
	(9, 'Antialérgico', 'Medicação para alergia.'),
	(10, 'Analgesico', 'Medicação para dor intensa.');

-- -------------------------
SELECT
	patients.id AS patient_id,
  patients.full_name AS patient_name,
  consultations.id AS consultation_id,
  consultations.consultation_date,
  doctors.id AS doctor_id,
  doctors.full_name AS doctor_name
FROM
	patients
JOIN
	consultations ON patients.id = consultations.patient_id
JOIN
	doctors ON doctors.id = consultations.doctor_id;

SELECT
	doctors.id AS doctor_id,
  doctors.full_name AS doctor_name,
  consultations.id AS consultation_id,
  consultations.consultation_date,
  consultations.observations,
  patients.id AS patient_id,
  patients.full_name AS patient_name
FROM
	doctors
JOIN
	consultations ON doctors.id = consultations.doctor_id
JOIN
	patients ON consultations.patient_id = patients.id
WHERE
	doctors.id = 1; -- Substitua 1 pelo ID de qualquer médico

SELECT
		treatments.id AS treatment_id, 
    treatments.treatment_description, 
    treatments.medications, 
    consultations.consultation_date,
    doctors.full_name AS doctor_full_name,
    patients.full_name AS patient_full_name
FROM
	treatments
JOIN
	consultations ON treatments.consultation_id = consultations.id
JOIN
	patients ON consultations.patient_id = patients.id
JOIN
	doctors ON doctors.id = consultations.doctor_id;

SELECT 
    doctors.id AS doctor_id, 
    doctors.full_name AS doctor_full_name,
    doctors.phone AS doctor_phone,
    specializations.specialization_name
FROM 
    doctors
JOIN 
    specializations ON doctors.specialization_id = specializations.id;

SELECT
		consultations.id AS consultation_id, 
    consultations.consultation_date, 
    patients.full_name AS patient_full_name, 
    doctors.full_name AS doctor_full_name, 
    consultations.observations, 
    consultations.service_type
FROM
	consultations
JOIN
	patients ON patients.id = consultations.patient_id
JOIN
	doctors ON doctors.id = consultations.doctor_id
WHERE
	consultations.consultation_date = '2024-06-01'; -- Substitua por qualquer data

SELECT 
	patients.id AS patient_id, 
	patients.full_name AS patient_full_name, 
	doctors.full_name AS doctor_full_name, 
	specializations.specialization_name
FROM 
	patients
JOIN 
	consultations ON patients.id = consultations.patient_id
JOIN 
	doctors ON consultations.doctor_id = doctors.id
JOIN 
	specializations ON doctors.specialization_id = specializations.id
WHERE 
	-- Substitua por qualquer especialização
	specializations.specialization_name = 'Cardiologia'; 


SELECT
	patients.id AS patient_id, 
	patients.full_name AS patient_full_name, 
	doctors.full_name AS doctor_full_name, 
	specializations.specialization_name
FROM
	patients
JOIN
	consultations ON patients.id = consultations.patient_id
JOIN
	doctors ON doctors.id = consultations.doctor_id
JOIN
	specializations ON doctors.specialization_id = specializations.id
WHERE
	specializations.specialization_name = 'Cardiologia';