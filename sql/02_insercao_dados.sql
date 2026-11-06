-- Atividade 2: DML - Cadastro e registros IoT
-- Execute depois das atividades anteriores, em ordem.

-- Etapa 1
INSERT INTO dispositivos (nome, localizacao, status)
VALUES
('ESP32-Lab-01', 'Laboratorio Central', 'ATIVO'),
('ESP32-Server-02', 'Sala de Servidores', 'ATIVO'),
('ESP32-Externo-03', 'Area Externa', 'MANUTENCAO');

-- Etapa 2
INSERT INTO leituras
(dispositivo_id, temperatura, umidade, timestamp)
VALUES
(1, 24.5, 60.2, '2026-11-06 08:00:00'),
(1, 25.8, 58.5, '2026-11-06 08:30:00'),
(1, 26.2, 57.0, '2026-11-06 09:00:00'),
(2, 19.5, 45.0, '2026-11-06 08:00:00'),
(2, 19.8, 44.8, '2026-11-06 08:30:00'),
(2, 20.1, 44.2, '2026-11-06 09:00:00'),
(3, 31.0, 75.0, '2026-11-06 08:00:00');

-- Etapa 3
SELECT * FROM dispositivos;
SELECT * FROM leituras;
