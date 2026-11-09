/*
    Projeto: Jogo de RPG Online
    Avaliação 1 - Banco de Dados
    SGBD: Microsoft SQL Server

    Relacionamentos:
    - USUARIOS 1:N PERSONAGENS
    - CLASSES 1:N PERSONAGENS
    - CLASSES N:N HABILIDADES, resolvido por CLASSES_HABILIDADES

    Observação: execute o script uma vez para criar o banco e as tabelas.
*/

-- 1. Criar o banco de dados
CREATE DATABASE RPG_Online;
GO

-- 2. Selecionar o banco de dados criado
USE RPG_Online;
GO

-- 3. Criar a tabela USUARIOS
CREATE TABLE USUARIOS
(
    UsuarioId INT PRIMARY KEY IDENTITY,
    Email VARCHAR(120) NOT NULL,
    Senha VARCHAR(120) NOT NULL
);
GO

-- 4. Criar a tabela CLASSES
CREATE TABLE CLASSES
(
    ClasseId INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(120) NOT NULL,
    Descricao TEXT
);
GO

-- 5. Criar a tabela HABILIDADES
CREATE TABLE HABILIDADES
(
    HabilidadeId INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(120) NOT NULL
);
GO

-- 6. Criar a tabela PERSONAGENS
CREATE TABLE PERSONAGENS
(
    PersonagemId INT PRIMARY KEY IDENTITY,
    NomePersonagem VARCHAR(120) NOT NULL,
    UsuarioId INT NOT NULL,
    ClasseId INT NOT NULL,

    FOREIGN KEY (UsuarioId) REFERENCES USUARIOS(UsuarioId),
    FOREIGN KEY (ClasseId) REFERENCES CLASSES(ClasseId)
);
GO

-- 7. Criar a tabela associativa CLASSES_HABILIDADES
-- A chave primária é composta pelas duas chaves estrangeiras.
CREATE TABLE CLASSES_HABILIDADES
(
    ClasseId INT NOT NULL,
    HabilidadeId INT NOT NULL,

    PRIMARY KEY (ClasseId, HabilidadeId),
    FOREIGN KEY (ClasseId) REFERENCES CLASSES(ClasseId),
    FOREIGN KEY (HabilidadeId) REFERENCES HABILIDADES(HabilidadeId)
);
GO

-- 8. Conferir as tabelas criadas
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO
