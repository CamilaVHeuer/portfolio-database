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