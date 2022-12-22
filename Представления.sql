
-- Представления

USE hotel;

-- 1. Представление которое показывает информацию о будущем бронировании номеров

CREATE OR REPLACE VIEW users_booking
AS
SELECT 
u.firstname AS 'Имя',
u.lastname AS 'Фамилия',
u.phone AS 'Телефон',
u.rooms_id AS 'Номер комнаты',
b.check_in AS 'Заезд',
b.check_out AS 'Выезд'
FROM users u 
JOIN booking b ON u.id = b.users_id
WHERE b.check_in > CURTIME();

-- исполнение

SELECT * FROM users_booking; 

-- 2. Представление показывающие будущие скидки на номера, их категорию, цены без учета скидки

CREATE OR REPLACE VIEW rooms_stocks
AS
SELECT 
r.number_room AS 'Номер комнаты',
r.room_category AS 'Категория',
r.price AS 'Цена без скидки',
s.discount AS 'Скидка',
s.beginning_discount AS 'начало акции'
FROM rooms r  
JOIN stocks s  ON r.id = s.rooms_id
WHERE s.beginning_discount > CURTIME();

-- исполнение

SELECT * FROM rooms_stocks;