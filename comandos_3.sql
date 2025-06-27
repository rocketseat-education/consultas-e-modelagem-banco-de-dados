SELECT first_name, last_name FROM customers WHERE customer_id IN (SELECT customer_id FROM orders);

SELECT product_name, price FROM products WHERE price > (SELECT AVG(price) FROM products);

SELECT order_id, total_amount FROM orders WHERE total_amount = (SELECT MAX(total_amount) FROM orders);

SELECT product_id, product_name FROM products p WHERE EXISTS (SELECT 1 FROM order_items oi WHERE oi.product_id = p.product_id);

SELECT product_name, price, (SELECT AVG(price) FROM products p2 WHERE p2.category_id = p1.category_id) AS media_categoria FROM products p1;

SELECT e.employee_id, e.first_name || ' ' || e.last_name AS nome, d.department_name, s.salary_amount FROM employees AS e INNER JOIN departments AS d ON e.department_id = d.department_id INNER JOIN salaries AS s ON e.employee_id = s.employee_id AND s.effective_to IS NULL WHERE s.salary_amount > (SELECT AVG(s2.salary_amount) FROM employees AS e2 INNER JOIN salaries AS s2 ON e2.employee_id = s2.employee_id AND s2.effective_to IS NULL WHERE e2.department_id = e.department_id ORDER BY d.department_name, s.salary_amount DESC;

SELECT AVG(s.salary_amount) FROM employees AS e INNER JOIN departments AS d ON e.department_id = d.department_id INNER JOIN salaries AS s ON e.employee_id = s.employee_id AND s.effective_to IS NULL WHERE d.department_name = 'Marketing';
