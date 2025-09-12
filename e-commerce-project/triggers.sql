-- Active: 1754829977405@@127.0.0.1@3306@ecommerce_db
-- ==========================================================
-- TRIGGER: update stock after inserting into order_details
-- Every time an order detail is inserted,
-- the product stock is automat    customer_id = 1
AND address_id = 1;

-- 3. Delete that address
DELETE FROM customer_addresses
WHERE
    customer_id = 1
    AND address_id = 1;
-- NOTE: it's important to apply the filter (WHERE) for both customer_id and address_id since the same customer can have multiple addresses.

-- 4. Check the audit log
SELECT * FROM customer_addresses_audit;

-- CLEAN THE AUDIT TABLE AFTER TESTS:
TRUNCATE TABLE customer_addresses_audit;
-- To see the triggers created for the customer_addresses table:
SHOW TRIGGERS LIKE 'customer_addresses';

d.
-- ==========================================================

DELIMITER /
/

CREATE TRIGGER trg_update_stock
AFTER INSERT ON order_details
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END
/
/

DELIMITER;

-- Test it step by step:
-- 1. View current stock for product with product_id = 999
SELECT product_id, stock FROM products WHERE product_id = 999;

-- 2. Insert a new order detail (simulating a purchase)
INSERT INTO
    order_details (
        order_id,
        product_id,
        quantity
    )
VALUES (1, 999, 2);

-- 3. Check the stock after insertion
SELECT product_id, stock FROM products WHERE product_id = 999;

-- We see that the stock was automatically decremented thanks to the trigger, without writing a manual UPDATE.
-- IMPORTANT: If an order detail is inserted with a quantity greater than available stock,
-- the stock can become negative. In a real case, validation should be done before inserting.

-- ===============================================================
-- CUSTOMER CHANGE AUDIT
-- Note: in a real environment, the customers_audit table should
-- be created in the main structure (schema), not in this file.
-- ===============================================================
CREATE TABLE IF NOT EXISTS customers_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    action_type ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    old_first_name VARCHAR(100),
    new_first_name VARCHAR(100),
    old_last_name VARCHAR(100),
    new_last_name VARCHAR(100),
    old_email VARCHAR(100),
    new_email VARCHAR(100),
    old_country VARCHAR(100),
    new_country VARCHAR(100),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    changed_by VARCHAR(100) DEFAULT USER ()
);
-- TRIGGER FOR INSERT
CREATE TRIGGER trg_customers_insert
AFTER INSERT ON customers
FOR EACH ROW
INSERT INTO customers_audit (customer_id, action_type, new_first_name, new_last_name, new_email, new_country)
VALUES (NEW.customer_id, 'INSERT', NEW.first_name, NEW.last_name, NEW.email, NEW.country);

-- TRIGGER FOR UPDATE
CREATE TRIGGER trg_customers_update
AFTER UPDATE ON customers
FOR EACH ROW
INSERT INTO customers_audit (customer_id, action_type,
                             old_first_name, new_first_name,
                             old_last_name, new_last_name,
                             old_email, new_email, old_country, new_country)
VALUES (OLD.customer_id, 'UPDATE',
        OLD.first_name, NEW.first_name,
        OLD.last_name, NEW.last_name,
        OLD.email, NEW.email, OLD.country, NEW.country);

-- TRIGGER FOR DELETE
CREATE TRIGGER trg_customers_delete
AFTER DELETE ON customers
FOR EACH ROW
INSERT INTO customers_audit (customer_id, action_type,
                             old_first_name, old_last_name, old_email, old_country)
VALUES (OLD.customer_id, 'DELETE',
        OLD.first_name, OLD.last_name, OLD.email, OLD.country);

-- TEST EXAMPLES:
-- 1. Insert a new customer
INSERT INTO
    customers (
        first_name,
        last_name,
        email,
        country
    )
VALUES (
        'Lara',
        'Villa',
        'lari@mail.com',
        'Argentina'
    );
-- 2. Update that new customer
UPDATE customers
SET
    email = 'lara_1vh@mail.com',
    country = 'Argentina'
WHERE
    first_name = 'Lara'
    and last_name = 'Villa';
-- 3. Delete it
DELETE FROM customers
WHERE
    first_name = 'Lara'
    and last_name = 'Villa';

-- 4. Check the audit log
SELECT * FROM customers_audit;

-- CLEAN THE AUDIT TABLE AFTER TESTS:
TRUNCATE TABLE customers_audit;

-- To see the triggers created for the customers table:
SHOW TRIGGERS LIKE 'customers';

-- ==========================================================
-- CUSTOMER ADDRESSES CHANGE AUDIT
-- Note: in a real environment, the addresses_audit table should
-- be created in the main structure (schema), not in this file.
-- ===========================================================
CREATE TABLE customer_addresses_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    address_id INT NOT NULL,
    customer_id INT NOT NULL,
    action_type ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    old_address_line VARCHAR(255),
    old_city VARCHAR(100),
    old_state VARCHAR(100),
    old_postal_code VARCHAR(20),
    old_country VARCHAR(100),
    new_address_line VARCHAR(255),
    new_city VARCHAR(100),
    new_state VARCHAR(100),
    new_postal_code VARCHAR(20),
    new_country VARCHAR(100),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TRIGGER FOR INSERT
DELIMITER /
/

CREATE TRIGGER trg_customer_address_insert
AFTER INSERT ON customer_addresses
FOR EACH ROW
BEGIN
    INSERT INTO customer_addresses_audit (
        address_id, customer_id, action_type,
        new_address_line, new_city, new_state, new_postal_code, new_country
    ) VALUES (
        NEW.address_id, NEW.customer_id, 'INSERT',
        NEW.address_line, NEW.city, NEW.state, NEW.postal_code, NEW.country
    );
END;
/
/

DELIMITER;

-- TRIGGER FOR UPDATE
DELIMITER /
/

CREATE TRIGGER trg_customer_address_update
AFTER UPDATE ON customer_addresses
FOR EACH ROW
BEGIN
    INSERT INTO customer_addresses_audit (
        address_id, customer_id, action_type,
        old_address_line, old_city, old_state, old_postal_code, old_country,
        new_address_line, new_city, new_state, new_postal_code, new_country
    ) VALUES (
        OLD.address_id, OLD.customer_id, 'UPDATE',
        OLD.address_line, OLD.city, OLD.state, OLD.postal_code, OLD.country,
        NEW.address_line, NEW.city, NEW.state, NEW.postal_code, NEW.country
    );
END;
/
/

DELIMITER;

-- TRIGGER FOR DELETE
DELIMITER /
/

CREATE TRIGGER trg_customer_address_delete
AFTER DELETE ON customer_addresses
FOR EACH ROW
BEGIN
    INSERT INTO customer_addresses_audit (
        address_id, customer_id, action_type,
        old_address_line, old_city, old_state, old_postal_code, old_country
    ) VALUES (
        OLD.address_id, OLD.customer_id, 'DELETE',
        OLD.address_line, OLD.city, OLD.state, OLD.postal_code, OLD.country
    );
END;
/
/

DELIMITER;

-- TEST EXAMPLES:
-- 1. Insert a new address for an existing customer (customer_id = 1)
INSERT INTO
    customer_addresses (
        customer_id,
        address_line,
        city,
        state,
        postal_code,
        country,
        is_default
    )
VALUES (
        1,
        '123 Av. Belgrano',
        'CABA',
        'CABA',
        '1209',
        'Argentina',
        1
    );

-- 2. Update that address
UPDATE customer_addresses
SET
    address_line = '456 Calle Falsa',
    city = 'Puerto Rico',
    state = 'Misiones',
    postal_code = '3334',
    country = 'Argentina',
    is_default = 1
WHERE
    customer_id = 1
    AND address_id = 1;

-- 3. Eliminar esa dirección
DELETE FROM customer_addresses
WHERE
    customer_id = 1
    AND address_id = 1;
--NOTA: es importante aplicar el filtro (WHERE) tanto por customer_id como por address_id ya que un mismo customer puede tener varias direcciones.

-- 4. Revisar el log de auditoría
SELECT * FROM customer_addresses_audit;

-- LIMPIAR LA TABLA DE AUDITORÍA TRAS LAS PRUEBAS:
TRUNCATE TABLE customer_addresses_audit;
-- Para ver los triggers creados para la tabla customer_addresses:
SHOW TRIGGERS LIKE 'customer_addresses';