# Clinic Scheduler Project

## Project Objective

This project aims to design and implement a relational database for managing medical appointments in a clinic. The system allows you to store and organize information about specialties, doctors, patients, rooms, and appointments, enabling efficient scheduling, tracking, and analysis of clinic activity.

## Folder Structure

```
/clinic-scheduler-project/
│
├── create_table.sql   # Script to create all database tables
├── insert_data.sql    # Script to insert initial sample data
├── queries.sql        # Key queries for management and analysis
├── modelo_ER.png      # Entity-Relationship diagram (to be added)
└── README.md          # Project documentation
```

## Scripts Overview

- **create_table.sql**: Contains all `CREATE TABLE` statements with primary and foreign key constraints for specialties, doctors, patients, rooms, and appointments.
- **insert_data.sql**: Inserts sample data for specialties, doctors, patients, rooms, and appointments to facilitate testing and demonstration.
- **queries.sql**: Includes useful SQL queries for listing patients, doctors, appointments, monitoring appointment status, analyzing trends, and more.

## Execution Order

1. **Run `create_table.sql`**  
   Creates all necessary tables in the database.

2. **Run `insert_data.sql`**  
   Populates the tables with initial sample data.

3. **Run `queries.sql`**  
   Execute the queries to explore, manage, and analyze the clinic data.

## Notes

- The database is designed for MySQL.
- The ER diagram (`modelo_ER.png`) will be added to visually represent the data model.
- You can use DB Fiddle or a local MySQL installation to run the scripts.

## Author

Camila Villalba Heuer  
[LinkedIn](https://www.linkedin.com/in/camilavheuer)  
cbvillalbaheuer@gmail.com
