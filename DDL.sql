CREATE TABLE usuario (
    id SERIAL PRIMARY KEY, 
    nome VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    endereco VARCHAR(50) NOT NULL
);

CREATE TABLE pedido (
    id SERIAL PRIMARY KEY,
    usuarioId INTEGER NOT NULL,
    data VARCHAR (30) NOT NULL,
    status VARCHAR (50) NOT NULL,
    FOREIGN KEY (usuarioId) REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE produto (
    id SERIAL PRIMARY KEY,
    marca VARCHAR (50) NOT NULL,
    sexo VARCHAR (50) NOT NULL,
    tamanho VARCHAR (2) NOT NULL,
    quantidade VARCHAR (50) NOT NULL,
    preco DECIMAL (4,2) NOT NULL,
    pedidoId INTEGER NOT NULL,
    FOREIGN KEY (pedidoId) REFERENCES pedido(id) ON DELETE CASCADE
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
    nome VARCHAR (50) NOT NULL,
    descricao VARCHAR (50) NOT NULL,
    produtoId INTEGER NOT NULL,
    FOREIGN KEY (produtoId) REFERENCES produto(id) ON DELETE CASCADE
);

CREATE TABLE estoque(
    id SERIAL PRIMARY KEY,
    produtoId INTEGER NOT NULL,
    FOREIGN KEY (produtoId) REFERENCES produto(id) ON DELETE CASCADE
);