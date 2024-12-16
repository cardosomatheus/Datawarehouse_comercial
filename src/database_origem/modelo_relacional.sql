﻿
                                -- AINDA EM DESENVOLVIMENTO

-- modelo logico da fonte.
/******************************************************************************************************************************/

-- TABELA: TB_PAIS
CREATE SEQUENCE IF NOT EXISTS SQ_PAIS INCREMENT 1 START 1 ;

CREATE TABLE IF NOT EXISTS TB_PAIS (
    ID BIGINT NOT NULL default NEXTVAL('SQ_PAIS'),
    NOME VARCHAR(100),
    SIGLA VARCHAR(2),
    CONTINENTE VARCHAR(50),
    CONSTRAINT PKEY_PAIS PRIMARY KEY (ID)
);

-- TABELA: TB_ESTADO
CREATE SEQUENCE IF NOT EXISTS SQ_ESTADO INCREMENT 1 START 1 ;

CREATE TABLE IF NOT EXISTS TB_ESTADO (
    ID BIGINT NOT NULL DEFAULT NEXTVAL('SQ_ESTADO'),
    NOME VARCHAR(100),
    SIGLA VARCHAR(5), 
    CAPITAL varchar(300),
    ID_PAIS BIGINT,
    CONSTRAINT PKEY_ESTADO PRIMARY KEY (ID),
    CONSTRAINT FKEY_ESTADO_PAIS FOREIGN KEY(ID_PAIS) REFERENCES TB_PAIS(ID)  
);

-- TABELA: TB_CIDADE
CREATE SEQUENCE IF NOT EXISTS SQ_CIDADE INCREMENT 1 START 1 ;

CREATE TABLE IF NOT EXISTS TB_CIDADE (
    ID BIGINT NOT null DEFAULT NEXTVAL('SQ_CIDADE'),
    NOME VARCHAR(100),
    SIGLA VARCHAR(5),
    ID_ESTADO BIGINT,
    ID_IBGE BIGINT,
    CONSTRAINT PKEY_CIDADE PRIMARY KEY (ID),
    CONSTRAINT FKEY_CIDADE_ESTADO FOREIGN KEY(ID_ESTADO) REFERENCES TB_ESTADO(ID)    
);

-- TABELA: TB_REGIAO
CREATE SEQUENCE IF NOT EXISTS SQ_REGIAO INCREMENT 1 START 1 ;

CREATE TABLE IF NOT EXISTS TB_REGIAO (
    ID BIGINT NOT NULL DEFAULT NEXTVAL('SQ_REGIAO'),
    LATITUDE VARCHAR(100),
    LONGITUDE VARCHAR(100),
    BAIRRO VARCHAR(100),
    ID_CIDADE BIGINT,
    CONSTRAINT PKEY_REGIAO PRIMARY KEY (ID),
    CONSTRAINT FKEY_REGIAO_CIDADE FOREIGN KEY(ID_CIDADE) REFERENCES TB_CIDADE(ID)    
);


-- Tabela: TB_CLIENTE
CREATE SEQUENCE IF NOT EXISTS SQ_CLIENTE INCREMENT 1 START 1;

CREATE TABLE IF NOT EXISTS TB_CLIENTE (
    ID BIGINT NOT null default NEXTVAL('SQ_CLIENTE'),
    NOME VARCHAR(255) NOT NULL,
    DOCUMENTO VARCHAR(100),
    ID_REGIAO BIGINT,
    CONSTRAINT PKEY_CLIENTE PRIMARY KEY(ID),
    CONSTRAINT FKEY_CLIENTE_REGIAO FOREIGN KEY(ID_REGIAO) REFERENCES TB_REGIAO(ID)  
);

-- TABELA: TB_MARCA_PRODUTO
CREATE SEQUENCE IF NOT EXISTS SQ_MARCA_PRODUTO INCREMENT 1 START 1 ;

CREATE TABLE IF NOT EXISTS TB_MARCA_PRODUTO (
    ID BIGINT NOT NULL DEFAULT NEXTVAL('SQ_MARCA_PRODUTO'),
    NOME VARCHAR(4000) NOT NULL,
    CONSTRAINT PKEY_MARCA_PRODUTO PRIMARY KEY (ID)
);

-- TABELA: TB_CATEGORIA_PRODUTO
CREATE SEQUENCE IF NOT EXISTS SQ_CATEGORIA_PRODUTO INCREMENT 1 START 1 ;

CREATE TABLE IF NOT EXISTS TB_CATEGORIA_PRODUTO (
    ID BIGINT NOT NULL DEFAULT NEXTVAL('SQ_CATEGORIA_PRODUTO'),
    NOME VARCHAR(4000) NOT NULL,
    CONSTRAINT PKEY_CATEGORIA_PRODUTO PRIMARY KEY (ID)
);

-- TABELA: TB_PRODUTO
CREATE SEQUENCE IF NOT EXISTS SQ_PRODUTO INCREMENT 1 START 1 ;

CREATE TABLE IF NOT EXISTS TB_PRODUTO (
    ID BIGINT NOT NULL DEFAULT NEXTVAL('SQ_PRODUTO'),
    NOME VARCHAR(4000) NOT NULL,
    NOME_COMERCIAL VARCHAR(250),
    ID_MARCA_PRODUTO BIGINT NOT NULL,
    ID_CATEGORIA_PRODUTO BIGINT NOT NULL,
    CONSTRAINT PKEY_PRODUTO PRIMARY KEY (ID),
    CONSTRAINT FKEY_MARCA_PRODUTO_PRODUTO FOREIGN KEY(ID_MARCA_PRODUTO) REFERENCES TB_MARCA_PRODUTO(ID),
    CONSTRAINT FKEY_CATEGORIA_PRODUTO_PRODUTO FOREIGN KEY(ID_CATEGORIA_PRODUTO) REFERENCES TB_CATEGORIA_PRODUTO(ID)
);


-- TABELA: TB_PEDIDO
CREATE SEQUENCE IF NOT EXISTS SQ_PEDIDO INCREMENT 1 START 1 ;

CREATE TABLE IF NOT EXISTS TB_PEDIDO (
    ID BIGINT NOT NULL DEFAULT NEXTVAL('SQ_PEDIDO'),
    ID_CLIENTE BIGINT NOT NULL,
    TOTAL_COMPRA BIGINT,
    DATA_COMPRA TIMESTAMP, 
    CONSTRAINT PKEY_PEDIDO PRIMARY KEY (ID),
    CONSTRAINT FKEY_PEDIDO_CLIENTE FOREIGN KEY(ID_CLIENTE) REFERENCES TB_CLIENTE(ID)        
);

-- TABELA: TB_ITEM_PEDIDO
CREATE SEQUENCE IF NOT EXISTS SQ_ITEM_PEDIDO INCREMENT 1 START 1 ;

CREATE TABLE IF NOT EXISTS TB_ITEM_PEDIDO (
    ID BIGINT NOT NULL DEFAULT NEXTVAL('SQ_ITEM_PEDIDO'),
    ID_PEDIDO BIGINT NOT NULL,
    ID_PRODUTO BIGINT NOT NULL,
    QUANTIDADE BIGINT,
    PRECO_ATUAL_USD NUMERIC(15, 2),
    CONSTRAINT PKEY_ITEM_PEDIDO PRIMARY KEY (ID),
    CONSTRAINT FKEY_ITEM_PEDIDO_PEDIDO FOREIGN KEY(ID_PEDIDO) REFERENCES TB_PEDIDO(ID),
    CONSTRAINT FKEY_ITEM_PEDIDO_PRODUTO FOREIGN KEY(ID_PRODUTO) REFERENCES TB_PRODUTO(ID)
);
