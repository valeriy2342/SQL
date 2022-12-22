
-- Тригеры и Хранимые процедуры

USE hotel;

/* 1.Тригер меняющий поле gender в таблице users на u-(unknown) в случае если поле,
 при создании нового посетителя, осталось пустым 
*/

DROP TRIGGER if EXISTS check_user_gender;

DELIMITER //

CREATE TRIGGER check_user_gendert BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    IF NEW.gender = NULL THEN
        SET NEW.gender = u;
    END IF;
END//

DELIMITER ;

/* 2.Тригер меняющий поле firstname в таблице reviews на anonymous) в случае если поле,
 при создании нового отзыва, осталось пустым 
*/

DROP TRIGGER if EXISTS check_name;

DELIMITER //

CREATE TRIGGER check_name BEFORE INSERT ON reviews
FOR EACH ROW
begin
    IF NEW.firstname = NULL THEN
        SET NEW.firstname = anonymous;
    END IF;
END//

DELIMITER ;

/* Хранимая процедура для оперативного просмотра последних отзывов посетителей
 */


DROP PROCEDURE IF EXISTS sp_new_reviews;

delimiter //


CREATE PROCEDURE sp_new_reviews()
BEGIN

	SELECT 
	r.number_room AS 'Номер комнаты',
	r2.created_at AS 'Время создания отзыва',
	r2.body AS 'Текст отзыва'
FROM rooms r  
JOIN reviews r2  ON  r2.rooms_id=r.id

ORDER BY r2.created_at DESC;
	
END//

delimiter ;

CALL sp_new_reviews();

/* Хранимая процедура для вывода лучшей цены за номер со скидкой
 */



DROP PROCEDURE IF EXISTS sp_best_price;

delimiter //


CREATE PROCEDURE sp_best_price()
BEGIN

	SELECT 
	r.number_room AS 'Номер комнаты',
	r.price AS 'Цена',
	s.discount AS 'Скидка'
	FROM rooms r  
	JOIN stocks s ON s.rooms_id=r.id

	ORDER BY r.price;
	
END//

delimiter ;

CALL sp_best_price();
