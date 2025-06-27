CREATE VIEW vw_produtos_caros AS SELECT p.product_id, p.product_name, c.category_name, p.price FROM products p JOIN categories c ON p.category_id = c.category_id WHERE p.price > 200;

SELECT * FROM vw_produtos_caros ORDER BY price DESC LIMIT 10;

DROP VIEW IF EXISTS vw_produtos_caros;

CREATE VIEW vw_pedidos_grandes AS SELECT o.order_id, o.total_amount, c.first_name || ' ' || c.last_name AS nome_cliente, c.city FROM orders o JOIN customers c ON o.customer_id = c.customer_id WHERE o.total_amount > 500;

SELECT * FROM vw_pedidos_grandes ORDER BY total_amount DESC;

CREATE VIEW vw_resumo_vendas_mensal AS SELECT date_trunc('month', o.order_date) AS mes, COUNT(o.order_id) AS total_pedidos, SUM(o.total_amount) AS valor_total FROM orders o GROUP BY 1;

SELECT * FROM vw_resumo_vendas_mensal WHERE mes = '2024-05-01';

CREATE VIEW vw_itens_pedido_detalhado AS SELECT o.order_id, p.product_name, oi.quantity, oi.unit_price, (oi.quantity * oi.unit_price) AS subtotal, o.order_date FROM order_items oi JOIN orders o ON oi.order_id = o.order_id JOIN products p ON oi. product_id = p.product_id;

SELECT viewname FROM pg_views WHERE schemaname = 'public' ;
