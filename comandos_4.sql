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
