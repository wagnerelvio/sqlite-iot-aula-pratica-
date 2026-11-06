-- Atividade 6: DML - UPDATE e DELETE
-- Execute depois das atividades anteriores, em ordem.

-- Etapa 1
UPDATE dispositivos
SET status = 'ATIVO'
WHERE id = 3;

SELECT * FROM dispositivos;

-- Etapa 2
INSERT INTO leituras
(dispositivo_id, temperatura, umidade)
VALUES (1, 35.0, 50.0);

SELECT * FROM leituras
WHERE temperatura = 35.0;

-- Etapa 3
DELETE FROM leituras
WHERE dispositivo_id = 1
  AND temperatura = 35.0
  AND umidade = 50.0;

SELECT * FROM leituras;
