SELECT product_id, product_name, price FROM products WHERE price > 100;

SELECT customer_id, first_name || ' ' || last_name AS full_name, city FROM customers WHERE city = 'Sao Paulo';

SELECT product_id, product_name, category_id FROM products WHERE category_id = 3;

SELECT order_id, status FROM orders WHERE status <> 'DELIVERED';

SELECT customer_id, created_at FROM customers WHERE created_at < '2024-06-01';

SELECT product_id, price FROM products WHERE price <= 50;

INSERT INTO customers(customer_id, first_name, last_name, email, city, created_at) VALUES (333, 'João', NULL, 'joao.silva1@exemplo.com', 'Sao Paulo', '2024-05-17');

SELECT * FROM customers WHERE last_name IS NULL;

SELECT * FROM customers WHERE last_name IS NOT NULL;

SELECT customer_id, first_name, last_name, city FROM customers WHERE city = 'Sao Paulo' AND created_at >= '2024-01-01';

SELECT product_id, product_name, price FROM products WHERE price < 50 OR price > 400;

SELECT order_id, total_amount, status FROM orders WHERE (status = 'DELIVERED' OR status = 'SHIPPED') AND total_amount > 300;

SELECT order_id, status FROM orders WHERE status IN ('PENDING', 'SHIPPED');

SELECT product_id, category_id FROM products WHERE category_id IN (1, 3, 5);

SELECT customer_id FROM customers WHERE city = 'Manaus' OR city = 'Recife' OR city = 'Fortaleza';

SELECT customer_id FROM customers WHERE city IN ('Manaus', 'Recife', 'Fortaleza');

SELECT product_id, product_name, category_id FROM products WHERE category_id NOT IN (2, 4, 6);

SELECT product_id, product_name FROM products WHERE category_id IS NOT NULL AND category_id NOT IN (2, 4, 6);

SELECT product_id, price FROM products WHERE price BETWEEN 150 AND 300;

SELECT product_id, product_name FROM products WHERE product_name BETWEEN 'Produto 10' AND 'Produto 20';
