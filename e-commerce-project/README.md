# E-commerce Database Project

## Project Objective

This project aims to design and implement a relational database for managing an e-commerce platform. The system allows you to store and organize information about customers, products, orders, and order details, enabling efficient management, reporting, and analysis of online sales activity.

## Folder Structure

```
/e-commerce-project/
│
├── create_table.sql    # Table creation script (includes indexes)
├── insert_data.sql     # Sample data insertion script
├── queries.sql         # Key queries for management and analysis
├── transactions.sql    # Transaction examples for order processing and stock management
├── modelo_ER.png       # Entity-Relationship diagram
└── README.md           # Project documentation
```

## Scripts

- **create_table.sql**  
  Creates all tables required for the e-commerce database, including primary keys, foreign keys, constraints, and the use of indexes to optimize queries and performance.

  - Customers
  - Products
  - Orders
  - Order details

- **insert_data.sql**  
  Inserts sample records into each table, providing realistic data for customers, products, orders, and order details. This allows you to test and explore the database with meaningful examples.

- **queries.sql**  
  Contains a collection of useful SQL queries to:

  - List and organize customers, products, and orders
  - Analyze sales, revenue, and product performance
  - Support e-commerce management and reporting

- **transactions.sql**  
  Demonstrates transaction management for order creation and stock updates, including examples of commit and rollback to ensure data integrity during order processing.

## How to Use

1. **Create the database**  
   Start by creating your database in MySQL, for example:

   ```sql
   CREATE DATABASE ecommerce_db;
   USE ecommerce_db;
   ```

2. **Run `create_table.sql`**  
   Set up the database schema by creating all tables and indexes.

3. **Run `insert_data.sql`**  
   Populate the tables with sample data.

4. **Run `queries.sql`**  
   Execute the queries to manage, monitor, and analyze e-commerce activity.

5. **Run `transactions.sql`**  
   Test transaction scenarios for order creation and stock management.

## Author

Camila Villalba Heuer  
[LinkedIn](https://www.linkedin.com/in/camilavheuer)  
cbvillalbaheuer@gmail.com
