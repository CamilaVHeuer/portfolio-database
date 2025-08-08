-- Active: 1754647249977@@127.0.0.1@3306@bookshop_db
-- Table that stores customer data
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(40)
);

-- Table with the authors of the books
CREATE TABLE IF NOT EXISTS authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    country VARCHAR(40) NOT NULL
);

-- Table with the books available according to stock
CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT,
    gender VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2),
    stock INT,
    FOREIGN KEY (author_id) REFERENCES authors (author_id)
);

-- Table with the sales records
CREATE TABLE IF NOT EXISTS sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    date DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    mode VARCHAR(12) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

-- Table that stores the details of each sale
CREATE TABLE IF NOT EXISTS sale_details (
    detail_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    book_id INT,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES sales (sale_id),
    FOREIGN KEY (book_id) REFERENCES books (book_id)
);