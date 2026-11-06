-- Atividade 4: JOIN - Relacionamento entre tabelas
-- Execute depois das atividades anteriores, em ordem.

-- Etapa 1
SELECT
    d.nome AS dispositivo,
    d.localizacao,
    l.temperatura,
    l.umidade,
    l.timestamp
FROM dispositivos d
JOIN leituras l
    ON d.id = l.dispositivo_id
ORDER BY l.timestamp DESC;
