USE maos_do_amanha;

-- 1. Lista de beneficiários com seus projetos
SELECT b.nome AS beneficiario, p.nome AS projeto
FROM Participacao_Beneficiario pb
JOIN Beneficiario b ON b.id_beneficiario = pb.id_beneficiario
JOIN Projeto p ON p.id_projeto = pb.id_projeto;

-- 2. Voluntários e seus papéis nos projetos
SELECT v.nome, pv.papel, p.nome AS projeto
FROM Participacao_Voluntario pv
JOIN Voluntario v ON v.id_voluntario = pv.id_voluntario
JOIN Projeto p ON p.id_projeto = pv.id_projeto;

-- 3. Presença de um beneficiário específico
SELECT *
FROM Presenca
WHERE id_beneficiario = 1
ORDER BY data DESC;

-- 4. Projetos com turma e coordenador
SELECT p.nome AS projeto, t.nome AS turma, c.nome AS coordenador
FROM Projeto p
JOIN Turma t ON t.id_projeto = p.id_projeto
JOIN Coordenador c ON c.id_coordenador = p.id_coordenador;

-- 5. Top 2 melhores notas de feedback
SELECT *
FROM Feedback
ORDER BY nota DESC
LIMIT 2;
