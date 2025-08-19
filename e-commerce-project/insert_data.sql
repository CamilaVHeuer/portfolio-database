-- Active: 1754829977405@@127.0.0.1@3306@ecommerce_db

--Customers
INSERT INTO
    customers (first_name, last_name, email)
VALUES (
        'Ana',
        'Gomez',
        'ana@mail.com'
    ),
    (
        'Juan',
        'Lopez',
        'juan@mail.com'
    ),
    (
        'Camila',
        'Sanchez',
        'camila@mail.com'
    ),
    (
        'Pedro',
        'Martinez',
        'pedro@mail.com'
    ),
    (
        'Lucia',
        'Fernandez',
        'lucia@mail.com'
    ),
    (
        'Martin',
        'Rojas',
        'martin@mail.com'
    ),
    (
        'Carolina',
        'Diaz',
        'carolina@mail.com'
    ),
    (
        'Diego',
        'Ramirez',
        'diego@mail.com'
    ),
    (
        'Sofia',
        'Herrera',
        'sofia@mail.com'
    ),
    (
        'Mateo',
        'Silva',
        'mateo@mail.com'
    );

-- Products
INSERT INTO
    products (name, price, stock)
VALUES (
        'Bluetooth Headphones',
        15999.90,
        35
    ),
    (
        'Lenovo IdeaPad 15" Laptop',
        499999.00,
        12
    ),
    (
        'Logitech M170 Wireless Mouse',
        7999.00,
        50
    ),
    (
        'Samsung Galaxy A35 Smartphone',
        289999.00,
        20
    ),
    (
        'USB-C 25W Charger',
        14999.00,
        60
    ),
    (
        'Redragon Kumara Mechanical Keyboard',
        45999.00,
        25
    ),
    (
        'LG 24" Full HD Monitor',
        159999.00,
        18
    ),
    (
        'Ergonomic Gaming Chair',
        229999.00,
        8
    ),
    (
        'JBL Flip 6 Portable Speaker',
        99999.00,
        15
    ),
    (
        'Kingston NV2 1TB SSD',
        179999.00,
        22
    ),
    (
        'Logitech C920 HD Webcam',
        89999.00,
        10
    ),
    (
        'Epson L3250 Multifunction Printer',
        249999.00,
        7
    ),
    (
        'Amazfit Bip U Pro Smartwatch',
        74999.00,
        14
    ),
    (
        'Targus Laptop Backpack',
        34999.00,
        30
    ),
    (
        'Xiaomi Pad 6 Tablet',
        299999.00,
        9
    );

-- Orders
INSERT INTO
    orders (customer_id, date)
VALUES (1, '2025-08-19'),
    (2, '2025-08-19'),
    (3, '2025-08-18'),
    (4, '2025-08-18'),
    (5, '2025-08-17'),
    (6, '2025-08-17'),
    (7, '2025-08-16'),
    (8, '2025-08-16'),
    (9, '2025-08-15'),
    (10, '2025-08-15');

-- Order Details
INSERT INTO
    order_details (
        order_id,
        product_id,
        quantity
    )
VALUES (1, 1, 2), -- Customer 1 bought 2 Bluetooth Headphones
    (2, 2, 1), -- Customer 2 bought 1 Lenovo Laptop
    (3, 5, 3), -- Customer 3 bought 3 USB-C Chargers
    (4, 7, 1), -- Customer 4 bought 1 LG Monitor
    (5, 9, 2), -- Customer 5 bought 2 JBL Speakers
    (6, 10, 1), -- Customer 6 bought 1 Kingston SSD
    (7, 13, 1), -- Customer 7 bought 1 Amazfit Smartwatch
    (8, 14, 2), -- Customer 8 bought 2 Targus Backpacks
    (9, 3, 1), -- Customer 9 bought 1 Logitech Mouse
    (10, 15, 1);
-- Customer 10 bought 1 Xiaomi Tablet