SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS origem;
CREATE SCHEMA origem;
USE origem;

-- Modificando a tabela Paciente
CREATE TABLE Paciente (
    PacienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    DataNascimento DATE,
    Genero VARCHAR(10),
    Email VARCHAR(255),
    Telefone VARCHAR(20),
    Endereco VARCHAR(255)
);


INSERT INTO Paciente (Nome, DataNascimento, Genero, Email, Telefone, Endereco) VALUES
    ('Maria Silva', '1990-05-20', 'Feminino', 'maria.silva@example.com', '1234567890', 'Rua A, 123'),
    ('João Santos', '1985-10-15', 'Masculino', 'joao.santos@example.com', '9876543210', 'Avenida B, 456'),
    ('Ana Souza', '2000-03-10', 'Feminino', 'ana.souza@example.com', '5678912345', 'Rua C, 789'),
    ('Pedro Ferreira', '1998-07-25', 'Masculino', 'pedro.ferreira@example.com', '5432167890', 'Avenida D, 101'),
    ('Mariana Oliveira', '1975-12-05', 'Feminino', 'mariana.oliveira@example.com', '8765432109', 'Rua E, 111'),
    ('José Lima', '1995-02-28', 'Masculino', 'jose.lima@example.com', '2198765432', 'Avenida F, 131'),
    ('Carolina Almeida', '1980-09-15', 'Feminino', 'carolina.almeida@example.com', '3219876543', 'Rua G, 151'),
    ('Fernando Costa', '1992-11-30', 'Masculino', 'fernando.costa@example.com', '7654321987', 'Avenida H, 171'),
    ('Julia Mendes', '1988-06-12', 'Feminino', 'julia.mendes@example.com', '4321987654', 'Rua I, 191'),
    ('Rafael Rodrigues', '1997-04-18', 'Masculino', 'rafael.rodrigues@example.com', '6543219870', 'Avenida J, 202');

-- Modificando a tabela Medico
CREATE TABLE Medico (
    MedicoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Especialidade VARCHAR(255),
    Email VARCHAR(255),
    Telefone VARCHAR(20),
    Endereco VARCHAR(255)
);


INSERT INTO Medico (Nome, Especialidade, Email, Telefone, Endereco) VALUES
    ('Dr. Carlos Silva', 'Cardiologista', 'carlos.silva@example.com', '1234567890', 'Rua X, 123'),
    ('Dra. Ana Souza', 'Pediatra', 'ana.souza@example.com', '9876543210', 'Avenida Y, 456'),
    ('Dr. João Santos', 'Dentista', 'joao.santos@example.com', '5678912345', 'Rua Z, 789'),
    ('Dr. Pedro Ferreira', 'Ortopedista', 'pedro.ferreira@example.com', '5432167890', 'Avenida W, 101'),
    ('Dra. Mariana Oliveira', 'Oftalmologista', 'mariana.oliveira@example.com', '8765432109', 'Rua V, 111'),
    ('Dr. José Lima', 'Psiquiatra', 'jose.lima@example.com', '2198765432', 'Avenida U, 131'),
    ('Dra. Carolina Almeida', 'Dermatologista', 'carolina.almeida@example.com', '3219876543', 'Rua T, 151'),
    ('Dr. Fernando Costa', 'Ginecologista', 'fernando.costa@example.com', '7654321987', 'Avenida S, 171'),
    ('Dra. Julia Mendes', 'Otorrinolaringologista', 'julia.mendes@example.com', '4321987654', 'Rua R, 191'),
    ('Dr. Rafael Rodrigues', 'Neurologista', 'rafael.rodrigues@example.com', '6543219870', 'Avenida Q, 202');

-- Modificando a tabela Consulta
CREATE TABLE Consulta (
    ConsultaID INT AUTO_INCREMENT PRIMARY KEY,
    Hora_inicio_consulta DATETIME,
    Hora_fim_consulta DATETIME,
    PacienteID INT,
    MedicoID INT,
    Descricao VARCHAR(500),
    FOREIGN KEY (PacienteID) REFERENCES Paciente(PacienteID),
    FOREIGN KEY (MedicoID) REFERENCES Medico(MedicoID)
);


INSERT INTO Consulta (Hora_inicio_consulta, Hora_fim_consulta, PacienteID, MedicoID, Descricao) VALUES
    ('2023-10-30 09:00:00', '2023-10-30 10:00:00', 1, 1, 'Consulta de rotina'),
    ('2023-10-31 14:00:00', '2023-10-31 15:00:00', 2, 2, 'Acompanhamento pós-operatório'),
    ('2023-11-01 11:00:00', '2023-11-01 12:00:00', 3, 3, 'Avaliação de sintomas'),
    ('2023-11-02 10:30:00', '2023-11-02 11:30:00', 4, 4, 'Check-up anual'),
    ('2023-11-03 14:30:00', '2023-11-03 15:30:00', 5, 5, 'Consulta de emergência'),
    ('2023-11-04 09:30:00', '2023-11-04 10:30:00', 6, 6, 'Consulta de rotina'),
    ('2023-11-05 12:00:00', '2023-11-05 13:00:00', 7, 7, 'Acompanhamento pós-operatório'),
    ('2023-11-06 10:00:00', '2023-11-06 11:00:00', 8, 8, 'Avaliação de sintomas'),
    ('2023-11-07 15:30:00', '2023-11-07 16:30:00', 9, 9, 'Check-up anual'),
    ('2023-11-08 09:45:00', '2023-11-08 10:45:00', 10, 10, 'Consulta de emergência');

-- Modificando a tabela SatisfacaoPaciente
CREATE TABLE SatisfacaoPaciente (
    ConsultaID INT,
    PacienteID INT,
    Nota INT,
    Comentario VARCHAR(500),
    PRIMARY KEY (ConsultaID, PacienteID),
    FOREIGN KEY (ConsultaID) REFERENCES Consulta(ConsultaID),
    FOREIGN KEY (PacienteID) REFERENCES Paciente(PacienteID)
);

-- Inserindo 10 registros na tabela SatisfacaoPaciente
INSERT INTO SatisfacaoPaciente (ConsultaID, PacienteID, Nota, Comentario) VALUES
    (1, 1, 5, 'Ótimo atendimento'),
    (2, 2, 4, 'Bom atendimento, mas a espera foi um pouco longa'),
    (3, 3, 3, 'Médico atencioso, porém o consultório estava um pouco bagunçado'),
    (4, 4, 5, 'Consulta rápida e eficiente'),
    (5, 5, 2, 'O médico parecia apressado e não explicou bem o diagnóstico'),
    (6, 6, 4, 'Sem reclamações, consulta dentro do esperado'),
    (7, 7, 5, 'Atendimento excelente, consultório bem organizado'),
    (8, 8, 3, 'Médico um pouco distraído durante a consulta'),
    (9, 9, 4, 'Exames completos realizados, médico explicou tudo detalhadamente'),
    (10, 10, 5, 'Consulta de emergência rápida e eficaz');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

