-- Criando o banco de dados
CREATE DATABASE biblioteca;

-- Usando o banco de dados
USE biblioteca;

-- Criando a tabela usuário
CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

-- Criando a tabela empréstimo
CREATE TABLE emprestimo (
	id_emprestimo INT PRIMARY KEY AUTO_INCREMENT, 
    id_usuario INT NOT NULL,
    data_emprestimo DATE NOT NULL, 
    data_devolucao DATE,
    
    CONSTRAINT fk_emprestimo_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);
    
-- Criando a tabela livro
CREATE TABLE livro (
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    isbn VARCHAR(20),
    autor VARCHAR(100) NOT NULL
);

-- Criando a tabela item
CREATE TABLE item (
    id_emprestimo INT NOT NULL,
    id_livro INT NOT NULL,
    
    CONSTRAINT fk_item_emprestimo FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id_emprestimo),
    CONSTRAINT fk_item_livro FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);
