-- Script para insertar datos iniciales en la base de datos de una clínica médica
-- Insertar especialidades
INSERT INTO
    specialties (name, description)
VALUES (
        'Cardiología',
        'Diagnóstico y tratamiento de enfermedades del corazón. Atención a adolescentes y adultos.'
    ),
    (
        'Pediatría',
        'Atención médica a bebés, niños y adolescentes.'
    ),
    (
        'Dermatología',
        'Estudio y tratamiento de enfermedades de la piel. Atención a todas las edades.'
    ),
    (
        'Ginecología',
        'Atención médica general a adultas y adolescentes.'
    ),
    (
        'Ginecología y obstetricia',
        'Atención médica especializada en el embarazo y fertilidad, a adultas y adolescentes'
    ),
    (
        'Oftalmología',
        'Diagnóstico y tratamiento de enfermedades oculares.'
    );

-- Insertar médicos
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

-- Insertar pacientes
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

-- Insertar consultorios
INSERT INTO
    rooms (room_number, floor)
VALUES ('101', 1),
    ('102', 1),
    ('201', 2),
    ('301', 3),
    ('401', 4),
    ('402', 4);

-- Insertar turnos médicos
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
        'Chequeo anual.'
    ),
    (
        2,
        2,
        2,
        '2025-08-13',
        '14:30:00',
        'Completed',
        'Consulta de control pediátrico.'
    ),
    (
        3,
        3,
        3,
        '2025-08-14',
        '11:15:00',
        'Cancelled',
        'Paciente reprograma cita.'
    ),
    (
        1,
        3,
        3,
        '2025-08-15',
        '10:00:00',
        'Scheduled',
        'Consulta dermatológica por alergia.'
    ),
    (
        5,
        4,
        4,
        '2025-08-16',
        '13:00:00',
        'Scheduled',
        'Control ginecológico anual.'
    ),
    (
        5,
        5,
        5,
        '2025-08-17',
        '15:30:00',
        'Scheduled',
        'Consulta de fertilidad.'
    ),
    (
        4,
        6,
        1,
        '2025-08-18',
        '12:45:00',
        'Scheduled',
        'Revisión de vista anual.'
    ),
    (
        6,
        5,
        4,
        '2025-08-19',
        '08:30:00',
        'Scheduled',
        'Chequeo de rutina.'
    ),
    (
        2,
        6,
        1,
        '2025-08-20',
        '10:15:00',
        'Scheduled',
        'Consulta de alergias.'
    ),
    (
        7,
        3,
        3,
        '2025-08-21',
        '11:45:00',
        'Scheduled',
        'Consulta dermatológica por erupción cutánea.'
    ),
    (
        8,
        2,
        2,
        '2025-08-22',
        '09:30:00',
        'Scheduled',
        'Control pediátrico de crecimiento.'
    ),
    (
        3,
        4,
        4,
        '2025-08-23',
        '14:00:00',
        'Scheduled',
        'Consulta ginecológica de rutina.'
    ),
    (
        4,
        1,
        1,
        '2025-08-24',
        '16:00:00',
        'Scheduled',
        'Chequeo cardiológico.'
    );