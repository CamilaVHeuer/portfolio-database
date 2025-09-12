-- ====================================================================
-- Procedure to calculate the total of an order given its ID
-- Parameters:
-- IN order_id INT: Order ID (input)
-- OUT total DECIMAL(10,2): Order total (output)
-- ====================================================================
DELIMITER /
/

CREATE PROCEDURE calculate_order_total(
    IN order_id INT,
    OUT total DECIMAL(10,2)
)
BEGIN
    -- Calculate the total by summing quantity * price of the order's products
    SELECT SUM(od.quantity * p.price)
    INTO total
    FROM order_details od
    JOIN products p ON od.product_id = p.product_id
    WHERE od.order_id = order_id;
END
/
/

DELIMITER;

-- ====================================================================
-- Basic example of procedure call
-- ====================================================================

-- Call the procedure and save the result in a user variable for later use
CALL calculate_order_total (1, @order_total);

-- Query the calculated value
SELECT @order_total;

-- ====================================================================
-- Advanced example of procedure usage: integration with other queries
-- ====================================================================

-- Suppose we want to get the total of all orders made by a specific customer
-- Call the procedure
CALL calculate_order_total (1, @order_total);

-- Use the result to compare with payments, generate reports, etc.
SELECT
    customer_id,
    @order_total AS expected_total
FROM orders
WHERE
    order_id = 1;

-- ====================================================================
-- OPTIONAL: Create an order reports table.
-- Example of integration with a reports table
--===================================================================
-- IMPORTANT: the creation of this table is optional.
-- If used, it should be in the structure script (e.g: create_tables.sql).
-- Here it's only shown as an example of integration with the procedure.
-- The table allows having a history of totals without needing to recalculate each time
-- A trigger could be added that updates this table every time an order is inserted or updated (this is not yet implemented, it's in the learning process).
CREATE TABLE IF NOT EXISTS order_reports (
    order_id INT PRIMARY KEY,
    total_amount DECIMAL(10, 2)
);

-- Call the procedure and save the result in the reports table
CALL calculate_order_total (2, @order_total);

INSERT INTO
    order_reports (order_id, total_amount)
VALUES (2, @order_total)
ON DUPLICATE KEY UPDATE
    total_amount = @order_total;
-- NOTE: if you want to automatically save the total in the order_reports table,
-- the INSERT logic can be integrated within the procedure.
-- DECISION: here we leave it separate for greater clarity and flexibility.

-- Query the reports table
SELECT * FROM order_reports;

-- ====================================================================
-- Procedure to insert a new order through a shopping cart:
-- The procedure inserts a new order in "orders".
-- And then inserts the product lines in "order_details".
-- Using the previously created procedure, we calculate the order total.
--===================================================================

-- Create a temporary table to simulate a shopping cart
CREATE TABLE IF NOT EXISTS cart (
    customer_id INT,
    product_id INT,
    quantity INT
);
-- Insert products to the cart for customer 1

INSERT INTO
    cart (
        customer_id,
        product_id,
        quantity
    )
VALUES (1, 1, 1),
    (1, 2, 2),
    (1, 5, 1);

-- Create the procedure to insert an order from the cart. The procedure:
-- Creates an order in orders.
-- Copies all products from that customer's cart to order_details.
-- Calculates the total and saves it in order_reports.
-- Clears the customer's cart.

DELIMITER /
/

CREATE PROCEDURE insert_order_from_cart (IN o_customer_id INT)
BEGIN
    DECLARE new_order_id INT;

    -- Create a new order
    INSERT INTO orders (customer_id, date)
    VALUES (o_customer_id, NOW());

    SET new_order_id = LAST_INSERT_ID();

    -- Copy products from cart to order_details
    INSERT INTO order_details (order_id, product_id, quantity)
    SELECT new_order_id, product_id, quantity
    FROM cart
    WHERE customer_id = o_customer_id;

    -- Calculate the total and save it in order_reports
    CALL calculate_order_total (new_order_id, @order_total);
    INSERT INTO order_reports (order_id, total_amount)
    VALUES (new_order_id, @order_total)
    ON DUPLICATE KEY UPDATE total_amount = @order_total;

    -- Clear the customer's cart
    DELETE FROM cart WHERE customer_id = o_customer_id;
END
/
/

DELIMITER;

-- Call the procedure to insert an order from customer 1's cart
CALL insert_order_from_cart (1);

-- ===================================================================
-- Procedure + transaction for order creation through a shopping cart:
-- This version includes stock validation and update.
-- If any product has insufficient stock, the entire operation is rolled back.
-- ===================================================================
DELIMITER /
/

CREATE PROCEDURE insert_order_from_cart_2 (IN o_customer_id INT)
BEGIN
    DECLARE new_order_id INT;
    DECLARE insufficient_stock INT DEFAULT 0;

    -- Handler: if there's an SQL error → rollback
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    -- 1. Create new order
    INSERT INTO orders (customer_id, date)
    VALUES (o_customer_id, NOW());
    SET new_order_id = LAST_INSERT_ID();

    -- 2. Check stock product by product (and lock row with FOR UPDATE)
    SELECT COUNT(*) INTO insufficient_stock
    FROM cart c
    JOIN products p ON c.product_id = p.product_id
    WHERE c.customer_id = o_customer_id
      AND c.quantity > p.stock
    FOR UPDATE;

    IF insufficient_stock > 0 THEN
        -- If any product doesn't have sufficient stock → rollback
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock for one or more products';
    END IF;

    -- 3. Update stock for each product
    UPDATE products p
    JOIN cart c ON p.product_id = c.product_id
    SET p.stock = p.stock - c.quantity
    WHERE c.customer_id = o_customer_id;

    -- 4. Insert order details
    INSERT INTO order_details (order_id, product_id, quantity)
    SELECT new_order_id, product_id, quantity
    FROM cart
    WHERE customer_id = o_customer_id;

    -- 5. Calculate total and save in reports.
    -- We use the previously created procedure to calculate the total.
    CALL calculate_order_total(new_order_id, @order_total);

    -- Save the total in order_reports
    INSERT INTO order_reports (order_id, total_amount)
    VALUES (new_order_id, @order_total)
    ON DUPLICATE KEY UPDATE total_amount = @order_total;

    -- 6. Clear cart
    DELETE FROM cart WHERE customer_id = o_customer_id;

    COMMIT;
END
/
/

DELIMITER;

-- ===================================================================
-- Example usage of the insert_order_from_cart_2 procedure
-- ===================================================================
-- First, we need to add products to the cart for a customer
-- (in a real application, this would be done through the application logic)
-- Here we simulate adding products to the cart for customer 2

-- Insert products into the cart for customer 2
INSERT INTO
    cart (
        customer_id,
        product_id,
        quantity
    )
VALUES (2, 5, 1),
    (2, 6, 2),
    (2, 7, 1);

-- Call the procedure to insert an order from customer 2's cart
CALL insert_order_from_cart_2 (2);

-- ===================================================================
-- Example usage of the insert_order_from_cart_2 procedure and
-- verifying that the order cannot be placed if there's no stock
-- ===================================================================
INSERT INTO
    cart (
        customer_id,
        product_id,
        quantity
    )
VALUES (3, 2, 10),
    (3, 8, 10),
    (3, 7, 1);

CALL insert_order_from_cart_2 (3);
-- We see that the order was not placed because there's insufficient stock.
-- Regarding the error: in phpMyAdmin the error message is not visible but it tells us that MySQL has returned an empty result set (i.e.: zero columns), which indicates that an error has occurred.

--===================================================================
-- Procedure to insert a new order through a shopping cart and
-- updating the stock through the trigger:
-- This version uses the trigger defined in triggers.sql to update stock automatically.
--===================================================================
DELIMITER /
/

CREATE PROCEDURE insert_order_from_cart_3 (IN o_customer_id INT)
BEGIN
    DECLARE new_order_id INT;
    DECLARE insufficient_stock INT DEFAULT 0;

    -- Handler: if there's an SQL error → rollback
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    -- 1. Create new order
    INSERT INTO orders (customer_id, date)
    VALUES (o_customer_id, NOW());
    SET new_order_id = LAST_INSERT_ID();

    -- 2. Check stock product by product (and lock row with FOR UPDATE)
    SELECT COUNT(*) INTO insufficient_stock
    FROM cart c
    JOIN products p ON c.product_id = p.product_id
    WHERE c.customer_id = o_customer_id
      AND c.quantity > p.stock
    FOR UPDATE;

    IF insufficient_stock > 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient stock for one or more products';
    END IF;

    -- 3. Insert order details
    -- (the trigger will update stock automatically)
    INSERT INTO order_details (order_id, product_id, quantity)
    SELECT new_order_id, product_id, quantity
    FROM cart
    WHERE customer_id = o_customer_id;

    -- 4. Calculate total and save in reports
    CALL calculate_order_total(new_order_id, @order_total);

    INSERT INTO order_reports (order_id, total_amount)
    VALUES (new_order_id, @order_total)
    ON DUPLICATE KEY UPDATE total_amount = @order_total;

    -- 5. Clear cart
    DELETE FROM cart WHERE customer_id = o_customer_id;

    COMMIT;
END
/
/

DELIMITER;
-- ===================================================================
-- Example usage of the insert_order_from_cart_3 procedure
-- ===================================================================
-- First, we need to add products to the cart for a customer
-- (in a real application, this would be done through the application logic)
-- Here we simulate adding products to the cart for customer 3
-- Insert products into the cart for customer 3
INSERT INTO
    cart (
        customer_id,
        product_id,
        quantity
    )
VALUES (5, 1, 1),
    (5, 3, 2),
    (5, 8, 1);
-- Call the procedure to insert an order from customer 5's cart
CALL insert_order_from_cart_3 (5);
-- Check that the order was created correctly and that the stock was updated automatically thanks to the trigger.
SELECT * FROM orders WHERE customer_id = 5;

SELECT * FROM order_details;

SELECT * FROM products WHERE product_id IN (1, 3, 8);

-- Check that the cart is clean
SELECT * FROM cart;

-- IMPORTANT: after creating this procedure, the insert_order_from_cart_2 procedure can be deleted
-- since the insert_order_from_cart_3 procedure is an improved version that uses the trigger to update stock automatically.
-- Also, if we use the insert_order_from_cart_2 procedure with the trigger, the stock will be decremented twice. Don't mix the logics.
--=============================================================================================

DROP PROCEDURE IF EXISTS insert_order_from_cart_2;