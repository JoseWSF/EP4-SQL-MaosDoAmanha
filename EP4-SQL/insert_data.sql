USE maos_do_amanha;

-- Coordenadores
INSERT INTO Coordenador (nome, email, telefone) VALUES
('Ana Ribeiro', 'ana@maos.org', '11988887777'),
('Carlos Mendes', 'carlos@maos.org', '11955554444');

-- Projetos
INSERT INTO Projeto (nome, categoria, descricao, data_inicio, id_coordenador)
VALUES
('Inclusão Digital', 'Educação', 'Aulas de informática básica', '2024-01-10', 1),
('Artes e Expressão', 'Cultura', 'Oficinas de arte e criatividade', '2024-02-15', 2);

-- Voluntários
INSERT INTO Voluntario (nome, email, area_interesse, disponibilidade) VALUES
('Marcos Lima', 'marcos@gmail.com', 'Tecnologia', 'Tarde'),
('Fernanda Costa', 'fernanda@gmail.com', 'Arte', 'Manhã');

-- Beneficiários
INSERT INTO Beneficiario (nome, idade, endereco, telefone) VALUES
('João Silva', 12, 'Rua A, 123', '111111111'),
('Maria Oliveira', 14, 'Rua B, 456', '222222222');

-- Turmas
INSERT INTO Turma (id_projeto, nome, horario, local) VALUES
(1, 'Turma 1 - Informática', '14:00', 'Sala 2'),
(2, 'Turma 1 - Artes', '09:00', 'Sala 1');

-- Participação voluntários
INSERT INTO Participacao_Voluntario VALUES
(1, 1, '2024-01-10', 'Instrutor'),
(2, 2, '2024-02-15', 'Instrutora');

-- Participação beneficiários
INSERT INTO Participacao_Beneficiario VALUES
(1, 1, '2024-01-15'),
(2, 2, '2024-02-20');

-- Presenças
INSERT INTO Presenca VALUES
(1, 1, '2024-03-01', 'presente'),
(1, 1, '2024-03-02', 'ausente'),
(2, 2, '2024-03-01', 'presente');

-- Feedbacks
INSERT INTO Feedback (id_beneficiario, id_projeto, nota, comentario, data_feedback)
VALUES
(1, 1, 9, 'Muito bom!', '2024-03-10'),
(2, 2, 10, 'Amei as aulas!', '2024-03-12');
