-- 1. Add country column to the customers table
ALTER TABLE customers ADD COLUMN country VARCHAR(50);

-- 2. Assign fictitious countries to existing customers
UPDATE customers
SET
    country = 'Argentina'
WHERE
    customer_id IN (1, 2, 3);

UPDATE customers
SET
    country = 'Chile'
WHERE
    customer_id IN (4, 5);

UPDATE customers
SET
    country = 'USA'
WHERE
    customer_id IN (6, 7, 8);

UPDATE customers
SET
    country = 'Spain'
WHERE
    customer_id IN (9, 10);

-- 3. Manually create shards (simulation)
-- Customers from America
CREATE TABLE customers_america AS
SELECT *
FROM customers
WHERE
    country IN ('Argentina', 'Chile', 'USA');

-- Customers from Europe
CREATE TABLE customers_europe AS
SELECT *
FROM customers
WHERE
    country IN ('Spain', 'France', 'Germany');

-- Example query using the shards
-- 4. Revenue in America vs revenue in Europe
-- This query calculates the total revenue from orders in both shards.
SELECT 'America' AS shard, SUM(p.price * od.quantity) AS revenue
FROM
    customers_america c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
UNION ALL
SELECT 'Europe' AS shard, SUM(p.price * od.quantity) AS revenue
FROM
    customers_europe c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id;

-- 5 TOP products America
SELECT 'America' AS shard, p.name, SUM(od.quantity) AS total_sold
FROM
    customers_america c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
GROUP BY
    p.name
ORDER BY total_sold DESC
LIMIT 3;

-- 6 TOP products Europe
SELECT 'Europe' AS shard, p.name, SUM(od.quantity) AS total_sold
FROM
    customers_europe c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
GROUP BY
    p.name
ORDER BY total_sold DESC
LIMIT 3;
-- Note: In a real sharding scenario, the application logic would route queries to the appropriate shard based on the customer's country.