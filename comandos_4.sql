EXPLAIN ANALYZE SELECT * FROM products WHERE price BETWEEN 100 AND 200;

CREATE INDEX idx_products_price ON products(price);

CREATE INDEX idx_products_price_hash ON products USING HASH(price); 

EXPLAIN ANALYZE SELECT * FROM products WHERE price = 249.37;

ALTER TABLE products ADD COLUMN tags TEXT[]; 

UPDATE products SET tags = ARRAY['promo', 'novo'] WHERE product_id % 5 = 0;

CREATE INDEX idx_products_category ON products(category_id);

CREATE UNIQUE INDEX idx_department_name_unq ON departments(department_name);

CREATE INDEX idx_orders_pending ON orders(order_date) WHERE status = 'PENDING';

CREATE INDEX idx_customers_lower_email ON customers (LOWER(email));

-- CREATE INDEX CONCURRENTLY index_name ON table_name using btree (column);

CREATE INDEX idx_product_name_price ON products (product_name, price);

SELECT COUNT (*) FROM products WHERE product_name LIKE '%P%' AND price > 100;

REINDEX INDEX idx_products_price;

VACUUM (ANALYZE) products;

EXPLAIN ANALYSE SELECT * FROM customers WHERE customer_id = 101;

EXPLAIN SELECT * FROM products WHERE price > 300;

EXPLAIN ANALYZE SELECT * FROM products WHERE price > 300;

CREATE INDEX idx_price ON products(price);

SET enable_seqscan = off;

EXPLAIN ANALYZE SELECT * FROM products WHERE price > 300;

SET enable_seqscan = on;

EXPLAIN ANALYZE SELECT o.order_id, c.first_name, c.last_name FROM orders o JOIN customers c ON o.customer_id = c.customer_id WHERE o.status = 'SHIPPED';

SELECT o.order_id, (SELECT COUNT (*) FROM order_items oi WHERE oi.order_id = o.order_id) AS itens FROM orders o WHERE o.status = 'DELIVERED';

SELECT o.order_id, COUNT (oi.order_id) AS itens FROM orders o LEFT JOIN order_items oi ON o.order_id = oi.order_id WHERE o.status = 'DELIVERED' GROUP BY o.order_id;

WITH soma_itens AS (SELECT order_id, SUM(quantity * unit_price) AS subtotal FROM order_items GROUP BY order_id) SELECT o.order_id, o.total_amount, si.subtotal FROM orders o JOIN soma_itens si ON si.order_id = o.order_id WHERE o.status = 'DELIVERED';

CREATE TABLE orders_part (order_id SERIAL PRIMARY KEY, customer_id INT, order_date DATE NOT NULL, status VARCHAR(20), total_amount NUMERIC(12, 2), PRIMARY KEY (order_date, order_id)) PARTITION BY RANGE (order_date);

CREATE TABLE orders_2024_01 PARTITION OF orders_part FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

CREATE TABLE orders_2024_02 PARTITION OF orders_part FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');

INSERT INTO orders_part (order_id, customer_id, order_date, status, total_amount) VALUES (250, 123, '2024-01-15', 'SHIPPED', 250.00);

INSERT INTO orders_part (order_id, customer_id, order_date, status, total_amount) VALUES (350, 123, '2024-02-15', 'SHIPPED', 250.00);

SELECT * FROM orders_part WHERE order_date BETWEEN '2024-01-01' AND '2024-01-31';

SELECT * FROM orders_part WHERE order_date BETWEEN '2024-02-01' AND '2024-02-28';

CREATE TABLE orders_part (order_id INT GENERATED ALWAYS AS IDENTITY, customer_id INT, status VARCHAR (20), order_date DATE, total_amount NUMERIC(12,2)) PARTITION BY LIST (status);

CREATE TABLE orders_shipped PARTITION OF orders_part FOR VALUES IN ('SHIPPED');

CREATE TABLE orders_delivered PARTITION OF orders_part FOR VALUES IN ('DELIVERED');

INSERT INTO orders_part (customer_id, status, order_date, total_amount) VALUES (123, 'SHIPPED', '2024-06-10', 150.00);

CREATE TABLE customers_part (customer_id INT PRIMARY KEY, name TEXT) PARTITION BY HASH (customer_id);

CREATE TABLE customers_part_0 PARTITION OF customers_part FOR VALUES WITH (MODULUS 4, REMAINDER 0);

CREATE TABLE customers_part_1 PARTITION OF customers_part FOR VALUES WITH (MODULUS 4, REMAINDER 1);

CREATE TABLE customers_part_2 PARTITION OF customers_part FOR VALUES WITH (MODULUS 4, REMAINDER 2);

CREATE TABLE customers_part_3 PARTITION OF customers_part FOR VALUES WITH (MODULUS 4, REMAINDER 3);

INSERT INTO customers_part (customer_id, name) VALUES (101, 'Alice');

SELECT * FROM customers_part;

CREATE TABLE orders_part (order_id INT GENERATED ALWAYS AS IDENTITY, status VARCHAR (20), customer_id INT) PARTITION BY LIST (status);

CREATE TABLE orders_pending PARTITION OF orders_part FOR VALUES IN ('PENDING');

CREATE TABLE orders_failed PARTITION OF orders_part FOR VALUES IN ('FAILED');

CREATE TABLE orders_default PARTITION OF orders_part DEFAULT;

INSERT INTO orders_part (status, customer_id) VALUES ('CANCELLED', 321);

SELECT * FROM orders_part;
