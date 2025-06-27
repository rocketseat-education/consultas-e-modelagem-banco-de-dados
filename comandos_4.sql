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
