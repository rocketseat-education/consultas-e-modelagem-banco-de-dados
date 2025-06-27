CREATE VIEW vw_produtos_caros AS SELECT p.product_id, p.product_name, c.category_name, p.price FROM products p JOIN categories c ON p.category_id = c.category_id WHERE p.price > 200;

SELECT * FROM vw_produtos_caros ORDER BY price DESC LIMIT 10;

DROP VIEW IF EXISTS vw_produtos_caros;

CREATE VIEW vw_pedidos_grandes AS SELECT o.order_id, o.total_amount, c.first_name || ' ' || c.last_name AS nome_cliente, c.city FROM orders o JOIN customers c ON o.customer_id = c.customer_id WHERE o.total_amount > 500;

SELECT * FROM vw_pedidos_grandes ORDER BY total_amount DESC;

CREATE VIEW vw_resumo_vendas_mensal AS SELECT date_trunc('month', o.order_date) AS mes, COUNT(o.order_id) AS total_pedidos, SUM(o.total_amount) AS valor_total FROM orders o GROUP BY 1;

SELECT * FROM vw_resumo_vendas_mensal WHERE mes = '2024-05-01';

CREATE VIEW vw_itens_pedido_detalhado AS SELECT o.order_id, p.product_name, oi.quantity, oi.unit_price, (oi.quantity * oi.unit_price) AS subtotal, o.order_date FROM order_items oi JOIN orders o ON oi.order_id = o.order_id JOIN products p ON oi.product_id = p.product_id;

SELECT viewname FROM pg_views WHERE schemaname = 'public';

CREATE MATERIALIZED VIEW mv_resumo_vendas_mensal AS SELECT date_trunc('month', o.order_date) AS mes, COUNT (o.order_id) AS total_pedidos, SUM(o.total_amount) AS valor_total FROM orders o GROUP BY 1;

SELECT * FROM mv_resumo_vendas_mensal;

REFRESH MATERIALIZED VIEW mv_resumo_vendas_mensal;

CREATE INDEX idx_mv_vendas_mes ON mv_resumo_vendas_mensal(mes);

SELECT * FROM mv_resumo_vendas_mensal WHERE mes BETWEEN '2024-01-01' AND '2024-06-01';

CREATE MATERIALIZED VIEW mv_top_clientes_2024 AS SELECT c.customer_id, c.first_name || ' ' || c.last_name AS nome_completo, SUM(o.total_amount) AS total_gasto FROM customers c JOIN orders o ON c.customer_id = o.customer_id WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31' GROUP BY c.customer_id, c.first_name, c.last_name HAVING SUM(o.total_amount) > 500;

CREATE TEMPORARY TABLE tmp_pedidos_junho AS SELECT * FROM orders WHERE order_date BETWEEN '2024-06-01' AND '2024-06-30';

CREATE TEMPORARY TABLE tmp_clientes_ativos AS SELECT DISTINCT c.customer_id, c.first_name || ' ' || c.last_name AS nome_completo FROM customers c JOIN orders o ON c.customer_id = o.customer_id WHERE o.order_date BETWEEN '2024-04-01' AND '2024-06-30';

SELECT t.nome_completo, COUNT(o.order_id) AS total_pedidos FROM tmp_clientes_ativos t JOIN orders o ON t.customer_id = o.customer_id GROUP BY t.nome_completo ORDER BY total_pedidos DESC;

CREATE TEMPORARY TABLE tmp_vendas_2024 AS SELECT * FROM orders WHERE order_date >= '2024-01-01';

CREATE VIEW vw_summary_2024 AS SELECT date_trunc('quarter', order_date) AS trimestre, COUNT (*) AS qtd_pedidos, SUM(total_amount) AS total_vendas FROM tmp_vendas_2024 GROUP BY 1;

SELECT * FROM vw_summary_2024 ORDER BY trimestre;
