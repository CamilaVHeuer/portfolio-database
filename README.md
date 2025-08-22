# Database Projects Portfolio

I am Camila Villalba Heuer, a chemical engineer and nuclear specialist, currently training in data analysis and database development. My goal is to integrate my engineering experience with the potential of the data world, creating solutions that combine technical rigor and practical value.

In this repository you will find practical projects that demonstrate my skills in designing, implementing, and querying databases, applying key SQL concepts in real and simulated scenarios.

---

## Objectives

- Model relational databases.
- Write SQL scripts following best practices.
- Apply aggregate functions, joins, and subqueries.
- Document projects clearly and professionally.

---

## Repository Structure

Each project has its own folder with the following structure:

```
/project-name/
│
├── modelo_ER.png → Entity-Relationship diagram
├── create_table.sql → CREATE TABLE statements with constraints
├── insert_data.sql → Sample data (INSERT INTO)
├── queries.sql → Key queries (SELECT, JOIN, etc.)
└── README.md → Project-specific description
```

Current example:

```
/bookshop/
│
├── modelo_ER.png
├── create_table.sql
├── insert_data.sql
├── queries.sql
└── README.md
```

---

## Included Projects

### 1. Bookshop Management System (`bookshop`)

- Entities: books, authors, customers, sales, sale_details
- Queries: best-selling books, frequent customers, monthly revenue
- Engine: MySQL (DB Fiddle for online execution)
- What you'll find:
  - Basic SQL operations: SELECT, INSERT, UPDATE, DELETE
  - Use of JOINs to relate books, authors, customers, and sales
  - Aggregate functions (SUM, COUNT) for sales analysis
  - UNION for combining results
  - Subqueries for dynamic data retrieval
  - Practical examples for querying and reporting on bookshop activity

### 2. Clinic Scheduler Project (`clinic-scheduler-project`)

- Entities: specialties, doctors, patients, rooms, appointments
- Queries: scheduled/completed/cancelled appointments, doctor and room availability, patient lists, trend analysis (peak hours, most requested specialties)
- Engine: MySQL (DB Fiddle for online execution)
- What you'll find:
  - Advanced SQL queries with multiple JOINs
  - Use of ENUM type for appointment status
  - Aggregate functions and grouping for monitoring appointments
  - Use of FIELD to order days of the week
  - Date and time functions for peak hour and trend analysis
  - Examples of referential integrity and constraints
  - Project built and tested using XAMPP and phpMyAdmin
  - Includes screenshots of query results as seen in phpMyAdmin

### 3. E-commerce Project (`e-commerce-project`)

- Entities: customers, products, orders, order_details
- Queries: sales analysis, product performance, customer activity, stock management
- Engine: MySQL
- What you'll find:
  - Use of indexes to optimize queries and improve performance (new concept)
  - Implementation of transactions for order creation and stock updates (new concept)
  - Transaction control with COMMIT and ROLLBACK for data integrity
  - JOINs and aggregate functions for sales and inventory analysis
  - Practical examples for managing and analyzing e-commerce operations

Each project will have its own ER diagram and specific documentation.

---

## Tools Used

- SQL (MySQL)
- DB Fiddle for online testing
- GitHub for versioning and documentation
- Draw.io for ER diagrams
- XAMPP and phpMyAdmin (used for the Clinic Scheduler Project)

---

## Contact

- [LinkedIn](https://www.linkedin.com/in/camilavheuer)
- Email: **cbvillalbaheuer@gmail.com**
