CREATE SCHEMA IF NOT EXISTS db_clinica;
USE db_clinica;

-- Criar tabela exames
CREATE TABLE IF NOT EXISTS tb_exames (
    id_exame INT PRIMARY KEY,
    nome_exame VARCHAR(100),
    tipo_exame VARCHAR(50)
);

-- Criar tabela clientes
CREATE TABLE IF NOT EXISTS tb_clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(20),
    email VARCHAR(100)
);

-- Inserir exames
INSERT INTO tb_exames (id_exame, nome_exame, tipo_exame)
VALUES (1, 'tomografia', 'imagem');

INSERT INTO tb_exames (id_exame, nome_exame)
VALUES (2, 'ressonância magnética');

-- Atualizar exame
UPDATE tb_exames 
SET nome_exame = 'ressonância computadorizada de ombro'
WHERE id_exame = 2;

-- Inserir clientes
INSERT INTO tb_clientes (id_cliente, nome, cpf, email)
VALUES (1, 'Maria da Silva', '111222333111', 'jose@hotmail.com');

INSERT INTO tb_clientes (id_cliente, nome, cpf, email)
VALUES (2, 'Paulo Oliveira', '444222333555', 'paulo@hotmail.com');

-- Atualizar cliente (correto)
UPDATE tb_clientes 
SET cpf = '111888333777', email = 'maria@hotmail.com'
WHERE id_cliente = 1;

-- Consultas
SELECT * FROM tb_exames;
SELECT * FROM tb_clientes;