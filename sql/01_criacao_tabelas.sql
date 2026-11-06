-- Atividade 1: DDL - Criação e inspeção das tabelas
-- Execute depois das atividades anteriores, em ordem.
-- Execute este script apenas uma vez por banco de dados.
-- Para validar chaves estrangeiras na conexão ativa, use PRAGMA foreign_keys = ON.

-- Etapa 1
CREATE TABLE dispositivos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    localizacao TEXT NOT NULL,
    status TEXT CHECK (
        status IN ('ATIVO', 'MANUTENCAO', 'INATIVO')
    ) DEFAULT 'ATIVO'
);

-- Etapa 2
CREATE TABLE leituras (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dispositivo_id INTEGER,
    temperatura REAL,
    umidade REAL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (dispositivo_id)
        REFERENCES dispositivos(id)
);

-- Etapa 3
PRAGMA table_info('dispositivos');
PRAGMA table_info('leituras');
PRAGMA foreign_key_list('leituras');

-- Etapa 4
SELECT name, sql
FROM sqlite_master
WHERE type = 'table'
  AND name IN ('dispositivos', 'leituras');
