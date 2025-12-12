USE biblioteca;

-- 1. INSERT

-- Inserindo usuários
INSERT INTO usuarios (nome) VALUES ('Fernanda Rodrigues');
INSERT INTO usuarios (nome) VALUES ('Clara Moura');
INSERT INTO usuarios (nome) VALUES ('Luma de Souza');

-- Inserindo livros
INSERT INTO livros (titulo, ISBN, autor) VALUES ('Memórias Póstumas de Brás Cubas', '978-8535914849', 'Machado de Assis');
INSERT INTO livros (titulo, ISBN, autor) VALUES ('O Amor Não É Óbvio', '978-0007458424', 'Elayne Baeta');
INSERT INTO livros (titulo, ISBN, autor) VALUES ('O Manifesto Comunista', '978-0451524935', 'Karl Marx e Friedrich Engels');

-- Inserindo empréstimos
INSERT INTO emprestimos (id_usuario, data_emprestimo, data_devolucao) VALUES (1, '2025-03-10', NULL);  -- Emprétimo feito
INSERT INTO emprestimos (id_usuario, data_emprestimo, data_devolucao) VALUES (2, '2025-03-11', '2025-03-20'); -- Devolução feita

INSERT INTO emprestimos (id_usuario, data_emprestimo, data_devolucao) VALUES (3, '2025-12-31', NULL); -- Empréstimo feito

-- Inserindo itens
-- Justamente quais livros fazem parte de cada empréstimo
INSERT INTO itens (id_emprestimo, id_livro) VALUES (1, 1); 
INSERT INTO itens (id_emprestimo, id_livro) VALUES (1, 3); 
INSERT INTO itens (id_emprestimo, id_livro) VALUES (2, 2); 

-- 2. UPDATE

-- Atualizar o nome de um usuário
UPDATE usuarios
SET nome = 'Fernanda R. Oliveira'
WHERE id_usuario = 1;

-- Registrar a devolução de um empréstimo
UPDATE emprestimos
SET data_devolucao = '2025-03-18'
WHERE id_emprestimo = 1;

-- 3. DELETE

-- Remover um item específico do empréstimo
DELETE FROM itens
WHERE id_item = 3;

-- Remover um livro 
DELETE FROM livros
WHERE id_livro = 3;

-- 4. SELECT

-- Listar todos os usuários
SELECT * FROM usuarios;

-- Listar todos os livros
SELECT * FROM livros;

-- Listar todos os empréstimos
SELECT * FROM emprestimos;

-- Listar todos os itens de empréstimos
SELECT * FROM itens;

-- 5. JOIN

-- Listar empréstimos com os nomes dos usuários
SELECT e.id_emprestimo, u.nome
FROM emprestimos as E
INNER JOIN usuarios as U
	on e.id_usuario = u.id_usuario;
    
-- Empréstimos que ainda não foram devolvidos
SELECT e.id_emprestimo, e.data_emprestimo, u.nome
FROM emprestimos as E
INNER JOIN usuarios as U
	on e.id_usuario = u.id_usuario
WHERE data_devolucao is NULL;

-- Usuários e os livros que pegaram emprestado
SELECT u.nome, l.titulo
FROM usuarios as U
INNER JOIN emprestimos as E
	on e.id_usuario = u.id_usuario
INNER JOIN itens as I
	on e.id_emprestimo = i.id_emprestimo
INNER JOIN livros as L
	on l.id_livro = i.id_livro;
    
-- Livros e autores
SELECT l.autor, l.titulo
FROM livros as L