-- Створення тестової таблиці
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price NUMERIC(10, 2),
    discount DECIMAL(4, 2)
);

-- Вставка тестових даних
INSERT INTO products (name, price, discount) VALUES
    ('Ноутбук', 25000.75, 0.15),
    ('Смартфон', 12500.00, 0.10),
    ('Навушники', 3500.00, 0.05),
    ('Планшет', 15000.00, 0.12),
    ('Клавіатура', 20000.43, NULL);
    
  -- Створення тестової таблиці замовлень 
CREATE TABLE orders ( 
    id SERIAL PRIMARY KEY, 
    customer_id INTEGER, 
    order_date DATE, 
    total_amount DECIMAL(10, 2), 
    region VARCHAR(50) 
); 

-- Вставка тестових даних 
INSERT INTO orders (customer_id, order_date, total_amount, region) VALUES 
    (1, '2023-01-15', 2500.00, 'Київ'), 
    (2, '2023-01-18', 1800.50, 'Львів'), 
    (1, '2023-02-05', 3250.75, 'Львів'), 
    (3, '2023-02-10', 5000.00, 'Одеса'), 
    (2, '2023-03-01', 1250.25, 'Львів'), 
    (4, '2023-03-15', 4300.00, 'Харків'), 
    (1, '2023-03-20', 2100.50, 'Київ'), 
    (3, '2023-04-05', 3850.75, 'Одеса');
    
  -- Створення тестової таблиці 
CREATE TABLE employees ( 
    id SERIAL PRIMARY KEY, 
    first_name VARCHAR(50), 
    last_name VARCHAR(50), 
    email VARCHAR(100), 
    bio TEXT, 
    department VARCHAR(50) 
); 

-- Вставка тестових даних 
INSERT INTO employees (first_name, last_name, email, bio, department) VALUES 
    ('Олександр', 'Петренко', 'oleksandr.petrenko@example.com', 'Досвід роботи 5 років у розробці програмного забезпечення', 'IT'), 
    ('Марія', 'Коваленко', 'maria.kovalenko@example.com', 'Спеціаліст з маркетингу з досвідом роботи у великих компаніях', 'Маркетинг'), 
    ('Іван', 'Сидоренко', 'ivan.sydorenko@example.com', 'Має ступінь магістра в галузі фінансів', 'Фінанси'), 
    ('Олена', 'Шевченко', 'olena.shevchenko@example.com', ' Досвідчений HR-менеджер ', 'HR'), 
    ('Андрій', 'Мельник', 'andrii.melnyk@example.com', 'Працює в компанії з 2018 року', 'продажі');
    
  -- Створення тестової таблиці
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    event_name VARCHAR(100),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    registration_deadline DATE
);

-- Вставка тестових даних
INSERT INTO events (event_name, start_date, end_date, registration_deadline) VALUES
    ('Конференція з розробки ПЗ', '2023-06-15 09:00:00', '2023-06-17 18:00:00', '2023-06-01'),
    ('Семінар з маркетингу', '2023-07-10 10:00:00', '2023-07-10 16:00:00', '2023-07-05'),
    ('Тренінг з управління проектами', '2023-08-05 09:30:00', '2023-08-07 17:30:00', '2023-07-25'),
    ('Воркшоп з дизайну', '2023-09-12 13:00:00', '2023-09-12 18:00:00', '2023-09-08'),
    ('Хакатон', '2026-10-20 18:00:00', '2026-10-22 20:00:00', '2027-10-10');
   
  -- Створення тестової таблиці
CREATE TABLE customer_data (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT,
    last_purchase_date DATE,
    total_purchases INTEGER
);

-- Вставка тестових даних з NULL значеннями
INSERT INTO customer_data (name, email, phone, address, last_purchase_date, total_purchases) VALUES
    ('Андрій Іваненко', 'andrii@example.com', '+380501234567', 'вул. Шевченка, 10, Київ', '2023-03-15', 5),
    ('Олена Петренко', NULL, '+380671234567', NULL, '2023-04-10', 3),
    ('Максим Сидоренко', 'maksym@example.com', NULL, 'вул. Франка, 25, Львів', NULL, 0),
    ('Ірина Коваль', 'iryna@example.com', '+380931234567', 'вул. Сагайдачного, 5, Одеса', '2023-05-20', NULL),
    ('Тарас Шевченко', NULL, NULL, NULL, NULL, NULL);
    
  -- Створення таблиці з JSONB полем
CREATE TABLE product_catalog (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    attributes JSONB,
    tags JSONB
);

-- Вставка тестових даних
INSERT INTO product_catalog (name, attributes, tags) VALUES
    ('Смартфон Galaxy S21', '{"brand": "Samsung", "model": "S21", "specs": {"screen": "6.2 inch", "camera": "64MP", "battery": "4000mAh", "memory": {"ram": "8GB", "storage": "128GB"}}}', '["electronics", "smartphones", "android"]'),
    ('Ноутбук MacBook Pro', '{"brand": "Apple", "model": "MacBook Pro 16", "specs": {"screen": "16 inch", "processor": "Apple M1 Pro", "memory": {"ram": "16GB", "storage": "512GB"}}}', '["electronics", "laptops", "apple"]'),
    ('Бездротові навушники AirPods', '{"brand": "Apple", "model": "AirPods Pro", "specs": {"battery": "24h with case", "noise_cancellation": true}}', '["electronics", "audio", "wireless"]'),
    ('Смарт-годинник Versa', '{"brand": "Fitbit", "model": "Versa 3", "specs": {"screen": "1.58 inch", "battery": "6+ days", "gps": true}}', '["electronics", "wearables", "fitness"]'),
    ('Ігрова консоль PS5', '{"brand": "Sony", "model": "PlayStation 5", "specs": {"storage": "825GB SSD", "resolution": "4K", "fps": 120}}', '["electronics", "gaming", "consoles"]');
    
   -- Створення таблиці з масивами
CREATE TABLE products_with_categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    categories TEXT[],
    specifications VARCHAR(100)[]
);

-- Вставка тестових даних
INSERT INTO products_with_categories (name, price, categories, specifications)
VALUES
    ('Смартфон XYZ', 12500.00, ARRAY['Електроніка', 'Смартфони', 'Гаджети'], ARRAY['Екран 6.5"', 'RAM 8GB', 'Камера 48MP']),
    ('Ноутбук ABC', 28000.00, ARRAY['Електроніка', 'Комп''ютери', 'Ноутбуки'], ARRAY['Екран 15.6"', 'Intel i7', 'SSD 512GB']),
    ('Навушники QWE', 3500.00, ARRAY['Електроніка', 'Аудіо'], ARRAY['Bluetooth 5.0', 'Час роботи 24г']),
    ('Планшет RST', 15000.00, ARRAY['Електроніка', 'Планшети', 'Гаджети'], ARRAY['Екран 10"', 'RAM 6GB', 'Камера 12MP']),
    ('Кавомашина UVW', 9500.00, ARRAY['Техніка для дому', 'Кухонна техніка'], ARRAY['Тиск 15 бар', 'Резервуар 1.5л']);