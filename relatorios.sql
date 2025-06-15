SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_orders FROM orders;
SELECT COUNT(*) AS total_items FROM order_items;
SELECT COUNT(*) AS total_categories FROM categories;

SELECT product_id, SUM(quantity) AS total_unidades_vendidas FROM order_items GROUP BY product_id ORDER BY SUM(quantity) DESC LIMIT 5;

SELECT DATE_TRUNC('month', order_date) AS mes_ano, SUM(total_amount) AS receita_total_mes FROM orders WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31' GROUP BY DATE_TRUNC('month', order_date) ORDER BY DATE_TRUNC('month', order_date);

SELECT customer_id, COUNT(order_id) AS total_compras FROM orders GROUP BY customer_id HAVING COUNT(order_id) > 0 ORDER BY COUNT(order_id) DESC;
