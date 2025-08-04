📚 Bookstore Database Project
📌 Overview
This project simulates a relational database for a bookstore. It includes the database schema, data insertion scripts, and analytical queries to support common operations such as tracking sales, managing inventory, and analyzing customer behavior.

🎯 Objectives
Design a relational database schema that supports the operations of a bookstore.

Insert realistic sample data to simulate books, authors, customers, and sales.

Write SQL queries to:

Retrieve business insights

Analyze customer behavior

Monitor inventory

Track sales performance

🗂️ Project Structure
plaintext
Copiar
Editar
bookstore-project/
│
├── schema_tables.sql       # Contains the CREATE TABLE statements
├── data_inserts.sql        # Contains INSERT INTO statements and any temp tables used for data loading
├── queries.sql             # Contains SQL queries answering business questions
├── README.md               # Project description and documentation
└── diagram.png             # (Optional) Your ERD diagram image
🧱 Database Schema
The database includes the following entities:

Authors: Stores information about book authors

Books: Includes book metadata and inventory (stock, price)

Customers: Contains client data

Sales: Records each sale, its date and modality (online/in-store)

Sale_Details: Links books with each sale and their quantities

Relationships:

One author can have many books

One customer can make many sales

Each sale can include many books

One book can appear in multiple sales

(Your ERD diagram will reflect this structure.)

🧪 Sample Queries
The queries.sql file includes SQL queries that answer questions such as:

Which customer made the most purchases?

What are the top-selling books?

Which authors generated the highest revenue?

How much stock remains for each book?

What are the monthly sales totals?

Extra insights are also included to demonstrate SQL skills using joins, aggregate functions, subqueries, and more.

💡 Technologies Used
SQL (MySQL)

phpMyAdmin (via XAMPP) for development and testing

DB-Fiddle (for schema visualization and online testing)

🗒️ Notes
The schema is designed for a local database (localhost) using XAMPP on Linux.

All data is fictional and used for educational purposes.

The database is structured in English for professional portability.



