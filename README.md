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

More projects coming soon, such as:

- Public data analysis (INDEC, World Bank)
- Movie database

Each project will have its own ER diagram and specific documentation.

---

## Tools Used

- SQL (MySQL)
- DB Fiddle for online testing
- GitHub for versioning and documentation
- Draw.io for ER diagrams

---

## Contact

- [LinkedIn](https://www.linkedin.com/in/camilavheuer)
- Email: **cbvillalbaheuer@gmail.com**
