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
        'Estados Unidos'
    ),
    (
        'John',
        'Le Carre',
        'Reino Unido'
    ),
    (
        'Marcus',
        'Sakey',
        'Estados Unidos'
    ),
    (
        'Mariano',
        'Sigman',
        'Argentina'
    ),
    (
        'Sidney',
        'Sheldon',
        'Estados Unidos'
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
        'Estados Unidos'
    ),
    (
        'Marian',
        'Rojas Estape',
        'España'
    ),
    (
        'Philip',
        'Pullman',
        'Reino Unido'
    ),
    (
        'Danielle',
        'Steel',
        'Estados Unidos'
    ),
    (
        'Mathew',
        'Walker',
        'Reino Unido'
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
        'Origen',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Dan'
                AND last_name = 'Brown'
        ),
        'Novela/Ciencia Ficción',
        30000,
        10
    ),
    (
        'Angeles y Demonios',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Dan'
                AND last_name = 'Brown'
        ),
        'Ciencia Ficción',
        28000,
        9
    ),
    (
        'El codigo Da Vinci',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Dan'
                AND last_name = 'Brown'
        ),
        'Ciencia Ficción',
        39000,
        10
    ),
    (
        'El hombre mas buscado',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'John'
                AND last_name = 'Le Carre'
        ),
        'Ficción de espionaje',
        20000,
        15
    ),
    (
        'Al filo de la navaja',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Marcus'
                AND last_name = 'Sakey'
        ),
        'Policial',
        15500,
        8
    ),
    (
        'La vida secreta de la mente',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Mariano'
                AND last_name = 'Sigman'
        ),
        'Neurociencia',
        28200,
        5
    ),
    (
        'Nada es eterno',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Sidney'
                AND last_name = 'Sheldon'
        ),
        'Novela',
        14600,
        15
    ),
    (
        'Neurociencia ficcion',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Mariano'
                AND last_name = 'Quian Quiroga'
        ),
        'Neurociencia',
        22900,
        7
    ),
    (
        'La conspiracion',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Dan'
                AND last_name = 'Brown'
        ),
        'Novela/Ciencia Ficción',
        27050,
        12
    ),
    (
        'El secreto atomico de Huemul',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Mario A. J.'
                AND last_name = 'Mariscotti'
        ),
        'Historia',
        18000,
        3
    ),
    (
        'Si hubiera un mañana',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Sidney'
                AND last_name = 'Sheldon'
        ),
        'Novela',
        12000,
        16
    ),
    (
        'Lazos de Sangre',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Sidney'
                AND last_name = 'Sheldon'
        ),
        'Novela',
        21000,
        4
    ),
    (
        'El secreto de Gray Montain',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'John'
                AND last_name = 'Grisham'
        ),
        'Misterio',
        31500,
        20
    ),
    (
        'Recupera tu mente, reconquista tu vida',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Marian'
                AND last_name = 'Rojas Estape'
        ),
        'Divulgacion vientifica/Salud',
        30000,
        10
    ),
    (
        'La Daga',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Philip'
                AND last_name = 'Pullman'
        ),
        'Fantasia',
        8000,
        7
    ),
    (
        'Fiel a si misma',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Danielle'
                AND last_name = 'Steel'
        ),
        'Novela',
        22600,
        6
    ),
    (
        'Por qué dormimos',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Mathew'
                AND last_name = 'Walker'
        ),
        'Divulgacion cientifica',
        30000,
        10
    ),
    (
        'Rescate',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Danielle'
                AND last_name = 'Steel'
        ),
        'Novela',
        25600,
        8
    ),
    (
        'Relámpago',
        (
            SELECT author_id
            FROM authors
            WHERE
                first_name = 'Danielle'
                AND last_name = 'Steel'
        ),
        'Novela',
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
                title IN ('Origen')
        ),
        'En tienda'
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
                title IN ('Origen', 'La conspiracion')
        ),
        'En tienda'
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
                title IN ('Origen', 'Nada es eterno')
        ),
        'Sitio web'
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
                    'Al filo de la navaja',
                    'Nada es eterno'
                )
        ),
        'Sitio web'
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
                title IN (
                    'Angeles y demonios',
                    'Rescate'
                )
        ),
        'Sitio web'
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
                    'Angeles y demonios',
                    'Nada es eterno',
                    'La vida secreta de la mente'
                )
        ),
        'En tienda'
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
                title IN ('Origen', 'Por que dormimos')
        ),
        'Sitio web'
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
                    'La vida secreta de la mente',
                    'Neurociencia ficcion'
                )
        ),
        'Sitio web'
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
                    'El secreto atómico de Huemul',
                    'Nada es eterno',
                    'Lazos de sangre'
                )
        ),
        'En tienda'
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
                title IN ('Angeles y demonios')
        ),
        'En tienda'
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
                    'Origen',
                    'Si hubiera un mañana',
                    'El codigo Da Vinci'
                )
        ),
        'En tienda'
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
                    'Angeles y demonios',
                    'La daga'
                )
        ),
        'En tienda'
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
                    'Recupera tu mente, reconquista tu vida'
                )
        ),
        'Sitio web'
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
        'Origen',
        1
    ),
    (
        'Camila',
        'Perez',
        '2024-12-21',
        'Origen',
        1
    ),
    (
        'Camila',
        'Perez',
        '2024-12-21',
        'La conspiracion',
        1
    ),
    (
        'Pablo',
        'Perez',
        '2025-01-04',
        'Origen',
        1
    ),
    (
        'Pablo',
        'Perez',
        '2025-01-04',
        'Nada es eterno',
        1
    ),
    (
        'Sergio',
        'Robles',
        '2025-01-15',
        'Al filo de la navaja',
        1
    ),
    (
        'Sergio',
        'Robles',
        '2025-01-15',
        'Nada es eterno',
        1
    ),
    (
        'Pablo',
        'Perez',
        '2025-02-02',
        'Angeles y Demonios',
        1
    ),
    (
        'Pablo',
        'Perez',
        '2025-02-02',
        'Rescate',
        1
    ),
    (
        'Emilia',
        'Diaz',
        '2025-01-04',
        'Angeles y Demonios',
        1
    ),
    (
        'Emilia',
        'Diaz',
        '2025-01-04',
        'Nada es eterno',
        1
    ),
    (
        'Emilia',
        'Diaz',
        '2025-01-04',
        'La vida secreta de la mente',
        1
    ),
    (
        'Emilia',
        'Diaz',
        '2025-02-01',
        'Origen',
        1
    ),
    (
        'Emilia',
        'Diaz',
        '2025-02-01',
        'Por qué dormimos',
        1
    ),
    (
        'Julio',
        'Marequez',
        '2025-02-08',
        'La vida secreta de la mente',
        1
    ),
    (
        'Julio',
        'Marequez',
        '2025-02-08',
        'Neurociencia ficcion',
        1
    ),
    (
        'Ester',
        'Ramirez',
        '2025-01-28',
        'El secreto atomico de Huemul',
        1
    ),
    (
        'Ester',
        'Ramirez',
        '2025-01-28',
        'Nada es eterno',
        1
    ),
    (
        'Ester',
        'Ramirez',
        '2025-01-28',
        'Lazos de Sangre',
        1
    ),
    (
        'Sebastian',
        'Rodriguez',
        '2024-12-05',
        'Angeles y Demonios',
        1
    ),
    (
        'Sebastian',
        'Rodriguez',
        '2024-01-10',
        'Origen',
        1
    ),
    (
        'Sebastian',
        'Rodriguez',
        '2024-01-10',
        'Si hubiera un mañana',
        1
    ),
    (
        'Sebastian',
        'Rodriguez',
        '2024-01-10',
        'El codigo Da Vinci',
        1
    ),
    (
        'Camila',
        'Perez',
        '2025-02-19',
        'Angeles y Demonios',
        1
    ),
    (
        'Camila',
        'Perez',
        '2025-02-19',
        'La Daga',
        1
    ),
    (
        'Camila',
        'Perez',
        '2025-03-06',
        'Recupera tu mente, reconquista tu vida',
        1
    );

-- Inserting data into the sale_details table
-- This data is derived from the temporary table and reflects the details of each sale,
-- including the sale id, book id, unit price, and quantity sold.
-- The sale_id is linked to the sales table, and the book_id is linked to the books table.
-- The unit_price is taken from the books table, and the quantity is taken from the temporary table.
DROP TABLE IF EXISTS temp_sale_books;
-- Clean up the temporary table after use
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