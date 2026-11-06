-- Atividade 7: CTEs e funções de janela
-- Execute depois das atividades anteriores, em ordem.

-- Etapa 1
WITH leituras_rankeadas AS (
    SELECT
        d.nome AS dispositivo,
        d.localizacao,
        l.temperatura,
        l.umidade,
        l.timestamp,
        ROW_NUMBER() OVER (
            PARTITION BY l.dispositivo_id
            ORDER BY l.timestamp DESC, l.id DESC
        ) AS rn
    FROM dispositivos d
    JOIN leituras l
        ON d.id = l.dispositivo_id
)
SELECT
    dispositivo, localizacao,
    temperatura, umidade, timestamp
FROM leituras_rankeadas
WHERE rn = 1;

-- Etapa 2
SELECT
    d.nome AS dispositivo,
    l.timestamp,
    l.temperatura AS temp_atual,
    LAG(l.temperatura, 1) OVER (
        PARTITION BY l.dispositivo_id
        ORDER BY l.timestamp, l.id
    ) AS temp_anterior,
    ROUND(
        l.temperatura -
        LAG(l.temperatura, 1) OVER (
            PARTITION BY l.dispositivo_id
            ORDER BY l.timestamp, l.id
        ), 2
    ) AS variacao_temperatura
FROM leituras l
JOIN dispositivos d
    ON l.dispositivo_id = d.id;

-- Etapa 3
WITH medias_dispositivos AS (
    SELECT
        d.id,
        d.nome AS dispositivo,
        AVG(l.temperatura) AS media_temp
    FROM dispositivos d
    JOIN leituras l
        ON d.id = l.dispositivo_id
    GROUP BY d.id, d.nome
)
SELECT
    dispositivo,
    ROUND(media_temp, 2) AS media_temperatura
FROM medias_dispositivos
WHERE media_temp > 22.0;
