SELECT * FROM usuario;

--Listar todos os produtos junto às suas categorias:
SELECT p.*, c.nome AS categoria
FROM produto p
JOIN categoria c ON p.categoria_id = c.id;

--Listar todos os pedidos junto ao nome do usuário que fez o pedido:
SELECT pedido.*, usuario.nome AS nome_usuario
FROM pedido
JOIN usuario ON pedido.usuario_id = usuario.id;

--Listar todos os itens de um pedido específico (por exemplo, pedido 1), mostrando o nome do produto e a quantidade:
SELECT item_pedido.quantidade, item_pedido.preco_unitario, produto.marca
FROM item_pedido
JOIN produto ON item_pedido.produto_id = produto.id
WHERE item_pedido.pedido_id = 1;

-- Somar o valor total de cada pedido:
SELECT pedido_id, SUM(quantidade * preco_unitario) AS total_pedido
FROM item_pedido
GROUP BY pedido_id;

-- Listar o nome de todos os usuários que fizeram pelo menos um pedido:
SELECT DISTINCT u.nome
FROM pedido p
JOIN usuario u ON p.usuario_id = u.id;

--Listar todos os produtos da categoria “Calçados”:
SELECT p.*
FROM produto p
JOIN categoria c ON p.categoria_id = c.id
WHERE c.nome = 'Calçados';

--Listar todos os pedidos que estão “Em processamento”:
SELECT *
FROM pedido
WHERE status = 'Em processamento';

--Ordenar todos os produtos pelo preço, do maior para o menor:
SELECT *
FROM produto
ORDER BY preco DESC;

--Quantos pedidos cada usuário fez:
SELECT u.nome, COUNT(p.id) AS total_pedidos
FROM pedido p
JOIN usuario u ON p.usuario_id = u.id
GROUP BY u.nome;

