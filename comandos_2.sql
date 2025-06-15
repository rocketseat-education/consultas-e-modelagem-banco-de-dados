SELECT o.order_id, o.customer_id, o.order_date, o.total_amount FROM orders AS o WHERE o.customer_id IN (SELECT c.customer_id FROM customers AS c WHERE c.city = 'Sao Paulo') ORDER BY o.order_date;

SELECT * FROM customers WHERE city = 'Sao Paulo';

SELECT c.customer_id, c.first_name, c.last_name FROM customers c WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id AND o.status = 'DELIVERED') ORDER BY c.customer_id;

SELECT * FROM orders o;

SELECT p.product_id, p.product_name FROM products p WHERE NOT EXISTS (SELECT 1 FROM order_items oi WHERE oi.product_id = p.product_id) ORDER BY p.product_id;

SELECT o.status, SUM(CASE WHEN o.status = 'DELIVERED' THEN o.total_amount ELSE 0 END) AS total_entregue, SUM(CASE WHEN o.status = 'PENDING' THEN o.total_amount ELSE 0 END) AS total_pendente, SUM(o.total_amount) AS total_geral FROM orders o GROUP BY o.status;

SELECT DATE_TRUNC('month', o.order_date) AS mes, SUM(o.total_amount) AS total_geral, SUM(o.total_amount) FILTER (WHERE o.status = 'DELIVERED') AS total_entregue, SUM(o.total_amount) FILTER (WHERE o.status = 'PENDING') AS total_pendente FROM orders o GROUP BY DATE_TRUNC('month', o.order_date) ORDER BY mes;

SELECT p.product_id, p.product_name, c.category_id, c.category_name FROM products AS p INNER JOIN categories AS c ON p.category_id = c.category_id ORDER BY p.product_id;

SELECT p.product_id AS pid, p.product_name AS nome_produto, c.category_id, c.category_name FROM products AS p INNER JOIN categories AS c ON p.category_id = c.category_id WHERE p.price > 100 ORDER BY pid;

SELECT o.order_id, o.customer_id, c.first_name || ' ' || c.last_name AS cliente, o.order_date, o.status, o.total_amount FROM orders AS o INNER JOIN customers AS c ON o.customer_id = c.customer_id AND o.order_date >= c.created_at ORDER BY o.order_date DESC LIMIT 20;
