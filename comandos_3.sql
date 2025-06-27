SELECT first_name, last_name FROM customers WHERE customer_id IN (SELECT customer_id FROM orders);

SELECT product_name, price FROM products WHERE price > (SELECT AVG(price) FROM products);

SELECT order_id, total_amount FROM orders WHERE total_amount = (SELECT MAX(total_amount) FROM orders);

SELECT product_id, product_name FROM products p WHERE EXISTS (SELECT 1 FROM order_items oi WHERE oi.product_id = p.product_id);

SELECT product_name, price, (SELECT AVG(price) FROM products p2 WHERE p2.category_id = p1.category_id) AS media_categoria FROM products p1;

SELECT e.employee_id, e.first_name || ' ' || e.last_name AS nome, d.department_name, s.salary_amount FROM employees AS e INNER JOIN departments AS d ON e.department_id = d.department_id INNER JOIN salaries AS s ON e.employee_id = s.employee_id AND s.effective_to IS NULL WHERE s.salary_amount > (SELECT AVG(s2.salary_amount) FROM employees AS e2 INNER JOIN salaries AS s2 ON e2.employee_id = s2.employee_id AND s2.effective_to IS NULL WHERE e2.department_id = e.department_id ORDER BY d.department_name, s.salary_amount DESC;

SELECT AVG(s.salary_amount) FROM employees AS e INNER JOIN departments AS d ON e.department_id = d.department_id INNER JOIN salaries AS s ON e.employee_id = s.employee_id AND s.effective_to IS NULL WHERE d.department_name = 'Marketing';

WITH pedidos_por_cliente AS (SELECT customer_id, COUNT(*) AS total_pedidos, SUM(total_amount) AS valor_total FROM orders GROUP BY customer_id) SELECT c.first_name, c.last_name, p.total_pedidos, ROUND(p.valor_total / p.total_pedidos, 2) AS ticket_medio FROM pedidos_por_cliente p JOIN customers c ON c.customer_id = p.customer_id ORDER BY ticket_medio DESC;

WITH vendas_por_cidade AS (SELECT c.city, SUM(o.total_amount) AS total_vendas FROM customers c JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.city) SELECT * FROM vendas_por_cidade WHERE total_vendas > 1000 ORDER BY total_vendas DESC;

WITH vendas_produto AS (SELECT p.product_name, SUM(oi.quantity) AS total_vendido FROM products p JOIN order _items oi ON p.product_id = oi.product_id GROUP BY p.product_name) SELECT * FROM vendas_produto ORDER BY total_vendido DESC LIMIT 10;

WITH RECURSIVE numeros AS (SELECT 1 AS n UNION ALL SELECT n + 1 FROM numeros WHERE n < 10) SELECT * FROM numeros;
