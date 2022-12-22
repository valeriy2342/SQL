USE hotel;

-- Из за того что таблицы заполнялись автоматически, есть небольшое несовпадение данных в выборках. 
-- Если бы данные заполнялись в ручную, этих нюансов бы небыло.

-- 1. Найти посетителей категории номеров Люкс в 2022 году

SELECT 
	u.firstname AS 'Имя', 
	u.lastname AS 'Фамилия', 
	r.number_room AS 'Номер комнаты',
	r.room_category AS 'Категория номера',
	v.check_in AS 'Заезд'
FROM users u  
JOIN rooms r ON  u.rooms_id=r.id
JOIN visitors v ON u.id=v.users_id 

WHERE r.room_category='luxury' AND v.check_in LIKE '2022%';


-- 2. Посчитать количество посетителей 4х местных номеров с 2010 по 2022 год у которых была скидка 15%

SELECT 
	COUNT(*)*4 AS 'Посетители'
FROM users u  
JOIN rooms r ON u.rooms_id=r.id
JOIN stocks s ON s.rooms_id=r.id 
JOIN visitors v ON v.users_id=u.id 
WHERE (v.check_in > '2010-07-22 23:15:48' AND v.check_in < '2022-06-27 00:06:32') AND  s.discount='15%' AND r.room_capacity=4;


-- 3. Найти посетителей которые были в отеле ранее и заказали номер в будущем

SELECT 
	u.firstname  AS 'Имя', 
	u.lastname AS 'Фамилия', 
	v.check_in AS 'Прошлый заезд',
	b.check_in AS 'Будущий заезд'
FROM users u  
JOIN visitors v ON u.id=v.users_id
JOIN booking b ON u.id=b.users_id
WHERE v.users_id=b.users_id; 
	
--  4. Сколько мужчин и сколько женщин купили питание все включено

SELECT CASE (gender)
        WHEN 'm' THEN 'Мужчины'
        WHEN 'f' THEN 'Женщины'
    	END AS 'Результат', COUNT(*) AS 'Колличество'
FROM users u  
JOIN nutrition n
WHERE u.id = n.users_id AND n.room_category='all_inclusive'
GROUP BY gender;

-- 5. Вывести самый дорогой номер отеля у которого самая маленькая скидка

SELECT 
	r.number_room AS 'Номер комнаты',
	MAX(r.price) AS 'Цена',
	s.discount AS 'Скидка'
FROM rooms r 
JOIN stocks s ON r.id=s.rooms_id
WHERE s.discount='5%';

-- 6. Вывести всех посетителей написавших отзыв о номерах категории стандарт с 2000 по 2022 год

SELECT 
	r2.firstname AS 'Имя',
	r2.lastname AS 'Фамилия',
	r2.created_at AS 'Время создания отзыва',
	r.number_room AS 'Номер комнаты'	
FROM rooms r 
JOIN reviews r2 ON r.id=r2.rooms_id
JOIN users u ON u.id=r2.users_id
WHERE r.room_category='standard' AND (r2.created_at > '2000-07-11 22:43:19' AND r2.created_at < '2022-03-22 16:47:32')
GROUP BY r.number_room;