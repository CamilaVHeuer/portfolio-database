-- Inserting data into the customers table
INSERT INTO
    customers (first_name, last_name, email)
VALUES (
        'Ana',
        'Garcia',
        'anagarcia@gmail.com'
    ),
    (
        'Camila',
        'Perez',
        'camiperez@gmail.com'
    ),
    (
        'Pablo',
        'Perez',
        'pperez@gmail.com'
    ),
    (
        'Sergio',
        'Robles',
        'srobles@gmail.com'
    ),
    (
        'Emilia',
        'Diaz',
        'diaze@gmail.com'
    ),
    (
        'Julio',
        'Marequez',
        'julmarez@gmail.com'
    ),
    (
        'Ester',
        'Ramirez',
        'esramirez@gmail.com'
    ),
    (
        'Sebastian',
        'Rodriguez',
        'sbrod@gmail.com'
    );

-- Inserting data into the authors table
INSERT INTO
    authors (
        first_name,
        last_name,
        country
    )
VALUES (
        'Dan',
        'Brown',
        'United States'
    ),
    (
        'John',
        'Le Carre',
        'United Kingdom'
    ),
    (
        'Marcus',
        'Sakey',
        'United States'
    ),
    (
        'Mariano',
        'Sigman',
        'Argentina'
    ),
    (
        'Sidney',
        'Sheldon',
        'United States'
    ),
    (
        'Mariano',
        'Quian Quiroga',
        'Argentina'
    ),
    (
        'Mario A. J.',
        'Mariscotti',
        'Argentina'
    ),
    (
        'John',
        'Grisham',
        'United States'
    ),
    (
        'Marian',
        'Rojas Estape',
        'Spain'
    ),
    (
        'Philip',
        'Pullman',
        'United Kingdom'
    ),
    (
        'Danielle',
        'Steel',
        'United States'
    ),
    (
        'Mathew',
        'Walker',
        'United Kingdom'
    );

-- Inserting data into the books table
INSERT INTO
    books (
        title,
        author_id,
        gender,
        price,
        stock
    )
VALUES (
        'Origin',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Dan'
                AND last_name = 'Brown'
        ),
        'Novel/Science Fiction',
        30000,
        10
    ),
    (
        'Angels and Demons',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Dan'
                AND last_name = 'Brown'
        ),
        'Science Fiction',
        28000,
        9
    ),
    (
        'The Da Vinci Code',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Dan'
                AND last_name = 'Brown'
        ),
        'Science Fiction',
        39000,
        10
    ),
    (
        'The Most Wanted Man',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'John'
                AND last_name = 'Le Carre'
        ),
        'Spy Fiction',
        20000,
        15
    ),
    (
        'On the Razor\'s Edge',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Marcus'
                AND last_name = 'Sakey'
        ),
        'Crime',
        15500,
        8
    ),
    (
        'The Secret Life of the Mind',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Mariano'
                AND last_name = 'Sigman'
        ),
        'Neuroscience',
        28200,
        5
    ),
    (
        'Nothing Lasts Forever',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Sidney'
                AND last_name = 'Sheldon'
        ),
        'Novel',
        14600,
        15
    ),
    (
        'Neuroscience Fiction',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Mariano'
                AND last_name = 'Quian Quiroga'
        ),
        'Neuroscience',
        22900,
        7
    ),
    (
        'The Conspiracy',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Dan'
                AND last_name = 'Brown'
        ),
        'Novel/Science Fiction',
        27050,
        12
    ),
    (
        'The Atomic Secret of Huemul',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Mario A. J.'
                AND last_name = 'Mariscotti'
        ),
        'History',
        18000,
        3
    ),
    (
        'If Tomorrow Comes',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Sidney'
                AND last_name = 'Sheldon'
        ),
        'Novel',
        12000,
        16
    ),
    (
        'Blood Ties',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Sidney'
                AND last_name = 'Sheldon'
        ),
        'Novel',
        21000,
        4
    ),
    (
        'Gray Mountain Secret',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'John'
                AND last_name = 'Grisham'
        ),
        'Mystery',
        31500,
        20
    ),
    (
        'Recover Your Mind, Reclaim Your Life',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Marian'
                AND last_name = 'Rojas Estape'
        ),
        'Scientific Outreach/Health',
        30000,
        10
    ),
    (
        'The Dagger',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Philip'
                AND last_name = 'Pullman'
        ),
        'Fantasy',
        8000,
        7
    ),
    (
        'True to Herself',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Danielle'
                AND last_name = 'Steel'
        ),
        'Novel',
        22600,
        6
    ),
    (
        'Why We Sleep',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Mathew'
                AND last_name = 'Walker'
        ),
        'Scientific Outreach',
        30000,
        10
    ),
    (
        'Rescue',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Danielle'
                AND last_name = 'Steel'
        ),
        'Novel',
        25600,
        8
    ),
    (
        'Lightning',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Danielle'
                AND last_name = 'Steel'
        ),
        'Novel',
        19600,
        14
    );

-- Inserting data into the sales table
INSERT INTO
    sales (
        customer_id,
        date,
        total,
        mode
    )
VALUES (
        (
            SELECT customer_id
            FROM customers
            WHERE
                first_name = 'Ana'
                AND last_name = 'Garcia'
        ),
        '2024-12-04',
        (
            SELECT SUM(price)
            FROM books
            WHERE
                title IN ('Origin')
        ),
        'In store'
    ),
    (
        (
            SELECT customer_id
            FROM customers
            WHERE
                first_name = 'Camila'
                AND last_name = 'Perez'
        ),
        '2024-12-21',
        (
            SELECT SUM(price)
            FROM books
            WHERE
                title IN ('Origin', 'The Conspiracy')
        ),
        'In store'
    ),
    (
        (
            SELECT customer_id
            FROM customers
            WHERE
                first_name = 'Pablo'
                AND last_name = 'Perez'
        ),
        '2025-01-04',
        (
            SELECT SUM(price)
            FROM books
            WHERE
                title IN (
                    'Origin',
                    'Nothing Lasts Forever'
                )
        ),
        'Website'
    ),
    (
        (
            SELECT customer_id
            FROM customers
            WHERE
                first_name = 'Sergio'
                AND last_name = 'Robles'
        ),
        '2025-01-15',
        (
            SELECT SUM(price)
            FROM books
            WHERE
                title IN (
                    'On the Razor\'s Edge',
                    'Nothing Lasts Forever'
                )
        ),
        'Website'
    ),
    (
        (
            SELECT customer_id
            FROM customers
            WHERE
                first_name = 'Pablo'
                AND last_name = 'Perez'
        ),
        '2025-02-02',
        (
            SELECT SUM(price)
            FROM books
            WHERE
                title IN ('Angels and Demons', 'Rescue')
        ),
        'Website'
    ),
    (
        (
            SELECT customer_id
            FROM customers
            WHERE
                first_name = 'Emilia'
                AND last_name = 'Diaz'
        ),
        '2025-01-04',
        (
            SELECT SUM(price)
            FROM books
            WHERE
                title IN (
                    'Angels and Demons',
                    'Nothing Lasts Forever',
                    'The Secret Life of the Mind'
                )
        ),
        'In store'
    ),
    (
        (
            SELECT customer_id
            FROM customers
            WHERE
                first_name = 'Emilia'
                AND last_name = 'Diaz'
        ),
        '2025-02-01',
        (
            SELECT SUM(price)
            FROM books
            WHERE
                title IN ('Origin', 'Why We Sleep')
        ),
        'Website'
    ),
    (
        (
            SELECT customer_id
            FROM customers
            WHERE
                first_name = 'Julio'
                AND last_name = 'Marequez'
        ),
        '2025-02-08',
        (
            SELECT SUM(price)
            FROM books
            WHERE
                title IN (
                    'The Secret Life of the Mind',
                    'Neuroscience Fiction'
                )
        ),
        'Website'
    ),
    (
        (
            SELECT customer_id
            FROM customers
            WHERE
                first_name = 'Ester'
                AND last_name = 'Ramirez'
        ),
        '2025-01-28',
        (
            SELECT SUM(price)
            FROM books
            WHERE
                title IN (
                    'The Atomic Secret of Huemul',
                    'Nothing Lasts Forever',
                    'Blood Ties'
                )
        ),
        'In store'
    ),
    (
        (
            SELECT customer_id
            FROM customers
            WHERE
                first_name = 'Sebastian'
                AND last_name = 'Rodriguez'
        ),
        '2024-12-05',
        (
            SELECT SUM(price)
            FROM books
            WHERE
                title IN ('Angels and Demons')
        ),
        'In store'
    ),
    (
        (
            SELECT customer_id
            FROM customers
            WHERE
                first_name = 'Sebastian'
                AND last_name = 'Rodriguez'
        ),
        '2024-01-10',
        (
            SELECT SUM(price)
            FROM books
            WHERE
                title IN (
                    'Origin',
                    'If Tomorrow Comes',
                    'The Da Vinci Code'
                )
        ),
        'In store'
    ),
    (
        (
            SELECT customer_id
            FROM customers
            WHERE
                first_name = 'Camila'
                AND last_name = 'Perez'
        ),
        '2025-02-19',
        (
            SELECT SUM(price)
            FROM books
            WHERE
                title IN (
                    'Angels and Demons',
                    'The Dagger'
                )
        ),
        'In store'
    ),
    (
        (
            SELECT customer_id
            FROM customers
            WHERE
                first_name = 'Camila'
                AND last_name = 'Perez'
        ),
        '2025-03-06',
        (
            SELECT SUM(price)
            FROM books
            WHERE
                title IN (
                    'Recover Your Mind, Reclaim Your Life'
                )
        ),
        'Website'
    );

-- Creating a temporary table to store the relationships between sales, books, and quantities
-- This is necessary because we need to insert data into sale_details based on the sales and books
-- that were inserted above, and we need to do it in a structured way.
DROP TABLE IF EXISTS temp_sale_books;

CREATE TEMPORARY TABLE temp_sale_books (
    customer_first_name VARCHAR(50),
    customer_last_name VARCHAR(50),
    sale_date DATE,
    book_title VARCHAR(100),
    quantity INT
);

-- Inserting data into the temporary table with the relationships between sales, books, and quantities
-- This data is manually entered to reflect the sales made by customers
-- and the books they purchased, along with the quantity of each book.
INSERT INTO
    temp_sale_books
VALUES (
        'Ana',
        'Garcia',
        '2024-12-04',
        'Origin',
        1
    ),
    (
        'Camila',
        'Perez',
        '2024-12-21',
        'Origin',
        1
    ),
    (
        'Camila',
        'Perez',
        '2024-12-21',
        'The Conspiracy',
        1
    ),
    (
        'Pablo',
        'Perez',
        '2025-01-04',
        'Origin',
        1
    ),
    (
        'Pablo',
        'Perez',
        '2025-01-04',
        'Nothing Lasts Forever',
        1
    ),
    (
        'Sergio',
        'Robles',
        '2025-01-15',
        'On the Razor\'s Edge',
        1
    ),
    (
        'Sergio',
        'Robles',
        '2025-01-15',
        'Nothing Lasts Forever',
        1
    ),
    (
        'Pablo',
        'Perez',
        '2025-02-02',
        'Angels and Demons',
        1
    ),
    (
        'Pablo',
        'Perez',
        '2025-02-02',
        'Rescue',
        1
    ),
    (
        'Emilia',
        'Diaz',
        '2025-01-04',
        'Angels and Demons',
        1
    ),
    (
        'Emilia',
        'Diaz',
        '2025-01-04',
        'Nothing Lasts Forever',
        1
    ),
    (
        'Emilia',
        'Diaz',
        '2025-01-04',
        'The Secret Life of the Mind',
        1
    ),
    (
        'Emilia',
        'Diaz',
        '2025-02-01',
        'Origin',
        1
    ),
    (
        'Emilia',
        'Diaz',
        '2025-02-01',
        'Why We Sleep',
        1
    ),
    (
        'Julio',
        'Marequez',
        '2025-02-08',
        'The Secret Life of the Mind',
        1
    ),
    (
        'Julio',
        'Marequez',
        '2025-02-08',
        'Neuroscience Fiction',
        1
    ),
    (
        'Ester',
        'Ramirez',
        '2025-01-28',
        'The Atomic Secret of Huemul',
        1
    ),
    (
        'Ester',
        'Ramirez',
        '2025-01-28',
        'Nothing Lasts Forever',
        1
    ),
    (
        'Ester',
        'Ramirez',
        '2025-01-28',
        'Blood Ties',
        1
    ),
    (
        'Sebastian',
        'Rodriguez',
        '2024-12-05',
        'Angels and Demons',
        1
    ),
    (
        'Sebastian',
        'Rodriguez',
        '2024-01-10',
        'Origin',
        1
    ),
    (
        'Sebastian',
        'Rodriguez',
        '2024-01-10',
        'If Tomorrow Comes',
        1
    ),
    (
        'Sebastian',
        'Rodriguez',
        '2024-01-10',
        'The Da Vinci Code',
        1
    ),
    (
        'Camila',
        'Perez',
        '2025-02-19',
        'Angels and Demons',
        1
    ),
    (
        'Camila',
        'Perez',
        '2025-02-19',
        'The Dagger',
        1
    ),
    (
        'Camila',
        'Perez',
        '2025-03-06',
        'Recover Your Mind, Reclaim Your Life',
        1
    );

-- Inserting data into the sale_details table
-- This data is derived from the temporary table and reflects the details of each sale,
-- including the sale id, book id, unit price, and quantity sold.
-- The sale_id is linked to the sales table, and the book_id is linked to the books table.
-- The unit_price is taken from the books table, and the quantity is taken from the temporary table.

INSERT INTO
    sale_details (
        sale_id,
        book_id,
        unit_price,
        quantity
    )
SELECT s.sale_id, -- id of the sale that customer made on that date
    b.book_id, -- id of the book with that title
    b.price, -- Unit price of the book
    t.quantity -- Quantity of that book sold
FROM
    temp_sale_books AS t -- auxiliary table with manually entered data
    JOIN customers AS c ON c.first_name = t.customer_first_name
    AND c.last_name = t.customer_last_name
    JOIN sales AS s ON s.customer_id = c.customer_id
    AND s.date = t.sale_date
    JOIN books AS b ON b.title = t.book_title;

DROP TABLE IF EXISTS temp_sale_books;
-- Clean up the temporary table after use