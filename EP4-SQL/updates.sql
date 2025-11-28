USE maos_do_amanha;

-- 1. Atualizar telefone de um beneficiário
UPDATE Beneficiario
SET telefone = '999999999'
WHERE id_beneficiario = 1;

-- 2. Alterar local de uma turma
UPDATE Turma
SET local = 'Sala Principal'
WHERE id_turma = 1;

-- 3. Atualizar feedback
UPDATE Feedback
SET comentario = 'Excelente projeto!'
WHERE id_feedback = 1;
