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

SELECT * FROM pedidos AS p INNER JOIN clientes AS c ON p.cliente_id = c.id INNER JOIN produtos AS pr ON p.produto_id = pr.id INNER JOIN pagamentos AS pg ON p.id = pg.pedido_id;

SELECT o.order_id, o.order_date, c.first_name || ' ' || c. last_name AS cliente, c.city, p.product_name, oi.quantity, oi.unit_price, (oi.quantity * oi.unit_price) AS subtotal FROM orders AS o INNER JOIN customers AS c ON o.customer_id = c.customer_id INNER JOIN order_items AS oi ON o.order_id = oi.order_id INNER JOIN products AS p ON oi.product_id = p.product_id WHERE o.status = 'DELIVERED';

SELECT o.order_id, o.order_date, c.first_name || ' ' || c. last_name AS cliente, c.city, p.product_name, oi.quantity, oi.unit_price, (oi.quantity * oi.unit_price) AS subtotal FROM orders AS o INNER JOIN customers AS c ON o.customer_id = c.customer_id INNER JOIN order_items AS oi ON o.order_id = oi.order_id INNER JOIN products AS p ON oi.product_id = p.product_id WHERE o.order_date BETWEEN '2024-06-01' AND '2024-08-31' ORDER BY o.order_date DESC;

SELECT DISTINCT c.city FROM customers AS c INNER JOIN orders AS o ON c.customer_id = o.customer_id;

SELECT CONCAT(c.first_name, ' ', c.last_name) AS nome_completo, TO_CHAR(o.order_date, 'DD/MM/YYYY') AS data_formatada FROM customers AS c INNER JOIN orders AS o ON c.customer_id = o.customer_id;

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS cliente, COUNT(o.order_id) AS total_pedidos FROM customers AS c INNER JOIN orders AS o ON c.customer_id = o.customer_id GROUP BY c.customer_id, c.first_name, c.last_name ORDER BY total_pedidos DESC;

SELECT o.order_id, CONCAT(c.first_name, ' ', c.last_name) AS cliente_completo, TO_CHAR(o.order_date, 'DD-Mon-YYYY') AS data_legivel FROM orders AS o INNER JOIN customers AS c ON o.customer_id = c.customer_id ORDER BY o.order_date DESC;

SELECT p.product_id, p.product_name, oi.order_id FROM products AS p LEFT JOIN order_items AS oi ON p.product_id = oi.product_id;

SELECT p.product_id, p.product_name, oi.order_id, COUNT(oi.order_item_id) AS total_vendas FROM products AS p LEFT JOIN order_items AS oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, oi.order_id ORDER BY total_vendas DESC;

SELECT p.product_id, p.product_name, oi.ordem_id FROM products AS p LEFT JOIN order_items AS oi ON p.product_id = oi.product_id WHERE oi.order_item_id IS NULL ORDER BY p.product_name;

SELECT c.customer_id, c.first_name, c.last_name, o.order_id FROM orders AS o RIGHT JOIN customers AS c ON o.customer_id = c.customer_id;

SELECT p.product_id, p.product_name, c.category_id, c.category_name FROM products AS p FULL JOIN categories AS c ON p.category_id = c.category_id ORDER BY c.category_id, p.product_id;

SELECT o.order_id, o.customer_id AS pedido_customer_id, o.order_date, o.status, c.customer_id AS cliente_customer_id, c.first_name || ' ' || c.last_name AS cliente, c.city FROM orders AS o FULL JOIN customers AS c ON o.customer_id = c.customer_id ORDER BY o.order_date DESC;

SELECT COALESCE(c.first_name, 'SEM NOME') AS primeiro_nome, COALESCE(c.last_name, 'DESCONHECIDO') AS sobrenome FROM customers AS c;

SELECT c.customer_id, COALESCE(c.first_name, 'SEM NOME') AS primeiro_nome, COALESCE(c.last_name, 'DESCONHECIDO') AS sobrenome, COALESCE(o.total_amount, 0) AS total_ultimo_pedido FROM customers AS c LEFT JOIN (SELECT customer_id, SUM(total_amount) AS total_amount FROM orders WHERE order_date >= '2024-01-01' GROUP BY customer_id) AS o ON c.customer_id = o.customer_id;
