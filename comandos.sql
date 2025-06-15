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

SELECT customer_id, first_name FROM customers WHERE first_name LIKE 'Ju%';

SELECT customer_id, first_name, last_name FROM customers WHERE last_name LIKE '%Silva';

SELECT customer_id, first_name, last_name FROM customers WHERE first_name LIKE '%ia%';

SELECT product_id, product_name FROM products WHERE product_name LIKE '_roduto 1%';

SELECT COUNT(*) AS total_pedidos FROM orders;

SELECT COUNT(orders.total_amount) AS total_amount_nao_nulos FROM orders;

SELECT COUNT(customers.last_name) AS total_customers_nao_nulos FROM customers;

SELECT COUNT(DISTINCT customers.last_name) AS total_customers_nao_nulos FROM customers;

SELECT DISTINCT customers.last_name FROM customers;

SELECT COUNT(DISTINCT o.customer_id) AS clientes_unicos FROM orders o;

SELECT COUNT(price) AS produtos_com_preco FROM products;

SELECT SUM(total_amount) AS faturamento_geral FROM orders;

SELECT AVG(total_amount) AS media_pedidos FROM orders;

SELECT COUNT(total_amount), SUM(total_amount) AS faturamento_geral, AVG(total_amount) AS media_pedidos FROM orders;

SELECT AVG(price) AS media_precos FROM products;

SELECT MAX(price) AS preco_maximo, MIN(price) AS preco_minimo FROM products;

SELECT * FROM products ORDER BY price ASC;

SELECT MIN(created_at) AS primeira_data_cadastro FROM customers;

SELECT MAX(created_at) AS ultima_data_cadastro FROM customers;

SELECT product_id, product_name, price FROM products ORDER BY price ASC;

SELECT product_id, product_name, price FROM products ORDER BY price DESC;

SELECT * FROM customers ORDER BY first_name ASC;

SELECT * FROM customers ORDER BY first_name DESC;

SELECT * FROM customers ORDER BY created_at ASC;

SELECT * FROM customers ORDER BY created_at DESC;

SELECT order_id, status, order_date FROM orders ORDER BY status ASC, order_date DESC;

SELECT product_id, COUNT(*) AS total_vendas FROM order_items GROUP BY product_id;

SELECT product_id, SUM(quantity) AS total_quantidade FROM order_items GROUP BY product_id;

SELECT status, COUNT(*) AS qtde_pedidos FROM orders GROUP BY status;

SELECT DISTINCT status FROM orders;

SELECT city, COUNT(*) AS total_clientes FROM customers GROUP BY city;

SELECT category_id, COUNT(*) AS qtde_produtos FROM products GROUP BY category_id HAVING COUNT(*) > 5;

SELECT o.customer_id, COUNT(o.order_id) AS total_pedidos_2024 FROM orders o WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31' GROUP BY o.customer_id HAVING COUNT(o.order_id) > 3;

SELECT oi.product_id, SUM(oi.quantity) AS unidades_vendidas FROM order_items oi GROUP BY oi.product_id HAVING SUM(oi.quantity) > 2;

SELECT oi.product_id, SUM(oi.quantity) AS qtd_total FROM order_items oi GROUP BY oi.product_id ORDER BY SUM(oi.quantity) DESC LIMIT 10;

SELECT o.customer_id, SUM(o.total_amount) AS faturamento_total FROM orders o GROUP BY o.customer_id ORDER BY faturamento_total DESC LIMIT 5;

SELECT customer_id, CONCAT(first_name, ' ', last_name) AS nome_concatenado1, first_name || ' ' || last_name AS nome_concatenado2 FROM customers LIMIT 5;

SELECT customer_id, last_name, CHAR_LENGTH(last_name) AS tamanho_sobrenome FROM customers LIMIT 5;

SELECT customer_id, UPPER(first_name) AS nome_maiusculo, LOWER(last_name) AS sobrenome_minusculo FROM customers LIMIT 5;

SELECT ' Carlos ' AS texto_original, TRIM(' Carlos ') AS texto_trim, LTRIM(' Carlos ') AS texto_ltrim, RTRIM('Carlos  ') AS texto_rtrim;

SELECT product_id, product_name, SUBSTRING(product_name FROM 1 FOR 3) AS primeiros_3_caracteres FROM products LIMIT 5;

SELECT customer_id, last_name, POSITION('Silva' IN last_name) AS posicao_silva FROM customers WHERE last_name LIKE '%Silva%';

SELECT customer_id, last_name, REPLACE(last_name, 'Silva', 'S.') AS sobrenome_abreviado FROM customers WHERE last_name LIKE '%Silva%';

SELECT product_id, price, ROUND(price, 0) AS price_arredondado_inteiro, ROUND(price, 1) AS price_arredondado_1_casa, ROUND(price, 2) AS price_arredondado_2_casas FROM products LIMIT 5;

SELECT product_id, price, TRUNC(price, 0) AS price_truncado_inteiro, TRUNC(price, 1) AS price_truncado_1_casa FROM products LIMIT 5;

SELECT product_id, price, CEIL(price) AS price_ceil, FLOOR(price) AS price_floor FROM products LIMIT 5;

SELECT product_id, price, ABS(price * -1) AS valor_absoluto, POWER(price, 2) AS price_ao_quadrado, SQRT(price) AS raiz_quadrada_price FROM products LIMIT 5;

SELECT product_id, price, MOD(CAST(price AS INT), 7) AS resto_divisao_por_7 FROM products LIMIT 5;

SELECT product_id, price, CAST(price AS INT) AS price_inteiro FROM products LIMIT 5;

SELECT customer_id, created_at, CAST(created_at AS VARCHAR(20)) AS created_at_text FROM customers LIMIT 5;

SELECT '123' AS texto_original, CAST('123' AS INT) + 10 AS soma_exemplo;
