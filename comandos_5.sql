CREATE VIEW vw_produtos_caros AS SELECT p.product_id, p.product_name, c.category_name, p.price FROM products p JOIN categories c ON p.category_id = c.category_id WHERE p.price > 200;

SELECT * FROM vw_produtos_caros ORDER BY price DESC LIMIT 10;

DROP VIEW IF EXISTS vw_produtos_caros;

CREATE VIEW vw_pedidos_grandes AS SELECT o.order_id, o.total_amount, c.first_name || ' ' || c.last_name AS nome_cliente, c.city FROM orders o JOIN customers c ON o.customer_id = c.customer_id WHERE o.total_amount > 500;

SELECT * FROM vw_pedidos_grandes ORDER BY total_amount DESC;

CREATE VIEW vw_resumo_vendas_mensal AS SELECT date_trunc('month', o.order_date) AS mes, COUNT(o.order_id) AS total_pedidos, SUM(o.total_amount) AS valor_total FROM orders o GROUP BY 1;

SELECT * FROM vw_resumo_vendas_mensal WHERE mes = '2024-05-01';

CREATE VIEW vw_itens_pedido_detalhado AS SELECT o.order_id, p.product_name, oi.quantity, oi.unit_price, (oi.quantity * oi.unit_price) AS subtotal, o.order_date FROM order_items oi JOIN orders o ON oi.order_id = o.order_id JOIN products p ON oi.product_id = p.product_id;

SELECT viewname FROM pg_views WHERE schemaname = 'public';

CREATE MATERIALIZED VIEW mv_resumo_vendas_mensal AS SELECT date_trunc('month', o.order_date) AS mes, COUNT (o.order_id) AS total_pedidos, SUM(o.total_amount) AS valor_total FROM orders o GROUP BY 1;

SELECT * FROM mv_resumo_vendas_mensal;

REFRESH MATERIALIZED VIEW mv_resumo_vendas_mensal;

CREATE INDEX idx_mv_vendas_mes ON mv_resumo_vendas_mensal(mes);

SELECT * FROM mv_resumo_vendas_mensal WHERE mes BETWEEN '2024-01-01' AND '2024-06-01';

CREATE MATERIALIZED VIEW mv_top_clientes_2024 AS SELECT c.customer_id, c.first_name || ' ' || c.last_name AS nome_completo, SUM(o.total_amount) AS total_gasto FROM customers c JOIN orders o ON c.customer_id = o.customer_id WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31' GROUP BY c.customer_id, c.first_name, c.last_name HAVING SUM(o.total_amount) > 500;

CREATE TEMPORARY TABLE tmp_pedidos_junho AS SELECT * FROM orders WHERE order_date BETWEEN '2024-06-01' AND '2024-06-30';

CREATE TEMPORARY TABLE tmp_clientes_ativos AS SELECT DISTINCT c.customer_id, c.first_name || ' ' || c.last_name AS nome_completo FROM customers c JOIN orders o ON c.customer_id = o.customer_id WHERE o.order_date BETWEEN '2024-04-01' AND '2024-06-30';

SELECT t.nome_completo, COUNT(o.order_id) AS total_pedidos FROM tmp_clientes_ativos t JOIN orders o ON t.customer_id = o.customer_id GROUP BY t.nome_completo ORDER BY total_pedidos DESC;

CREATE TEMPORARY TABLE tmp_vendas_2024 AS SELECT * FROM orders WHERE order_date >= '2024-01-01';

CREATE VIEW vw_summary_2024 AS SELECT date_trunc('quarter', order_date) AS trimestre, COUNT (*) AS qtd_pedidos, SUM(total_amount) AS total_vendas FROM tmp_vendas_2024 GROUP BY 1;

SELECT * FROM vw_summary_2024 ORDER BY trimestre;

CREATE OR REPLACE FUNCTION fn_fullname(c_id INT) RETURNS TEXT AS $$ DECLARE v_first VARCHAR; v_last VARCHAR; BEGIN SELECT first_name, last_name INTO v_first, v_last FROM customers WHERE customer_id = c_id; RETURN v_first || ' ' || v_last; END; $$ LANGUAGE plpgsql;

SELECT fn_fullname(42) AS nome_completo;

CREATE OR REPLACE FUNCTION fn_order_total(o_id INT) RETURNS NUMERIC AS $$ DECLARE v_total NUMERIC; BEGIN SELECT SUM(quantity * unit_price) INTO v_total FROM order_items WHERE order_id = o_id; RETURN COALESCE(v_total, 0); END; $$ LANGUAGE plpgsql;

SELECT fn_order_total(496) AS total_pedido;

CREATE OR REPLACE FUNCTION fn_order_items(o_id INT) RETURNS TABLE(product_name VARCHAR, qty INT, subtotal NUMERIC) AS $$ BEGIN RETURN QUERY SELECT p.product_name, oi.quantity, oi.quantity * oi.unit_price AS subtotal FROM order_items oi JOIN products p ON p.product_id = oi.product_id WHERE oi.order_id = o_id; END; $$ LANGUAGE plpgsql;

SELECT * FROM fn_order_items(496);

CREATE OR REPLACE FUNCTION fn_get_customer_email(c_id INT) RETURNS TEXT AS $$ DECLARE v_email TEXT; BEGIN SELECT email INTO v_email FROM customers WHERE customer_id = c_id; IF v_email IS NULL THEN RAISE EXCEPTION 'Cliente % nao foi encontrado ou sem e-mail', c_id; END IF; RETURN v_email; EXCEPTION WHEN OTHERS THEN RETURN 'no-reply@exemplo.com'; END; $$ LANGUAGE plpgsql SECURITY DEFINER;

SELECT fn_get_customer_email (6) AS email_customer;

CREATE OR REPLACE FUNCTION fn_add_customer(p_first VARCHAR, p_last VARCHAR, p_email VARCHAR, p_city VARCHAR) RETURNS INT AS $$ DECLARE v_id INT; BEGIN INSERT INTO customers (first_name, last_name, email, city, created_at) VALUES (p_first, p_last, p_email, p_city, NOW()) RETURNING customer_id INTO v_id; RETURN v_id; END; $$ LANGUAGE plpgsql;

SELECT fn_add_customer('Ana', 'Silva', 'ana123@exemplo.com', 'Porto Alegre');

CREATE OR REPLACE FUNCTION fn_update_email(c_id INT, novo_email TEXT) RETURNS BOOLEAN AS $$ BEGIN UPDATE customers SET email = novo_email WHERE customer_id = c_id; IF FOUND THEN RETURN TRUE; ELSE RETURN FALSE; END IF; END; $$ LANGUAGE plpgsql;

SELECT fn_update_email (202, 'ana123@teste.com') AS result;

CREATE OR REPLACE FUNCTION fn_delete_customer(c_id INT) RETURNS TEXT AS $$ BEGIN IF EXISTS (SELECT 1 FROM orders WHERE customer_id = c_id) THEN RETURN 'Erro: cliente possui pedidos.'; ELSE DELETE FROM customers WHERE customer_id = c_id; RETURN 'Cliente excluído com sucesso.'; END IF; END; $$ LANGUAGE plpgsql;

SELECT fn_delete_customer (202) AS result;

CREATE OR REPLACE FUNCTION fn_create_order(p_customer_id INT, p_items JSON) RETURNS TEXT AS $$ DECLARE v_order_id INT; v_item JSON; BEGIN INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES (p_customer_id, NOW(), 'PENDING', 0) RETURNING order_id INTO v_order_id; FOR v_item IN SELECT * FROM json_array_elements(p_items) LOOP INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES (v_order_id, (v_item->>'product_id') :: INT, (v_item->>'quantity') :: INT, (v_item->>'unit_price') :: NUMERIC); END LOOP; RETURN FORMAT('Pedido %s criado com sucesso.', v_order_id); EXCEPTION WHEN OTHERS THEN RAISE NOTICE 'Erro ao criar pedido. Revertendo ... '; RAISE; END; $$ LANGUAGE plpgsql;

SELECT fn_create_order(2, '[{"product_id": 97, "quantity": 2, "unit_price": 10.50}, {"product_id": 98, "quantity": 1, "unit_price": 5.00}, {"product_id": 99, "quantity": 4, "unit_price": 2.25}]' :: json ) AS resultado;

CREATE TABLE orders_audit (audit_id SERIAL PRIMARY KEY, order_id INT, action VARCHAR(10), action_time TIMESTAMP);

CREATE OR REPLACE FUNCTION tg_audit_order() RETURNS TRIGGER AS $$ BEGIN INSERT INTO orders_audit(order_id, action, action_time) VALUES (COALESCE(NEW.order_id, OLD.order_id), TG_OP, NOW()); RETURN NEW; END; $$ LANGUAGE plpgsql;

CREATE TRIGGER trg_order_audit AFTER INSERT OR UPDATE OR DELETE ON orders FOR EACH ROW EXECUTE FUNCTION tg_audit_order();

UPDATE orders SET status = 'SHIPPED' WHERE order_id = 5;

SELECT * FROM orders_audit WHERE order_id = 5;

CREATE OR REPLACE FUNCTION tg_validate_product_price() RETURNS TRIGGER AS $$ BEGIN IF NEW.price < 0 THEN RAISE EXCEPTION 'Preço não pode ser negativo. Valor informado: %', NEW.price; END IF; RETURN NEW; END; $$ LANGUAGE plpgsql; 

CREATE TRIGGER trg_validate_price BEFORE INSERT OR UPDATE ON products FOR EACH ROW EXECUTE FUNCTION tg_validate_product_price();

INSERT INTO products (product_name, category_id, price) VALUES ('Teste Trigger', 9, 20);

SELECT setval(pg_get_serial_sequence('products','product_id'), (SELECT COALESCE(MAX(product_id),0) FROM products) + 1);

CREATE TABLE products_audit (product_audit_id SERIAL PRIMARY KEY, product_id INTEGER, action VARCHAR (10), action_time TIMESTAMP);

CREATE OR REPLACE FUNCTION fn_log_product_change(p_id INT, action TEXT) RETURNS VOID AS $$ BEGIN INSERT INTO products_audit(product_id, action, action_time) VALUES (p_id, action, NOW()); END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_notify_change() RETURNS VOID AS $$ BEGIN RAISE NOTICE 'Notificação: produto alterado.'; END; $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION tg_product_chain() RETURNS TRIGGER AS $$ BEGIN PERFORM fn_log_product_change(NEW.product_id, TG_OP); PERFORM fn_notify_change(); RETURN NEW; END; $$ LANGUAGE plpgsql;

CREATE TRIGGER trg_product_chain AFTER UPDATE ON products FOR EACH ROW EXECUTE FUNCTION tg_product_chain();

UPDATE products SET product_name = 'Teste Trigger 123' WHERE product_id = 102;

CREATE TABLE customers_audit (audit_id SERIAL PRIMARY KEY, customer_id INT, changed_by TEXT, changed_at TIMESTAMP, action TEXT, field_name TEXT, old_value TEXT, new_value TEXT);

CREATE OR REPLACE FUNCTION tg_audit_customer_changes() RETURNS TRIGGER AS $$ BEGIN IF TG_OP = 'UPDATE' THEN IF OLD.first_name IS DISTINCT FROM NEW.first_name THEN INSERT INTO customers_audit(customer_id, changed_by, changed_at, action, field_name, old_value, new_value) VALUES (OLD.customer_id, current_user, NOW(), TG_OP, 'first_name', OLD.first_name, NEW.first_name); END IF; IF OLD.city IS DISTINCT FROM NEW.city THEN INSERT INTO customers_audit(customer_id, changed_by, changed_at, action, field_name, old_value, new_value) VALUES (OLD.customer_id, current_user, NOW(), TG_OP, 'city', OLD.city, NEW.city); END IF; END IF; RETURN NEW; END; $$ LANGUAGE plpgsql;

CREATE TRIGGER trg_customer_audit AFTER UPDATE ON customers FOR EACH ROW EXECUTE FUNCTION tg_audit_customer_changes();

UPDATE customers SET first_name = 'Felipe' WHERE customer_id = 1;

UPDATE customers SET first_name = 'Felipe Teste', city = 'Rio de Janeiro' WHERE customer_id = 1;

CREATE OR REPLACE PROCEDURE sp_update_product_price(p_product_id INT, p_new_price NUMERIC) LANGUAGE plpgsql AS $$ BEGIN UPDATE products SET price = p_new_price WHERE product_id = p_product_id; IF NOT FOUND THEN RAISE EXCEPTION 'Produto % nao existe', p_product_id; END IF; END; $$;

CALL sp_update_product_price(42, 199.90);

CREATE OR REPLACE PROCEDURE sp_cancel_order(p_order_id INT) LANGUAGE plpgsql AS $$ BEGIN DELETE FROM order_items WHERE order_id = p_order_id; DELETE FROM orders WHERE order_id = p_order_id; IF NOT FOUND THEN RAISE NOTICE 'Pedido % nao encontrado', p_order_id; ELSE RAISE NOTICE 'Pedido % e itens removidos', p_order_id; END IF; END; $$;

CALL sp_cancel_order(499);

CREATE OR REPLACE PROCEDURE sp_order_summary(IN p_order_id INT, OUT p_customer_id INT, OUT p_total_amount NUMERIC) LANGUAGE plpgsql AS $$ BEGIN SELECT customer_id, total_amount INTO p_customer_id, p_total_amount FROM orders WHERE order_id = p_order_id; END; $$;

DO $$ DECLARE cust_id INT; tot NUMERIC; BEGIN CALL sp_order_summary(5, cust_id, tot); RAISE NOTICE 'Cliente: %, Total: %', cust_id, tot; END; $$;

CREATE OR REPLACE PROCEDURE sp_increment_counter (INOUT ct INT) LANGUAGE plpgsql AS $$ BEGIN ct := ct + 1; END $$;

DO $$ DECLARE C INT := 10; BEGIN CALL sp_increment_counter(c); RAISE NOTICE 'Novo valor: %', c; END; $$;

BEGIN; UPDATE products SET price = price * 0.9 WHERE category_id = 3;  UPDATE orders SET total_amount = total_amount + 50 WHERE order_id = 496;  COMMIT;

BEGIN; INSERT INTO orders(customer_id, order_date, status, total_amount) VALUES (2, CURRENT_DATE, 'PENDING', 200.00); SAVEPOINT my_savepoint; INSERT INTO orders(customer_id, order_date, status, total_amount) VALUES (3, CURRENT_DATE, 'PENDING', 200.00); ROLLBACK TO my_savepoint; INSERT INTO orders(customer_id, order_date, status, total_amount) VALUES (4, CURRENT_DATE, 'PENDING', 200.00); COMMIT;

DO $$ DECLARE v_order_id INTEGER; BEGIN BEGIN INSERT INTO orders(customer_id, order_date, status, total_amount) VALUES (2, CURRENT_DATE, 'PENDING', 200.00) RETURNING order_id INTO v_order_id; RAISE NOTICE 'Pedido 1 inserido com ID %', v_order_id; INSERT INTO orders(customer_id, order_date, status, total_amount) VALUES (3, CURRENT_DATE, 'PENDING', 200.00); INSERT INTO orders(customer_id, order_date, status, total_amount) RAISE NOTICE 'Todos os pedidos inseridos com sucesso.'; EXCEPTION WHEN OTHERS THEN RAISE WARNING 'Erro ao inserir pedidos: %, revertendo todos os INSERTs', SQLERRM; RETURN; END; END; $$ LANGUAGE plpgsql;

SELECT pid, relation: : regclass, mode, granted FROM pg_locks WHERE NOT granted;

SELECT pid, xact_start, query FROM pg_stat_activity WHERE state = 'active';

BEGIN; LOCK TABLE orders IN SHARE ROW EXCLUSIVE MODE; COMMIT;

DO $$ DECLARE tentativa INT := 0; BEGIN LOOP BEGIN tentativa := tentativa + 1; BEGIN UPDATE products SET stock = stock - 1 WHERE product_id = 1; COMMIT; EXIT; EXCEPTION WHEN serialization_failure OR deadlock_detected THEN RAISE NOTICE 'Tentativa % falhou, tentando novamente ... ', tentativa; ROLLBACK; PERFORM pg_sleep(0.5); IF tentativa > 5 THEN RAISE EXCEPTION 'Limite de tentativas excedido.'; END IF; END; END;
