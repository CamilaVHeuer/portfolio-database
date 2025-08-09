-- Queries that address the objectives of the clinic management system
-- Clinic information management: queries to access and organize essential data, such as lists of patients, doctors, and appointments.
-- 1. List all patients ordered by birth date.

SELECT * FROM patients ORDER BY birth_date ASC;

-- 2. Show all doctors along with their specialty.
SELECT
    d.doctor_id,
    CONCAT(
        d.first_name,
        ' ',
        d.last_name
    ) AS doctor_name,
    d.specialty_id,
    s.name AS specialty_name
FROM doctors d
    JOIN specialties s ON d.specialty_id = s.specialty_id;

-- 3. Query all scheduled appointments for a specific date.
SELECT
    a.appointment_date,
    a.appointment_time,
    CONCAT(
        p.first_name,
        ' ',
        p.last_name
    ) AS patient_name,
    CONCAT(
        d.first_name,
        ' ',
        d.last_name
    ) AS doctor_name,
    a.room_id,
    a.notes,
    a.status
FROM
    appointments a
    JOIN patients p ON a.patient_id = p.patient_id
    JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE
    a.appointment_date = '2025-07-28';

-- Appointment monitoring and performance: queries to track appointment status, identify cancellations, and schedule follow-ups.
-- 1. Count the number of scheduled, completed, and cancelled appointments.
SELECT a.status, COUNT(*) AS total
FROM appointments a
GROUP BY
    a.status;

-- 2. List cancelled appointments
SELECT a.* FROM appointments a WHERE a.status = 'cancelled';

-- 3. List scheduled appointments for each doctor and their specialty
SELECT
    d.doctor_id,
    CONCAT(
        d.first_name,
        ' ',
        d.last_name
    ) AS doctor_name,
    COUNT(a.appointment_id) AS total_appointments,
    s.name AS speciality_name
FROM
    doctors d
    JOIN specialties s ON d.specialty_id = s.specialty_id
    LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
WHERE
    a.status = 'Scheduled'
GROUP BY
    d.doctor_id,
    speciality_name;

-- 4. Show how many appointments were completed by specialty
SELECT
    s.specialty_id,
    s.name AS specialty_name,
    COUNT(a.appointment_id) AS completed_appointments
FROM
    specialties s
    JOIN doctors d ON s.specialty_id = d.specialty_id
    JOIN appointments a ON d.doctor_id = a.doctor_id
WHERE
    a.status = 'completed'
GROUP BY
    s.specialty_id;

-- Doctor and room availability management: queries to check the availability of doctors and rooms, facilitating efficient appointment scheduling.
-- 1. List doctor availability for a specific date (assuming a doctor can have multiple appointments in a day, but not at the same time)
SELECT d.doctor_id, CONCAT(
        d.first_name, ' ', d.last_name
    ) AS doctor_name, a.appointment_date, a.appointment_time, a.status
FROM doctors d
    LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
WHERE
    a.appointment_date = '2025-08-12'
    AND a.status = 'Scheduled'
ORDER BY d.doctor_id, a.appointment_time;
-- 2. List room availability for a specific date
SELECT r.room_id, r.room_number, r.floor, a.appointment_date, a.appointment_time, a.status
FROM rooms r
    LEFT JOIN appointments a ON r.room_id = a.room_id
WHERE
    a.appointment_date = '2025-08-12'
    AND a.status = 'Scheduled'
ORDER BY r.room_id, a.appointment_time;

-- Strategic appointment analysis: queries to identify trends in appointment scheduling, such as peak hours and most requested specialties.
-- 1. Identify peak hours for scheduled appointments
SELECT
    HOUR(appointment_time) AS appointment_hour,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY
    appointment_hour
ORDER BY appointment_hour;

-- 2. Identify days of the week with the most scheduled appointments
SELECT
    DAYNAME(appointment_date) AS appointment_day,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY
    appointment_day
ORDER BY FIELD(
        appointment_day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    );

-- 3. List the most requested specialties by number of scheduled appointments
SELECT
    s.specialty_id,
    s.name AS specialty_name,
    COUNT(a.appointment_id) AS total_appointments
FROM
    specialties s
    JOIN doctors d ON s.specialty_id = d.specialty_id
    JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY
    s.specialty_id,
    s.name
ORDER BY total_appointments DESC;

-- 4. List patients with the most scheduled appointments
SELECT
    p.patient_id,
    CONCAT(
        p.first_name,
        ' ',
        p.last_name
    ) AS patient_name,
    COUNT(a.appointment_id) AS total_appointments
FROM patients p
    LEFT JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY
    p.patient_id,
    p.first_name,
    p.last_name
ORDER BY total_appointments DESC;

-- 5. List doctors with the most appointments per month
-- (assuming you want to see the total appointments per doctor in a specific month)
SELECT
    d.doctor_id,
    CONCAT(
        d.first_name,
        ' ',
        d.last_name
    ) AS doctor_name,
    COUNT(a.appointment_id) AS total_appointments,
    MONTH(a.appointment_date) AS appointment_month
FROM doctors d
    LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY
    d.doctor_id,
    d.first_name,
    d.last_name,
    appointment_month
ORDER BY total_appointments DESC;

-- 6. List specialties with the most cancelled appointments per month
SELECT
    s.specialty_id,
    s.name AS specialty_name,
    COUNT(a.appointment_id) AS total_cancelled_appointments,
    MONTH(a.appointment_date) AS appointment_month
FROM
    specialties s
    JOIN doctors d ON s.specialty_id = d.specialty_id
    JOIN appointments a ON d.doctor_id = a.doctor_id
WHERE
    a.status = 'Cancelled'
GROUP BY
    s.specialty_id,
    s.name,
    appointment_month
ORDER BY total_cancelled_appointments DESC;