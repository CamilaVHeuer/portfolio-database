--Queries that address the objectives of the bookstore management system

--Book information management
--1. Get the complete list of available books with current stock, price, and author
SELECT * FROM books;

--2. Show books with stock below a threshold (e.g., less than 5 units)
SELECT * FROM books WHERE stock < 5;

--3. Show the number of available books by author's country of origin
SELECT COUNT(*) AS total_books, country
FROM books AS b
    INNER JOIN authors AS a ON b.author_id = a.author_id
GROUP BY
    country;

--4. Get the most expensive book
SELECT * FROM books WHERE price = ( SELECT MAX(price) FROM books );

--5. Get the cheapest book
SELECT * FROM books WHERE price = ( SELECT MIN(price) FROM books );

-- 6. Get the most expensive and cheapest book
SELECT *, 'Most Expensive' AS label
FROM books
WHERE
    price = (
        SELECT MAX(price)
        FROM books
    )
UNION ALL
SELECT *, 'Least Expensive' AS label
FROM books
WHERE
    price = (
        SELECT MIN(price)
        FROM books
    );

--Register and view sales

--1. Show all sales made with date, mode, and customer
SELECT * FROM sales;

--2. Show books sold in a specific sale (query by sale_id or date)
--a. by sale_id
SELECT s.sale_id, s.date, b.title, sd.unit_price, sd.quantity
FROM
    books AS b
    INNER JOIN sale_details AS sd ON b.book_id = sd.book_id
    INNER JOIN sales AS s ON sd.sale_id = s.sale_id
WHERE
    sd.sale_id = 7;

--b. by date: books sold in the last month of the year
SELECT s.sale_id, s.date, b.title, sd.unit_price, sd.quantity
FROM
    books AS b
    INNER JOIN sale_details AS sd ON b.book_id = sd.book_id
    INNER JOIN sales AS s ON sd.sale_id = s.sale_id
WHERE
    MONTH(s.date) = 12;

--3. Query all sales/purchases made by a specific customer (by first and last name, e.g. Camila Perez)
SELECT c.customer_id, c.first_name, c.last_name, s.date, s.total
FROM customers AS c
    INNER JOIN sales AS s ON c.customer_id = s.customer_id
WHERE
    c.first_name = 'Camila'
    AND c.last_name = 'Perez';

--4. Calculate total revenue from sales
SELECT SUM(total) AS total_revenue_per_sales FROM sales;

--5. Calculate total revenue per month
SELECT
    YEAR(date) as year,
    MONTH(date) AS month,
    SUM(total) AS total_revenue_per_month
FROM sales
GROUP BY
    YEAR(date),
    MONTH(date)
ORDER BY year, month;

--6. Calculate the number of sales by mode (online vs in-person)
SELECT COUNT(*) AS total_mode, mode FROM sales GROUP BY mode;

--7. Calculate the revenue by mode
SELECT SUM(total) AS revenue_per_mode, mode FROM sales GROUP BY mode;

--Purchase pattern analysis
--1. See which books are the best sellers (order by total quantity)
SELECT b.title, COUNT(*) AS total_sold
FROM sale_details AS sd
    INNER JOIN books AS b ON sd.book_id = b.book_id
GROUP BY
    b.title
ORDER BY total_sold DESC;

--2. Show how many books have been sold by author
SELECT a.first_name, a.last_name, COUNT(*) AS total_sold
FROM
    sale_details AS sd
    INNER JOIN books AS b ON sd.book_id = b.book_id
    INNER JOIN authors AS a ON b.author_Id = a.author_id
GROUP BY
    a.first_name,
    a.last_name
ORDER BY total_sold DESC;

--3. Show the best-selling books by author
SELECT a.first_name, a.last_name, b.title, COUNT(*) AS total_sold
FROM
    sale_details AS sd
    INNER JOIN books AS b ON sd.book_id = b.book_id
    INNER JOIN authors AS a ON b.author_Id = a.author_id
GROUP BY
    a.first_name,
    a.last_name,
    b.title
ORDER BY total_sold DESC;

--4. Determine the customer who bought the most (by number of books or money)
--a. By number of books
SELECT c.customer_id, c.first_name, c.last_name, SUM(sd.quantity) AS total_books
FROM
    customers AS c
    INNER JOIN sales AS s ON c.customer_id = s.customer_id
    INNER JOIN sale_details AS sd ON s.sale_id = sd.sale_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    total_books = (
        SELECT MAX(total_books)
        FROM (
                SELECT SUM(sd.quantity) AS total_books
                FROM
                    customers AS c
                    INNER JOIN sales AS s ON c.customer_id = s.customer_id
                    INNER JOIN sale_details AS sd ON s.sale_id = sd.sale_id
                GROUP BY
                    c.customer_id
            ) AS sub
    );

-- b. By money (total)
SELECT c.customer_id, c.first_name, c.last_name, SUM(total) AS total_buy
FROM customers AS c
    INNER JOIN sales AS s ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    total_buy = (
        SELECT MAX(total_buy)
        FROM (
                SELECT SUM(total) AS total_buy
                FROM customers AS c
                    INNER JOIN sales AS s ON c.customer_id = s.customer_id
                GROUP BY
                    c.customer_id
            ) AS sub
    );

--5. Calculate the average ticket per monthly sale (Average ticket = Total sales revenue / Number of sales)
SELECT YEAR(date) AS year, MONTH(date) AS month, AVG(total) AS avg_ticket
FROM sales
GROUP BY
    year,
    month;

--Bonus Queries
-- 1. Top 3 best-selling books
SELECT b.title, CONCAT(
        a.first_name, ' ', a.last_name
    ) As author, SUM(sd.quantity) AS total_sold
FROM
    sale_details AS sd
    INNER JOIN books as b ON sd.book_id = b.book_id
    INNER JOIN authors AS a ON b.author_id = a.author_id
GROUP BY
    b.title,
    a.author_id
ORDER BY total_sold DESC
LIMIT 3;

--2. Show customers who bought more than once
SELECT c.customer_id, c.first_name, c.last_name, COUNT(*) AS total_buy
FROM sales AS s
    INNER JOIN customers AS c ON s.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING
    total_buy > 1;

--3. Show total revenue by author's country
SELECT a.country, SUM(unit_price * quantity) AS total_sold
FROM
    authors AS a
    INNER JOIN books AS b ON a.author_id = b.author_id
    INNER JOIN sale_details AS sd ON b.book_id = sd.book_id
GROUP BY
    a.country
ORDER BY total_sold DESC;

-- 4. Critical stock. Show books with stock less than 5
SELECT book_Id, title, stock FROM books WHERE stock < 5;

-- 5. Average price of books sold
SELECT avg(unit_price) AS avg_unit_price_books_sold
FROM sale_details;

-- Or with weighted average
SELECT SUM(unit_price * quantity) / SUM(quantity) AS weighted_avg_price
FROM sale_details;