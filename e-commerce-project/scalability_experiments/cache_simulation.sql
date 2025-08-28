-- SQL cache simulation for an e-commerce project
-- This script simulates the use of cache to improve the performance of frequent queries.
-- ===================================================================
-- Option A: using a temporary table to store frequent query results.
-- Make sure the database and tables are created before running this script.
-- ===================================================================

-- 1. Create a temporary cache table for frequent results

CREATE TEMPORARY TABLE cache_top_products AS
SELECT od.product_id, SUM(od.quantity) AS total_sold
FROM order_details od
GROUP BY
    od.product_id
ORDER BY total_sold DESC
LIMIT 5;

-- 2. Query from the "cache"
SELECT p.name, ctp.total_sold
FROM
    cache_top_products ctp
    JOIN products p ON ctp.product_id = p.product_id;

-- 3. Use the cache in another query (example: customers who bought those top products)
SELECT DISTINCT
    c.first_name,
    c.last_name
FROM
    customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN cache_top_products ctp ON od.product_id = ctp.product_id;
-- 4. Clean up the cache at the end of the session
DROP TABLE IF EXISTS cache_top_products;

-- ===================================================================
-- Option B: using a persistent cache table to store frequent query results.
-- This option is more complex and requires manual or scheduled refresh of the cache.
-- ==================================================================

-- 1. Create a persistent cache table for frequent results
CREATE TABLE IF NOT EXISTS cache_top_products (
    product_id INT PRIMARY KEY,
    total_sold INT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- last_updated works as an automatic timestamp, always reflecting the last time the row was created or modified.

-- 2. Refresh the cache (example: every 10 minutes with an EVENT or manually)
TRUNCATE TABLE cache_top_products;

INSERT INTO
    cache_top_products (product_id, total_sold)
SELECT od.product_id, SUM(od.quantity) AS total_sold
FROM order_details od
GROUP BY
    od.product_id
ORDER BY total_sold DESC
LIMIT 5;

-- 3. Query the cache to show the top products
SELECT p.name, ctp.total_sold, ctp.last_updated
FROM
    cache_top_products ctp
    JOIN products p ON ctp.product_id = p.product_id;

-- 4. Use the cache in another query (customers who bought top products)
SELECT DISTINCT
    c.first_name,
    c.last_name
FROM
    customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN cache_top_products ctp ON od.product_id = ctp.product_id;

--==================================================================
-- Option C: Using a event to refresh the cache automatically.
-- (We leverage the persistent table created in option B).
-- This option requires the event scheduler to be enabled in MySQL.
-- To enable the event scheduler, run: SET GLOBAL event_scheduler = ON;
-- To check if it's enabled, run: SHOW VARIABLES LIKE 'event_scheduler';
--==================================================================
-- 1. Create an event to refresh the cache every 10 minutes
DELIMITER /
/

CREATE EVENT IF NOT EXISTS refresh_cache_top_products
ON SCHEDULE EVERY 10 MINUTE
DO
BEGIN
    -- Refresh the cache by truncating and repopulating the cache table
    TRUNCATE TABLE cache_top_products;

    INSERT INTO cache_top_products (product_id, total_sold)
    SELECT od.product_id, SUM(od.quantity) AS total_sold
    FROM order_details od
    GROUP BY od.product_id
    ORDER BY total_sold DESC
    LIMIT 5;
END
/
/

DELIMITER;