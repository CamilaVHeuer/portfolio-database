--Queries that address the objectives of the clinic management system
-- Gestion de la informacion de la clinica: consultas para acceder y organizar datos esenciales, como listas de pacientes, doctores y citas.
-- 1.Listar todos los pacientes ordenados por fecha de nacimiento.

SELECT * FROM patients ORDER BY birth_date ASC;

-- 2.Mostrar todos los doctores junto a su especialidad.
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

-- 3.Consultar todas las citas programadas para una fecha específica.
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
    a.appointment_date = '2025-08-12';

-- Monitoreo y desempeño de citas: consultas para rastrear el estado de las citas, identificar cancelaciones y programar seguimientos.
-- 1.Contar el número de citas programadas, completadas y canceladas.
SELECT a.status, COUNT(*) AS total
FROM appointments a
GROUP BY
    a.status;
-- 2.Listar las citas canceladas
SELECT a.* FROM appointments a WHERE a.status = 'cancelled';
-- 3.Listar las citas programadas para cada doctor y su especialidad
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

-- 4.Mostrar cuántos turnos fueron completados por especialidad
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

-- Gestión de la disponibilidad de doctores y salas: consultas para verificar la disponibilidad de doctores y salas, facilitando la programación eficiente de citas.
-- 1.Listar la disponibilidad de doctores para una fecha específica (asumiendo que un doctor puede tener múltiples citas en un día, pero no a la misma hora)
SELECT d.doctor_id, CONCAT(
        d.first_name, ' ', d.last_name
    ) AS doctor_name, a.appointment_date, a.appointment_time, a.status
FROM doctors d
    LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
WHERE
    a.appointment_date = '2025-08-12'
    AND a.status = 'Scheduled'
ORDER BY d.doctor_id, a.appointment_time;
-- 2.Listar la disponibilidad de salas para una fecha específica
SELECT r.room_id, r.room_number, r.floor, a.appointment_date, a.appointment_time, a.status
FROM rooms r
    LEFT JOIN appointments a ON r.room_id = a.room_id
WHERE
    a.appointment_date = '2025-08-12'
    AND a.status = 'Scheduled'
ORDER BY r.room_id, a.appointment_time;

--Analisis estrategico de citas: consultas para identificar tendencias en la programación de citas, como horas pico y especialidades más solicitadas.
-- 1.Identificar las horas pico de citas programadas
SELECT
    HOUR(appointment_time) AS appointment_hour,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY
    appointment_hour
ORDER BY appointment_hour;
-- 2.Identificar dias de la semana con más citas programadas
SELECT
    DAYNAME(appointment_date) AS appointment_day,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY
    appointment_day
ORDER BY FIELD(
        appointment_day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    );
-- 3.Listar las especialidades más solicitadas por número de citas programadas
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
-- 4.Listar los pacientes con más citas programadas
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

-- 5.Listar los doctores con más citas
SELECT
    d.doctor_id,
    CONCAT(
        d.first_name,
        ' ',
        d.last_name
    ) AS doctor_name,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors d
    LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY
    d.doctor_id,
    d.first_name,
    d.last_name
ORDER BY total_appointments DESC;