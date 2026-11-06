-- Atividade 8: TCL - COMMIT e ROLLBACK
-- Execute depois das atividades anteriores, em ordem.
-- Execute cada exemplo de transação separadamente, do BEGIN ao COMMIT/ROLLBACK.

-- Etapa 1
BEGIN TRANSACTION;

UPDATE dispositivos
SET status = 'INATIVO'
WHERE id = 1;

SELECT * FROM dispositivos WHERE id = 1;

ROLLBACK;

SELECT * FROM dispositivos WHERE id = 1;

-- Etapa 2
BEGIN TRANSACTION;

UPDATE dispositivos
SET status = 'ATIVO'
WHERE id = 1;

COMMIT;
