-- Execução inicial: crie as tabelas e insira os registros de exemplo.
-- Executar apenas uma vez no mesmo banco.
PRAGMA foreign_keys = ON;

CREATE TABLE dispositivos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    localizacao TEXT NOT NULL,
    status TEXT CHECK (
        status IN ('ATIVO', 'MANUTENCAO', 'INATIVO')
    ) DEFAULT 'ATIVO'
);

CREATE TABLE leituras (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dispositivo_id INTEGER,
    temperatura REAL,
    umidade REAL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (dispositivo_id)
        REFERENCES dispositivos(id)
);

INSERT INTO dispositivos (nome, localizacao, status)
VALUES
('ESP32-Lab-01', 'Laboratorio Central', 'ATIVO'),
('ESP32-Server-02', 'Sala de Servidores', 'ATIVO'),
('ESP32-Externo-03', 'Area Externa', 'MANUTENCAO');

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
