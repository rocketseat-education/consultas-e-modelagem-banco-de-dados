CREATE VIEW vw_produtos_caros AS SELECT p.product_id, p.product_name, c.category_name, p.price FROM products p JOIN categories c ON p.category_id = c.category_id WHERE p.price > 200;

SELECT * FROM vw_produtos_caros ORDER BY price DESC LIMIT 10;

DROP VIEW IF EXISTS vw_produtos_caros;
