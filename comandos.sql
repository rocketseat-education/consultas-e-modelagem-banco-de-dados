SELECT product_id, product_name, price FROM products WHERE price > 100;

SELECT customer_id, first_name || ' ' || last_name AS full_name, city FROM customers WHERE city = 'Sao Paulo';

SELECT product_id, product_name, category_id FROM products WHERE category_id = 3;

SELECT order_id, status FROM orders WHERE status <> 'DELIVERED';

SELECT customer_id, created_at FROM customers WHERE created_at < '2024-06-01';

SELECT product_id, price FROM products WHERE price <= 50;

INSERT INTO customers(customer_id, first_name, last_name, email, city, created_at) VALUES (333, 'João', NULL, 'joao.silva1@exemplo.com', 'Sao Paulo', '2024-05-17');

SELECT * FROM customers WHERE last_name IS NULL;

SELECT * FROM customers WHERE last_name IS NOT NULL;
