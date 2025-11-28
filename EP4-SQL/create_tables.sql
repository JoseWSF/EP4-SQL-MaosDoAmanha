DROP DATABASE IF EXISTS maos_do_amanha;

CREATE DATABASE maos_do_amanha
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE maos_do_amanha;

-- 1. Coordenador
CREATE TABLE Coordenador (
  id_coordenador INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  email VARCHAR(150) UNIQUE,
  telefone VARCHAR(20)
) ENGINE=InnoDB;

-- 2. Projeto
CREATE TABLE Projeto (
  id_projeto INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  categoria VARCHAR(100),
  descricao TEXT,
  data_inicio DATE,
  data_fim DATE,
  id_coordenador INT NOT NULL,
  CONSTRAINT fk_proj_coord FOREIGN KEY (id_coordenador)
    REFERENCES Coordenador(id_coordenador)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 3. Voluntário
CREATE TABLE Voluntario (
  id_voluntario INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  email VARCHAR(150) UNIQUE,
  area_interesse VARCHAR(100),
  disponibilidade VARCHAR(100)
) ENGINE=InnoDB;

-- 4. Beneficiário
CREATE TABLE Beneficiario (
  id_beneficiario INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  idade INT,
  endereco VARCHAR(255),
  telefone VARCHAR(20)
) ENGINE=InnoDB;

-- 5. Turma
CREATE TABLE Turma (
  id_turma INT AUTO_INCREMENT PRIMARY KEY,
  id_projeto INT NOT NULL,
  nome VARCHAR(150),
  horario VARCHAR(50),
  local VARCHAR(150),
  CONSTRAINT fk_turma_proj FOREIGN KEY (id_projeto)
    REFERENCES Projeto(id_projeto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 6. Participação Voluntário
CREATE TABLE Participacao_Voluntario (
  id_voluntario INT NOT NULL,
  id_projeto INT NOT NULL,
  data_entrada DATE,
  papel VARCHAR(100),
  PRIMARY KEY (id_voluntario, id_projeto),
  CONSTRAINT fk_pv_vol FOREIGN KEY (id_voluntario)
    REFERENCES Voluntario(id_voluntario)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_pv_proj FOREIGN KEY (id_projeto)
    REFERENCES Projeto(id_projeto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 7. Participação Beneficiário
CREATE TABLE Participacao_Beneficiario (
  id_beneficiario INT NOT NULL,
  id_projeto INT NOT NULL,
  data_inscricao DATE,
  PRIMARY KEY (id_beneficiario, id_projeto),
  CONSTRAINT fk_pb_ben FOREIGN KEY (id_beneficiario)
    REFERENCES Beneficiario(id_beneficiario)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_pb_proj FOREIGN KEY (id_projeto)
    REFERENCES Projeto(id_projeto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 8. Presença
CREATE TABLE Presenca (
  id_turma INT NOT NULL,
  id_beneficiario INT NOT NULL,
  data DATE NOT NULL,
  status ENUM('presente','ausente') DEFAULT 'presente',
  PRIMARY KEY (id_turma, id_beneficiario, data),
  CONSTRAINT fk_pres_turma FOREIGN KEY (id_turma)
    REFERENCES Turma(id_turma)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_pres_benef FOREIGN KEY (id_beneficiario)
    REFERENCES Beneficiario(id_beneficiario)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 9. Feedback
CREATE TABLE Feedback (
  id_feedback INT AUTO_INCREMENT PRIMARY KEY,
  id_beneficiario INT,
  id_projeto INT NOT NULL,
  nota TINYINT,
  comentario TEXT,
  data_feedback DATE,
  CONSTRAINT fk_feed_ben FOREIGN KEY (id_beneficiario)
    REFERENCES Beneficiario(id_beneficiario)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT fk_feed_proj FOREIGN KEY (id_projeto)
    REFERENCES Projeto(id_projeto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;
