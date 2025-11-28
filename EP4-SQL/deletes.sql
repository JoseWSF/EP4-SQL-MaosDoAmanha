USE maos_do_amanha;

-- 1. Deletar presença de um dia específico
DELETE FROM Presenca
WHERE id_turma = 1 AND id_beneficiario = 1 AND data = '2024-03-02';

-- 2. Remover participação de beneficiário em um projeto
DELETE FROM Participacao_Beneficiario
WHERE id_beneficiario = 2 AND id_projeto = 2;

-- 3. Remover um feedback
DELETE FROM Feedback
WHERE id_feedback = 2;
