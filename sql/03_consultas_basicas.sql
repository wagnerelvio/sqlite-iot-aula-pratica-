-- Atividade 3: DQL - SELECT, WHERE e ORDER BY
-- Execute depois das atividades anteriores, em ordem.

-- Etapa 1
SELECT id, nome, localizacao
FROM dispositivos
WHERE status = 'ATIVO';

-- Etapa 2
SELECT *
FROM leituras
WHERE temperatura > 25;

-- Etapa 3
SELECT dispositivo_id, temperatura, timestamp
FROM leituras
ORDER BY temperatura DESC;
