SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_orders FROM orders;
SELECT COUNT(*) AS total_items FROM order_items;
SELECT COUNT(*) AS total_categories FROM categories;

SELECT product_id, SUM(quantity) AS total_unidades_vendidas FROM order_items GROUP BY product_id ORDER BY SUM(quantity) DESC LIMIT 5;

SELECT DATE_TRUNC('month', order_date) AS mes_ano, SUM(total_amount) AS receita_total_mes FROM orders WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31' GROUP BY DATE_TRUNC('month', order_date) ORDER BY DATE_TRUNC('month', order_date);

SELECT customer_id, COUNT(order_id) AS total_compras FROM orders GROUP BY customer_id HAVING COUNT(order_id) > 0 ORDER BY COUNT(order_id) DESC;

SELECT product_id, SUM(quantity) AS total_jan_fev FROM order_items WHERE order_id IN (SELECT order_id FROM orders WHERE order_date BETWEEN '2024-01-01' AND '2024-02-29') GROUP BY product_id HAVING SUM(quantity) > 1 ORDER BY SUM(quantity) DESC;

SELECT order_id, customer_id, order_date, total_amount FROM orders WHERE status = 'SHIPPED' AND order_date BETWEEN '2024-03-01' AND '2024-03-31' ORDER BY total_amount DESC;

SELECT SUM(quantity) AS unidades_produto_10_fev FROM order_items WHERE product_id = 10 AND order_id IN (SELECT order_id FROM orders WHERE order_date BETWEEN '2024-02-01' AND '2024-02-29');

SELECT DATE_TRUNC('quarter', order_date) AS trimestre, SUM(total_amount) AS receita_trimestre FROM orders WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31' GROUP BY DATE_TRUNC('quarter', order_date) ORDER BY DATE_TRUNC('quarter', order_date);

SELECT DATE_TRUNC('month', order_date) AS mes_ano, AVG(total_amount) AS ticket_medio FROM orders WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31' GROUP BY DATE_TRUNC('month', order_date) ORDER BY DATE_TRUNC('month', order_date);

SELECT order_date, COUNT(order_id) SUM(total_amount) AS receita_diaria FROM orders WHERE order_date BETWEEN '2024-06-01' AND '2024-06-07' GROUP BY order_date ORDER BY order_date;
