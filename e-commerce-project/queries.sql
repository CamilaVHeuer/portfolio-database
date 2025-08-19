-- Active: 1754829977405@@127.0.0.1@3306@ecommerce_db

-- 1. Orders by customers
SELECT CONCAT(
        c.first_name, ' ', c.last_name
    ) AS customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id;

-- 2. Best-selling products
-- Here we are using an index on product_id to speed up the join between order_details and products.
SELECT p.name, SUM(od.quantity) AS total_sold
FROM order_details od
    JOIN products p ON od.product_id = p.product_id
GROUP BY
    p.product_id,
    p.name
ORDER BY total_sold DESC;

-- 3. Total spent by customer
SELECT CONCAT(
        c.first_name, ' ', c.last_name
    ) AS customer_name, SUM(p.price * od.quantity) AS total_spent
FROM
    customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
GROUP BY
    c.customer_id;

--4. Top 3 of customers that spent the most
SELECT CONCAT(
        c.first_name, ' ', c.last_name
    ) AS customer_name, SUM(p.price * od.quantity) AS total_spent
FROM
    customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_detail_id
    JOIN products p ON od.product_id = p.product_id
GROUP BY
    c.customer_id
ORDER BY total_spent DESC
LIMIT 3;

-- 5. Current stock of products
SELECT name, stock FROM products;

--6. Products with low stock
SELECT name, stock FROM products WHERE stock < 10;

-- 7. Total revenue from orders
SELECT SUM(p.price * od.quantity) AS total_revenue
FROM
    orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id;

-- 8. Total revenue by month
SELECT DATE_FORMAT(o.date, '%Y-%m') AS month, SUM(p.price * od.quantity) AS total_revenue
FROM
    orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
GROUP BY
    month
ORDER BY month;

--9. Orders on a specific date range
-- This query retrieves orders placed between two specific dates.
-- Adjust the dates as needed.
-- Here we are using a date index to speed up the query.
SELECT CONCAT(
        c.first_name, ' ', c.last_name
    ) AS customer_name, o.order_id, o.date
FROM orders o
    JOIN customers c ON c.customer_id = o.customer_id
WHERE
    o.date BETWEEN '2025-08-15' AND '2025-08-17'
ORDER BY o.date DESC;