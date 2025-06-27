SELECT first_name, last_name FROM customers WHERE customer_id IN (SELECT customer_id FROM orders);

SELECT product_name, price FROM products WHERE price > (SELECT AVG(price) FROM products);

SELECT order_id, total_amount FROM orders WHERE total_amount = (SELECT MAX(total_amount) FROM orders);

SELECT product_id, product_name FROM products p WHERE EXISTS (SELECT 1 FROM order_items oi WHERE oi.product_id = p.product_id);

SELECT product_name, price, (SELECT AVG(price) FROM products p2 WHERE p2.category_id = p1.category_id) AS media_categoria FROM products p1;
