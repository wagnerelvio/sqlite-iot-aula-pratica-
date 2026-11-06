-- Atividade 5: Funções de agregação
-- Execute depois das atividades anteriores, em ordem.

-- Etapa 1
SELECT
    d.nome,
    ROUND(AVG(l.temperatura), 2) AS temp_media,
    MAX(l.temperatura) AS temp_maxima,
    MIN(l.temperatura) AS temp_minima,
    COUNT(l.id) AS total_leituras
FROM dispositivos d
LEFT JOIN leituras l
    ON d.id = l.dispositivo_id
GROUP BY d.id, d.nome;
