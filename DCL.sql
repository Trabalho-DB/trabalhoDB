-- 1. Criar usuários
CREATE USER ana_costa WITH PASSWORD 'ana321';
CREATE USER bruno_lima WITH PASSWORD 'bruno654';
CREATE USER fernanda_rocha WITH PASSWORD 'fern789';
CREATE USER lucas_martins WITH PASSWORD 'lucas987';
CREATE USER patricia_mendes WITH PASSWORD 'patri123';
CREATE USER diego_fernandes WITH PASSWORD 'dieg456';
CREATE USER juliana_pires WITH PASSWORD 'juli789';
CREATE USER rafael_nogueira WITH PASSWORD 'rafa987';
CREATE USER camila_ribeiro WITH PASSWORD 'cami654';
CREATE USER thiago_alves WITH PASSWORD 'thi321';

-- 2. Criar roles (grupos de permissões)
CREATE ROLE atendente;
CREATE ROLE gerente;
CREATE ROLE cliente;

-- 3. Definir permissões para cada role

-- Atendente: leitura + escrita limitada em pedidos e itens, leitura em produtos e categorias
GRANT SELECT, INSERT, UPDATE ON pedido, item_pedido TO atendente;
GRANT SELECT ON produto, categoria TO atendente;

-- Gerente: permissões completas para produtos, categorias, pedidos e itens
GRANT SELECT, INSERT, UPDATE ON produto, categoria, pedido, item_pedido TO gerente;

-- Cliente: pode consultar produtos e categorias, além de criar pedidos e itens
GRANT SELECT ON produto, categoria TO cliente;
GRANT INSERT ON pedido, item_pedido TO cliente;

-- 4. Permissões extras para usuários sem roles específicas
-- Usuários com permissão somente leitura geral em todas as tabelas
GRANT SELECT ON ALL TABLES IN SCHEMA public TO ana_costa, fernanda_rocha, lucas_martins, diego_fernandes, juliana_pires, rafael_nogueira, thiago_alves;

-- 5. Conceder permissões para sequências (para insert funcionar nas tabelas com serial/identity)
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO atendente, gerente, cliente;

-- 6. Atribuir roles aos usuários

-- Atendentes
GRANT atendente TO bruno_lima, patricia_mendes, camila_ribeiro;

-- Gerentes
GRANT gerente TO diego_fernandes, juliana_pires;

-- Clientes
GRANT cliente TO ana_costa, fernanda_rocha, rafael_nogueira, thiago_alves;

-- 7. Tornar lucas_martins administrador com todos os privilégios
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO lucas_martins;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO lucas_martins;
