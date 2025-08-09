-- Script to insert initial data into the medical clinic database
-- Insert specialties
INSERT INTO
    specialties (name, description)
VALUES (
        'Cardiology',
        'Diagnosis and treatment of heart diseases. Care for adolescents and adults.'
    ),
    (
        'Pediatrics',
        'Medical care for babies, children, and adolescents.'
    ),
    (
        'Dermatology',
        'Study and treatment of skin diseases. Care for all ages.'
    ),
    (
        'Gynecology',
        'General medical care for adult and adolescent women.'
    ),
    (
        'Gynecology and Obstetrics',
        'Specialized medical care in pregnancy and fertility, for adult and adolescent women.'
    ),
    (
        'Ophthalmology',
        'Diagnosis and treatment of eye diseases.'
    );

-- Insert doctors
INSERT INTO
    doctors (
        first_name,
        last_name,
        specialty_id,
        phone,
        email
    )
VALUES (
        'Juan',
        'Pérez',
        1,
        '1122334455',
        'juan.perez@clinic.com'
    ),
    (
        'María',
        'García',
        2,
        '1133445566',
        'maria.garcia@clinic.com'
    ),
    (
        'Luis',
        'Martínez',
        3,
        '1144556677',
        'luis.martinez@clinic.com'
    ),
    (
        'Ana',
        'Sánchez',
        4,
        '1155667788',
        'ana.sanchez@clinic.com'
    ),
    (
        'Carlos',
        'Ramírez',
        5,
        '1166778899',
        'carlos.ramirez@clinic.com'
    ),
    (
        'Lucía',
        'Torres',
        6,
        '1177889900',
        'lucia.torres@clinic.com'
    );

-- Insert patients
INSERT INTO
    patients (
        first_name,
        last_name,
        birth_date,
        phone,
        email,
        address
    )
VALUES (
        'Ana',
        'López',
        '1985-03-12',
        '1155667788',
        'ana.lopez@gmail.com',
        'Belgrano 123 CABA'
    ),
    (
        'Carlos',
        'Gómez',
        '1990-07-25',
        '1166778899',
        'carlos.gomez@gmail.com',
        'Av. Siempre Viva 456 CABA'
    ),
    (
        'Lucía',
        'Fernández',
        '2002-11-02',
        '1177889900',
        'lucia.fernandez@gmail.com',
        'Pasaje Las Flores 789 CABA'
    ),
    (
        'Pedro',
        'Díaz',
        '1978-05-30',
        '1188990011',
        'pedro.diaz@gmail.com',
        'Av Pueyrredon 123 CABA'
    ),
    (
        'Sofía',
        'Martínez',
        '1995-09-15',
        '1199001122',
        'sofia.martinez@gmail.com',
        'Av. Libertador 456 CABA'
    ),
    (
        'Javier',
        'Ramírez',
        '1988-12-20',
        '1100112233',
        'javier.ramirez@gmail.com',
        'Av. Corrientes 789 CABA'
    ),
    (
        'Camila',
        'Sánchez',
        '2000-04-10',
        '1111223344',
        'camila.sanchez@gmail.com',
        'Av. Santa Fe 123 CABA'
    ),
    (
        'Diego',
        'Torres',
        '1975-08-05',
        '1122334455',
        'diego.torres@gmail.com',
        'Av. Cabildo 456 CABA'
    ),
    (
        'Elena',
        'Vega',
        '1982-02-14',
        '1133557799',
        'elena.vega@gmail.com',
        'Av. Libertador 789 CABA'
    );

-- Insert rooms
INSERT INTO
    rooms (room_number, floor)
VALUES ('101', 1),
    ('102', 1),
    ('201', 2),
    ('301', 3),
    ('401', 4),
    ('402', 4);

-- Insert medical appointments
INSERT INTO
    appointments (
        patient_id,
        doctor_id,
        room_id,
        appointment_date,
        appointment_time,
        status,
        notes
    )
VALUES (
        1,
        1,
        1,
        '2025-08-12',
        '09:00:00',
        'Scheduled',
        'Annual check-up.'
    ),
    (
        2,
        2,
        2,
        '2025-08-13',
        '14:30:00',
        'Completed',
        'Pediatric follow-up.'
    ),
    (
        3,
        3,
        3,
        '2025-08-14',
        '11:15:00',
        'Cancelled',
        'Patient rescheduled appointment.'
    ),
    (
        1,
        3,
        3,
        '2025-08-15',
        '10:00:00',
        'Scheduled',
        'Dermatology appointment for allergy.'
    ),
    (
        5,
        4,
        4,
        '2025-08-16',
        '13:00:00',
        'Scheduled',
        'Annual gynecological check-up.'
    ),
    (
        5,
        5,
        5,
        '2025-08-17',
        '15:30:00',
        'Scheduled',
        'Fertility consultation.'
    ),
    (
        4,
        6,
        1,
        '2025-08-18',
        '12:45:00',
        'Scheduled',
        'Annual eye exam.'
    ),
    (
        6,
        5,
        4,
        '2025-08-19',
        '08:30:00',
        'Scheduled',
        'Routine check-up.'
    ),
    (
        2,
        6,
        1,
        '2025-08-20',
        '10:15:00',
        'Scheduled',
        'Allergy consultation.'
    ),
    (
        7,
        3,
        3,
        '2025-08-21',
        '11:45:00',
        'Scheduled',
        'Dermatology appointment for skin rash.'
    ),
    (
        8,
        2,
        2,
        '2025-08-22',
        '09:30:00',
        'Scheduled',
        'Pediatric growth check.'
    ),
    (
        3,
        4,
        4,
        '2025-08-23',
        '14:00:00',
        'Scheduled',
        'Routine gynecological appointment.'
    ),
    (
        4,
        1,
        1,
        '2025-08-24',
        '16:00:00',
        'Scheduled',
        'Cardiology check-up.'
    ),
    (
        1,
        2,
        2,
        '2025-07-25',
        '17:30:00',
        'Cancelled',
        'Follow-up appointment.'
    ),
    (
        5,
        3,
        3,
        '2025-07-28',
        '09:00:00',
        'Cancelled',
        'Dermatology check-up.'
    ),
    (
        7,
        4,
        4,
        '2025-07-27',
        '12:30:00',
        'Completed',
        'Gynecological check-up.'
    ),
    (
        8,
        3,
        3,
        '2025-07-29',
        '10:00:00',
        'Cancelled',
        'Dermatology check-up.'
    ),
    (
        1,
        4,
        4,
        '2025-07-27',
        '13:30:00',
        'Completed',
        'Gynecological check-up.'
    ),
    (
        6,
        6,
        1,
        '2025-07-28',
        '12:00:00',
        'Completed',
        'Routine check-up.'
    ),
    (
        9,
        1,
        1,
        '2025-08-04',
        '11:00:00',
        'Completed',
        'Routine check-up.'
    );