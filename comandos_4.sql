EXPLAIN ANALYZE SELECT * FROM products WHERE price BETWEEN 100 AND 200;

CREATE INDEX idx_products_price ON products(price);
