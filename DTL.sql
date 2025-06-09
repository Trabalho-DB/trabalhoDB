DO $$
DECLARE
    pedido_id INTEGER;
    estoque_produto2 INTEGER;
    estoque_produto3 INTEGER;
BEGIN
    -- Verificar se há estoque suficiente para os produtos (produto 2: 2 unidades, produto 3: 1 unidade)
    SELECT quantidade_estoque INTO estoque_produto2 FROM produto WHERE id = 2;
    SELECT quantidade_estoque INTO estoque_produto3 FROM produto WHERE id = 3;

    IF estoque_produto2 < 2 OR estoque_produto3 < 1 THEN
        RAISE EXCEPTION 'Estoque insuficiente para um ou mais produtos.';
    END IF;

    -- Inicia transação implícita
    -- 1. Criar pedido
    INSERT INTO pedido (usuario_id, status)
    VALUES (1, 'pendente')
    RETURNING id INTO pedido_id;

    -- 2. Inserir itens do pedido
    INSERT INTO item_pedido (pedido_id, produto_id, quantidade, preco_unitario)
    VALUES 
        (pedido_id, 2, 2, 89.90),
        (pedido_id, 3, 1, 55.00);

    -- 3. Atualizar estoque dos produtos
    UPDATE produto
    SET quantidade_estoque = quantidade_estoque - 2
    WHERE id = 2;

    UPDATE produto
    SET quantidade_estoque = quantidade_estoque - 1
    WHERE id = 3;

    RAISE NOTICE 'Compra realizada com sucesso. Pedido ID: %', pedido_id;
END $$;
