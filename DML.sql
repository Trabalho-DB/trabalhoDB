-- Categorias

INSERT INTO categoria (nome, descricao) VALUES
('Calçados', 'Calçados em geral'),
('Tênis', 'Tênis de diversas marcas'),
('Acessórios', 'Óculos, bonés e mais');

-- Usuários
INSERT INTO usuario (nome, senha, email, endereco) VALUES
('Ana Costa', 'ana321', 'ana.costa@email.com', 'Rua das Flores, 101'),
('Bruno Lima', 'bruno654', 'bruno.lima@email.com', 'Av. Central, 202'),
('Fernanda Rocha', 'fern789', 'fernanda.rocha@email.com', 'Rua do Sol, 303'),
('Lucas Martins', 'lucas987', 'lucas.martins@email.com', 'Av. Paulista, 404'),
('Patrícia Mendes', 'patri123', 'patricia.mendes@email.com', 'Rua Verde, 505'),
('Diego Fernandes', 'dieg456', 'diego.fernandes@email.com', 'Rua Azul, 606'),
('Juliana Pires', 'juli789', 'juliana.pires@email.com', 'Rua do Comércio, 707'),
('Rafael Nogueira', 'rafa987', 'rafael.nogueira@email.com', 'Av. dos Andradas, 808'),
('Camila Ribeiro', 'cami654', 'camila.ribeiro@email.com', 'Rua das Palmeiras, 909'),
('Thiago Alves', 'thi321', 'thiago.alves@email.com', 'Av. Brasil, 1001');

-- Produtos
INSERT INTO produto (marca, sexo, tamanho, preco, quantidade_estoque, categoria_id) VALUES
('Nike', 'Masculino', '40', 149.90, 10, 1),
('Adidas', 'Feminino', '36', 129.99, 5, 1),
('Puma', 'Unissex', '42', 199.50, 8, 1),
('Under Armour', 'Masculino', '43', 179.90, 12, 1),
('Reebok', 'Feminino', '38', 119.90, 6, 1),
('Fila', 'Unissex', '44', 139.90, 4, 1),
('Vans', 'Masculino', '42', 299.99, 7, 2),
('Nike', 'Feminino', '38', 349.99, 9, 2),
('Adidas', 'Unissex', '40', 319.90, 5, 2),
('New Balance', 'Masculino', '41', 279.90, 6, 2),
('Asics', 'Feminino', '37', 289.90, 8, 2),
('Converse', 'Unissex', '39', 199.99, 10, 2),
('Ray-Ban', 'Unissex', 'U', 399.90, 2, 3),
('Oakley', 'Masculino', 'U', 359.90, 3, 3),
('Guess', 'Feminino', 'U', 249.90, 4, 3),
('Tommy Hilfiger', 'Unissex', 'U', 299.99, 6, 3),
('Nike', 'Masculino', '44', 159.90, 5, 1),
('Adidas', 'Feminino', '39', 139.90, 6, 1),
('Puma', 'Masculino', '36', 149.90, 7, 1),
('Vans', 'Unissex', '42', 169.90, 8, 1),
('Reebok', 'Masculino', '40', 129.90, 5, 1),
('Fila', 'Feminino', '36', 119.90, 4, 1),
('New Balance', 'Unissex', '43', 139.90, 3, 1),
('Oakley', 'Masculino', '41', 309.90, 2, 2),
('Tommy Hilfiger', 'Feminino', '39', 269.90, 3, 3);

-- Pedidos
INSERT INTO pedido (usuario_id, status) VALUES
(1, 'Em processamento'),
(2, 'Enviado'),
(3, 'Entregue'),
(1, 'Cancelado'),
(4, 'Entregue'),
(5, 'Em processamento'),
(2, 'Em processamento'),
(3, 'Enviado');

-- Itens do pedido
INSERT INTO item_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 2, 149.90),
(1, 7, 1, 299.99),
(2, 2, 1, 129.99),
(2, 8, 1, 349.99),
(3, 3, 1, 199.50),
(3, 13, 1, 399.90),
(4, 5, 2, 119.90),
(5, 4, 1, 179.90),
(5, 9, 1, 319.90),
(6, 6, 2, 139.90),
(6, 14, 1, 359.90),
(7, 11, 1, 289.90),
(7, 10, 1, 279.90),
(8, 18, 1, 139.90),
(8, 24, 1, 309.90);

-- Atualizando o status do pedido 1 para 'Enviado'
UPDATE pedido
SET status = 'Enviado'
WHERE id = 1;

-- Removendo o item do pedido 5 referente ao produto 9
DELETE FROM item_pedido
WHERE pedido_id = 5 AND produto_id = 9;

