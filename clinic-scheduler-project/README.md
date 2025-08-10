# Clinic Scheduler Project

## Project Objective

This project aims to design and implement a relational database for managing medical appointments in a clinic. The system allows you to store and organize information about specialties, doctors, patients, rooms, and appointments, enabling efficient scheduling, tracking, and analysis of clinic activity.

## Folder Structure

```
/clinic-scheduler-project/
│
├── create_table.sql   # Table creation script
├── insert_data.sql    # Sample data insertion script
├── queries.sql        # Key queries for management and analysis
├── modelo_ER.png      # Entity-Relationship diagram (to be added)
└── README.md          # Project documentation
```

## Scripts

- **create_table.sql**  
  Creates all tables required for the clinic scheduler database, including primary keys, foreign keys, and constraints for:

  - Specialties
  - Doctors
  - Patients
  - Rooms
  - Appointments

- **insert_data.sql**  
  Inserts sample records into each table, providing realistic data for specialties, doctors, patients, rooms, and appointments. This allows you to test and explore the database with meaningful examples.

- **queries.sql**  
  Contains a collection of useful SQL queries to:
  - List and organize patients, doctors, and appointments
  - Monitor appointment status (scheduled, completed, cancelled)
  - Analyze trends (peak hours, most requested specialties, cancellations)
  - Support clinic management and reporting

## How to Use

1. **Create the database**  
   Start by creating your database in MySQL, for example:

   ```sql
   CREATE DATABASE clinic_scheduler;
   USE clinic_scheduler;
   ```

2. **Run `create_table.sql`**  
   Set up the database schema by creating all tables.

3. **Run `insert_data.sql`**  
   Populate the tables with sample data.

4. **Run `queries.sql`**  
   Execute the queries to manage, monitor, and analyze clinic activity.

## Author

Camila Villalba Heuer  
[LinkedIn](https://www.linkedin.com/in/camilavheuer)  
cbvillalbaheuer@gmail.com
