-- Criando o banco de dados
CREATE DATABASE biblioteca;

-- Usando o banco de dados
USE biblioteca;

-- Criando a tabela usuário
CREATE TABLE usuarios (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

-- Criando a tabela empréstimo
CREATE TABLE emprestimos (
	id_emprestimo INT PRIMARY KEY AUTO_INCREMENT, 
    data_emprestimo DATE NOT NULL, 
    data_devolucao DATE,
    
    id_usuario INT NOT NULL,
    
    CONSTRAINT fk_emprestimo_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);
    
-- Criando a tabela livro
CREATE TABLE livros (
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    ISBN VARCHAR(20),
    autor VARCHAR(100) NOT NULL
);

-- Criando a tabela item
CREATE TABLE itens (
    id_emprestimo INT NOT NULL,
    id_livro INT NOT NULL,
    
    PRIMARY KEY (id_emprestimo, id_livro),
    
    CONSTRAINT fk_item_emprestimo FOREIGN KEY (id_emprestimo) REFERENCES emprestimos(id_emprestimo),
    CONSTRAINT fk_item_livro FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);