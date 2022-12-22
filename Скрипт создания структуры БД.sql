-- Создаю базу Hotel

DROP DATABASE IF EXISTS hotel;
CREATE DATABASE hotel;
USE hotel;

-- Создаю таблицу номеров отеля, номер комнаты, категорию и вместимость номера

DROP TABLE IF EXISTS rooms;
CREATE TABLE rooms (
	id SERIAL PRIMARY KEY,
	number_room BIGINT UNSIGNED NOT NULL COMMENT 'Номер комнаты', -- номер комнаты совпадает с id
	room_category ENUM('luxury', 'junior suite', 'standard', 'economy') COMMENT 'Категория номера',
	room_capacity TINYINT UNSIGNED COMMENT 'Вместимость номера',
	price FLOAT, -- цена за номер
	
	INDEX rooms_room_category_idx(room_category),
	INDEX rooms_room_room_capacity_idx(room_capacity),
	INDEX rooms_room_price_idx(price)
);
	
-- Создаю таблицу базы посетителей отеля(Прошлых и будущих посетителей)

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(100) COMMENT 'Имя',
    lastname VARCHAR(100) COMMENT 'Фамилия',
    email VARCHAR(100) UNIQUE,
    phone BIGINT,
    gender CHAR(1),
    birthday DATE,
	rooms_id BIGINT UNSIGNED NOT NULL, -- Ключ по номеру комнаты в которой жил или будет жить гость отеля
    hometown VARCHAR(100),
    INDEX visitors_lastname_capacity_idx(firstname, lastname), -- Поиск по Имя Фамилия
    INDEX visitors_phone_idx(phone), -- Поиск по номеру телефона
    
    FOREIGN KEY (rooms_id) REFERENCES rooms(id) ON UPDATE CASCADE ON DELETE CASCADE
);


DROP TABLE IF EXISTS visitors;
CREATE TABLE visitors (
	id SERIAL PRIMARY KEY,
	users_id BIGINT UNSIGNED NOT NULL, -- Ключ по id песетителя в таблице user
    check_in DATETIME COMMENT 'День заселения',
    check_out DATETIME COMMENT 'Выезд',
    INDEX visitors_check_in_check_out_idx(check_in, check_out), -- Поиск по времени заселения и выезда
    
    FOREIGN KEY (users_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Создаю таблицу фотоальбомов отеля

DROP TABLE IF EXISTS `photo_albums_hotel`;
CREATE TABLE `photo_albums_hotel` (
	`id` SERIAL,
	`name` varchar(255) DEFAULT NULL,
    `room_id` BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (room_id) REFERENCES rooms(id) ON UPDATE CASCADE ON DELETE SET NULL,
  	PRIMARY KEY (`id`)
);

-- Создаю таблицу фотографий номеров

DROP TABLE IF EXISTS `rooms_photos`;
CREATE TABLE `rooms_photos` (
	id SERIAL PRIMARY KEY,
	`album_id` BIGINT UNSIGNED NOT NULL, -- Ключ по альбому отеля
	`room_id` BIGINT UNSIGNED DEFAULT NULL, -- Ключ по номеру комнаты отеля
	INDEX rooms_photos_room_id_idx(room_id), -- индексация по номеру комнаты
	
	FOREIGN KEY (room_id) REFERENCES rooms(id) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (album_id) REFERENCES photo_albums_hotel(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Создаю таблицу бронирования номеров

DROP TABLE IF EXISTS booking;
CREATE TABLE booking (
	id SERIAL PRIMARY KEY,
	users_id BIGINT UNSIGNED NOT NULL, -- Ключ по id песетителя в таблице user
    check_in DATETIME COMMENT 'День заселения',
    check_out DATETIME COMMENT 'Выезд',
    INDEX booking_check_in_check_out_idx(check_in, check_out), -- Поиск по времени заселения и выезда
    
    FOREIGN KEY (users_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Создаю таблицу отзывов посетителей

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
	id SERIAL PRIMARY KEY,
	body TEXT, -- текст отзыва
	rooms_id BIGINT UNSIGNED NOT NULL, -- вторичный ключ на номер комнаты
	users_id BIGINT UNSIGNED NOT NULL, -- вторичный ключ на таблицу с базой гостей отеля
	created_at DATETIME DEFAULT NOW(), -- время создания отзыва
	firstname VARCHAR(100) COMMENT 'Имя', -- Данные оставившего отзыв если он не заселслся в отель 
    lastname VARCHAR(100) COMMENT 'Фамилия', -- Данные оставившего отзыв если он не заселслся в отель 
    phone BIGINT, -- Данные оставившего отзыв если он не заселслся в отель 
	INDEX reviews_created_at_idx(created_at), -- Индексация по времени создания отзыва
    
	FOREIGN KEY (rooms_id) REFERENCES rooms(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (users_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
	
);

-- Создаю таблицу видов питания закрепленных за посетителем

DROP TABLE IF EXISTS nutrition;
CREATE TABLE nutrition (
	id SERIAL PRIMARY KEY,
	`room_category` ENUM('all_inclusive', 'breakfast_dinner', 'breakfast_only', 'without_food'), -- Вид питания (Все включино, Завтрак- Ужин, Завтрак, Без питания)
	users_id BIGINT UNSIGNED NOT NULL, -- Ключ по id песетителя в таблице user
	`check_in` DATETIME, -- Дата начала пакета питания
	`exit` DATETIME, -- Дата окончания пакета питания
	
	FOREIGN KEY (users_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
	
);

-- Создаю таблицу акция и скидок на номера

DROP TABLE IF EXISTS stocks;
CREATE TABLE stocks (
	id SERIAL PRIMARY KEY,
	`discount` ENUM('0%', '5%', '10%', '15%', '20%'), -- сумма скидки в процентах
	rooms_id BIGINT UNSIGNED NOT NULL, -- вторичный ключ для поиска по номеру комнаты
	`beginning_discount` DATETIME, -- Дата начала акции
	`end_discount` DATETIME, -- Дата окончания акции
	INDEX stocks_beginning_discount_idx(beginning_discount), -- Индексация по времени начала акции
	
	FOREIGN KEY (rooms_id) REFERENCES rooms(id) ON UPDATE CASCADE ON DELETE CASCADE
	
);