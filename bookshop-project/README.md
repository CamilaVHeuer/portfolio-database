# Bookshop Database Scripts

## Project Objective

This project aims to design and implement a relational database for managing a bookstore. The system allows you to store and organize information about customers, authors, books, sales, and sale details, enabling efficient management, reporting, and analysis of bookstore activity.

## Folder Structure

```
/bookshop-project/
│
├── create_table.sql   # Table creation script
├── insert_data.sql    # Sample data insertion script
├── queries.sql        # Key queries for management and analysis
├── modelo_ER.png      # Entity-Relationship diagram (to be added)
└── README.md          # Project documentation
```

## Steps to set up the database from scratch

1. **Install the SQLTools extension in VSCode**

   - Open VSCode and search for "SQLTools" in the extensions section.
   - Install the official extension.

2. **Install the MySQL driver for SQLTools**

   - From the SQLTools extension, install the "SQLTools MySQL/MariaDB" driver.

3. **Create a connection to MySQL**

   - Open the SQLTools panel and add a new connection.
   - Fill in your MySQL server details (host, user, password, port, database).
   - Test the connection to ensure it works.

4. **Create the database**

   - If it does not exist, run the command to create the database, for example:
     ```sql
     CREATE DATABASE bookshop_db;
     USE bookshop_db;
     ```
   - Select the database in SQLTools before running the following scripts.

5. **Run the scripts in order**
   - First, run `create_table.sql` to create the tables.
   - Second, run `insert_data.sql` to load the initial data.
   - Third, use `queries.sql` to perform queries and obtain information.

---

## Script descriptions

This directory contains the main scripts for managing a bookstore database. Below is the purpose and usage of each file, in the recommended execution order:

## 1. `create_table.sql`

This script creates the database structure, defining the main tables of the system:

- **customers**: stores customer data.
- **authors**: stores author data.
- **books**: stores available books and their relationship to authors.
- **sales**: stores sales made, linked to customers.
- **sale_details**: stores the details of each sale (books sold, quantity, unit price).

**Usage:**  
Run this script first to create all necessary tables before inserting data.

## 2. `insert_data.sql`

This script inserts initial data into the main tables of the system:

- **customers**: bookstore customers.
- **authors**: book authors.
- **books**: available books, linked to their authors.
- **sales**: sales made, linked to customers and books.
- **sale_details**: details of each sale (books sold, quantity, unit price).

Includes the creation of a temporary table to facilitate loading data into `sale_details`.

**Usage:**  
Run this script after creating the tables to populate the database with sample data and entity relationships.

## 3. `queries.sql`

Contains SQL queries that address the objectives of the bookstore management system, grouped by topic:

- **Book information management:** Listings, stock, prices, authors, most/least expensive books.
- **Sales registration and visualization:** Sales by date, mode, customer, books sold in each sale.
- **Purchase pattern analysis:** Best-selling books, sales by author, top customers, average ticket, sales by country, etc.
- **Bonus queries:** Top 3 best-selling books, frequent customers, critical stock, average prices.

**Usage:**  
Run the queries according to the information you want to analyze or report. They are useful for reports, statistics, and decision-making.

---

**Recommendation:**  
Run the scripts in the following order:

1. `create_table.sql`
2. `insert_data.sql`
3. `queries.sql`  
   This ensures the correct creation, loading, and querying of the bookstore database.

---

## Author

Camila Villalba Heuer  
[LinkedIn](https://www.linkedin.com/in/camilavheuer)  
cbvillalbaheuer@gmail.com
