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
├── procedures.sql      # Stored procedures for business logic automation
├── transactions.sql    # Transaction examples for order processing and stock management
├── modelo_ER.png       # Entity-Relationship diagram
└── README.md           # Project documentation
└── scalability_experiments/
         ├── sharding_simulation.sql   #Manual Sharding Experiment
         ├── cache_simulation.sql #Cache #Two caching approaches

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

- **procedures.sql**  
  Implements stored procedures to automate common business logic operations:

  - `calculate_order_total`: Calculates the total amount of an order by summing the quantity × price of all products in the order
  - `insert_order_from_cart`: Creates a new order from a shopping cart, copying all cart items to order details, calculating the total, and clearing the cart
  - Includes examples of procedure calls and integration with other queries
  - Demonstrates advanced usage patterns, including integration with reporting tables
  - Shows best practices for procedure parameter handling (IN/OUT parameters)
  - Features shopping cart simulation with temporary tables for testing order creation workflows

- **transactions.sql**  
  Demonstrates transaction management for order creation and stock updates, including examples of commit and rollback to ensure data integrity during order processing.

- **_sharding_simulation.sql_**
  Manual sharding experiment: Added the country attribute to the customer table and generated shards by region (Americas and Europe) for similar distributed databases.

  - The `customers` table is split into two shards (`customers_america`, `customers_europe`) based on country.
  - Example of a unified query using `UNION` to simulate a distributed scenario.
  - Demonstrates the use of `CASE` to avoid code repetition and handle logic within queries (showing progress in writing more efficient SQL).

- **_cache_simulation.sql_**
  In this experiment, two caching approaches (temporary and persistent) are simulated to optimize queries in an e-commerce.

  Option A: Cache with Temporary Tables

  - A temporary table (cache_top_products) is created to store the TOP 5 best-selling products.
  - The table is then reused across multiple queries (e.g., analyzing customers who purchased these products).
    This reduces the cost of recalculating heavy metrics in every single query.

  Option B: Cache with Persistent Table

  - A persistent table (cache_top_products) is created, which remains in the database beyond the current session.
  - The table content is refreshed periodically (e.g., every 10 minutes or 1 hour) using a TRUNCATE followed by an INSERT ... SELECT query that recalculates the TOP 5.
  - It includes a last_updated column with an automatic timestamp, which allows tracking when the cache was last refreshed.
  - This approach is closer to a real production scenario, since it avoids recalculating in real time and ensures fast responses for frequent queries (e.g., showing the best-selling products on the homepage).
  - Cache refreshing can be further optimized using MySQL EVENTS (task scheduling inside the database engine), which would keep the cache updated automatically without manual intervention. This is a topic I plan to explore further as part of my learning journey.

These experiments are not mandatory, but they illustrate common techniques in large projects where performance is key.

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

5. **Run `procedures.sql`**  
   Create and test stored procedures for automated business logic operations.

6. **Run `transactions.sql`**  
   Test transaction scenarios for order creation and stock management.

## Author

Camila Villalba Heuer  
[LinkedIn](https://www.linkedin.com/in/camilavheuer)  
cbvillalbaheuer@gmail.com
