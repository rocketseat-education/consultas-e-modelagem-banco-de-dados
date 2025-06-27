SELECT first_name, last_name FROM customers WHERE customer_id IN (SELECT customer_id FROM orders);

SELECT product_name, price FROM products WHERE price > (SELECT AVG(price) FROM products);

SELECT order_id, total_amount FROM orders WHERE total_amount = (SELECT MAX(total_amount) FROM orders);

SELECT product_id, product_name FROM products p WHERE EXISTS (SELECT 1 FROM order_items oi WHERE oi.product_id = p.product_id);

SELECT product_name, price, (SELECT AVG(price) FROM products p2 WHERE p2.category_id = p1.category_id) AS media_categoria FROM products p1;

SELECT e.employee_id, e.first_name || ' ' || e.last_name AS nome, d.department_name, s.salary_amount FROM employees AS e INNER JOIN departments AS d ON e.department_id = d.department_id INNER JOIN salaries AS s ON e.employee_id = s.employee_id AND s.effective_to IS NULL WHERE s.salary_amount > (SELECT AVG(s2.salary_amount) FROM employees AS e2 INNER JOIN salaries AS s2 ON e2.employee_id = s2.employee_id AND s2.effective_to IS NULL WHERE e2.department_id = e.department_id) ORDER BY d.department_name, s.salary_amount DESC;

SELECT AVG(s.salary_amount) FROM employees AS e INNER JOIN departments AS d ON e.department_id = d.department_id INNER JOIN salaries AS s ON e.employee_id = s.employee_id AND s.effective_to IS NULL WHERE d.department_name = 'Marketing';

WITH pedidos_por_cliente AS (SELECT customer_id, COUNT(*) AS total_pedidos, SUM(total_amount) AS valor_total FROM orders GROUP BY customer_id) SELECT c.first_name, c.last_name, p.total_pedidos, ROUND(p.valor_total / p.total_pedidos, 2) AS ticket_medio FROM pedidos_por_cliente p JOIN customers c ON c.customer_id = p.customer_id ORDER BY ticket_medio DESC;

WITH vendas_por_cidade AS (SELECT c.city, SUM(o.total_amount) AS total_vendas FROM customers c JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.city) SELECT * FROM vendas_por_cidade WHERE total_vendas > 1000 ORDER BY total_vendas DESC;

WITH vendas_produto AS (SELECT p.product_name, SUM(oi.quantity) AS total_vendido FROM products p JOIN order_items oi ON p.product_id = oi.product_id GROUP BY p.product_name) SELECT * FROM vendas_produto ORDER BY total_vendido DESC LIMIT 10;

WITH RECURSIVE numeros AS (SELECT 1 AS n UNION ALL SELECT n + 1 FROM numeros WHERE n < 10) SELECT * FROM numeros;

SELECT customer_id, first_name, last_name FROM customers WHERE customer_id IN (SELECT customer_id FROM orders) UNION SELECT customer_id, first_name, last_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM orders);

SELECT customer_id, first_name, last_name FROM customers WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders) UNION SELECT customer_id, first_name, last_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM orders);

SELECT product_id, product_name FROM products WHERE product_id IN (SELECT product_id FROM order_items) UNION ALL SELECT product_id, product_name FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items);

WITH uniao_teste AS (SELECT 'SP' AS origem, email FROM customers WHERE city = 'Sao Paulo' UNION ALL SELECT 'RJ' AS origem, email FROM customers WHERE city = 'Rio de Janeiro') SELECT email, COUNT(*) AS ocorrencias FROM uniao_teste GROUP BY email HAVING COUNT(*) > 1;

SELECT email FROM customers WHERE city = 'Sao Paulo' INTERSECT SELECT email FROM customers WHERE city = 'Rio de Janeiro';

SELECT product_id, product_name FROM products EXCEPT SELECT DISTINCT p.product_id, p.product_name FROM products p JOIN order_items oi ON oi.product_id = p.product_id;

SELECT o.customer_id, c.first_name, o.order_id, o.order_date, o.total_amount, SUM(o.total_amount) OVER (PARTITION BY o.customer_id ORDER BY o.order_date) AS total_acumulado FROM orders o JOIN customers c ON c.customer_id = o.customer_id ORDER BY o.customer_id, o.order_date;

SELECT o.customer_id, c.first_name, o.order_id, o.total_amount, ROUND(100.0 * o.total_amount / SUM(o.total_amount) OVER (PARTITION BY o.customer_id), 2) AS percentual_sobre_total FROM orders o JOIN customers c ON c.customer_id = o.customer_id ORDER BY o.customer_id, o.order_date;

SELECT customer_id, order_id, order_date, total_amount, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY total_amount DESC) AS row_num FROM orders;

SELECT customer_id, order_id, order_date, total_amount, RANK() OVER (PARTITION BY customer_id ORDER BY total_amount DESC) AS ranking FROM orders;

SELECT customer_id, order_id, order_date, total_amount, DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY total_amount DESC) AS posicao FROM orders;

SELECT o.customer_id, c.first_name, o.total_amount, ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.total_amount DESC) AS rn, RANK() OVER (PARTITION BY o.customer_id ORDER BY o.total_amount DESC) AS rk, DENSE_RANK() OVER (PARTITION BY o.customer_id ORDER BY o.total_amount DESC) AS drk FROM orders o JOIN customers c ON c.customer_id = o.customer_id ORDER BY o.customer_id, rk;

WITH vendas_mensais AS (SELECT DATE_TRUNC('month', order_date) AS mes, SUM(total_amount) AS total_vendas FROM orders GROUP BY mes) SELECT mes, total_vendas, LAG(total_vendas) OVER (ORDER BY mes) AS vendas_anterior, total_vendas - LAG(total_vendas) OVER (ORDER BY mes) AS diferenca FROM vendas_mensais ORDER BY mes;

WITH vendas_mensais AS (SELECT DATE_TRUNC('month', order_date) AS mes, SUM(total_amount) AS total_vendas FROM orders GROUP BY mes) SELECT mes, total_vendas, LEAD(total_vendas) OVER (ORDER BY mes) AS vendas_proximo_mes FROM vendas_mensais ORDER BY mes;
