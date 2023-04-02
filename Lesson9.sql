/* Практическое задание по теме “Транзакции, переменные, представления”

Задание 1

В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.
*/


START TRANSACTION;

INSERT INTO sample.users 
SELECT id, name 
FROM shop.users 
WHERE id = 1;

DELETE FROM shop.users
WHERE id=1; 

COMMIT;

SELECT * FROM shop.users;
SELECT * FROM sample.users;

/*

Задание 2
Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.
*/


CREATE VIEW performance AS SELECT products.name AS product, catalogs.name AS catalog FROM products
LEFT JOIN catalogs ON products.catalog_id = catalogs.id;

SELECT * FROM performance;

/*Практическое задание по теме “Хранимые процедуры и функции, триггеры"
 
 Задание 1
 
Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/

DROP PROCEDURE IF EXISTS hello;
DELIMITER //
CREATE PROCEDURE hello()
BEGIN
	CASE 
		WHEN CURTIME() BETWEEN '06:00:00' AND '12:00:00' THEN
			SELECT 'Доброе утро!';
		WHEN CURTIME() BETWEEN '12:00:00' AND '18:00:00' THEN
			SELECT 'Добрый день!';
		WHEN CURTIME() BETWEEN '18:00:00' AND '00:00:00' THEN
			SELECT 'Добрый вечер!';
		ELSE
			SELECT 'Доброй ночи!';
	END CASE;
END //
DELIMITER ;

CALL hello();


