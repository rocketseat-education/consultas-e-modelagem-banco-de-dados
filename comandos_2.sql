SELECT o.order_id, o.customer_id, o.order_date, o.total_amount FROM orders AS o WHERE o.customer_id IN (SELECT c.customer_id FROM customers AS c WHERE c.city = 'Sao Paulo') ORDER BY o.order_date;

SELECT * FROM customers WHERE city = 'Sao Paulo';

SELECT c.customer_id, c.first_name, c.last_name FROM customers c WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id AND o.status = 'DELIVERED') ORDER BY c.customer_id;

SELECT * FROM orders o;

SELECT p.product_id, p.product_name FROM products p WHERE NOT EXISTS (SELECT 1 FROM order_items oi WHERE oi.product_id = p.product_id) ORDER BY p.product_id;

