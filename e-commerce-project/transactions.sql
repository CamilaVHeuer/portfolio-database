-- ==================================================================
-- Transaction: new order creation with stock update
-- This transaction inserts a new order and updates the stock of the product.
-- If the product stock is insufficient, the transaction will be rolled back.
-- Ensure that the database and tables are created before running this transaction.
-- ==================================================================
START TRANSACTION;

-- 1. Check current stock
SELECT stock FROM products WHERE product_id = 2 FOR UPDATE;

-- (this SELECT with FOR UPDATE "locks" the row until the transaction ends
--  so another user cannot modify it in the meantime)

-- 2. Insert order
INSERT INTO orders (customer_id, date) VALUES (1, CURRENT_DATE);

-- 3. Insert order detail
INSERT INTO
    order_details (
        order_id,
        product_id,
        quantity
    )
VALUES (LAST_INSERT_ID(), 2, 3);

-- 4. Update stock
UPDATE products
SET
    stock = stock - 3
WHERE
    product_id = 2
    AND stock >= 3;

-- 5. Validate that the stock was actually reduced
SELECT stock FROM products WHERE product_id = 2;

-- If everything is OK
COMMIT;

-- If something failed (e.g.: insufficient stock, non-existent product, insert error)
-- ROLLBACK;

-- ==================================================================
-- Test transaction with rollback
-- This transaction demonstrates how to check stock levels, modify them, and then either commit or rollback the changes.
-- ==================================================================
-- It is useful for testing purposes to ensure that stock levels are managed correctly.
-- Ensure that the database and tables are created before running this transaction.
-- This transaction does not commit changes, allowing for testing of rollback functionality.
-- Note: This is a test transaction and should not be used in production.
START TRANSACTION;

-- 1) View initial stock (baseline)
SELECT stock AS initial_stock FROM products WHERE product_id = 2;

-- 2) Modify (not committed yet)
UPDATE products SET stock = stock - 3 WHERE product_id = 2;

-- 3) View stock within the same transaction (should be reduced)
SELECT stock AS stock_during_tx FROM products WHERE product_id = 2;

-- 4) Decide: rollback or commit
-- Test A: rollback
ROLLBACK;