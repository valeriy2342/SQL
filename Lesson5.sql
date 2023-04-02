/*Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»

Задание 1 
Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
*/

UPDATE users SET created_at = NOW(), updated_at = NOW() WHERE created_at is NULL or updated_at is NULL;

 /* Задание 2
Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
*/

-- преобразу. колонку в VARCHAR

ALTER TABLE users MODIFY COLUMN created_at varchar(150);
ALTER TABLE users MODIFY COLUMN updated_at varchar(150);

-- преобразую данные в формат DATETIME из строки 

UPDATE users SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'); 
UPDATE users SET updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');

-- преобразу. колонку обратно в DATETIME


ALTER TABLE users MODIFY created_at DATETIME DEFAULT CURRENT_TIMESTAMP; 
ALTER TABLE users MODIFY updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;


 /* Задание 3
В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.
*/
-- Очищаю таблицу storehouses_products от данных

truncate storehouses_products;

-- Наполняю таблицу storehouses_products  данными

INSERT INTO storehouses_products (id, storehouse_id, product_id, value, created_at, updated_at ) 
values 
(1, 2, 45, 1, '2022-12-28 21:14:16', '2022-11-28 21:14:12'),
(2, 5, 56, 2, '2022-11-28 21:14:16', '2022-11-28 21:14:11'),
(3, 7, 87, 3, '2021-11-28 21:14:16', '2022-11-28 21:14:10'),
(4, 12, 234, 1, '2020-11-28 21:14:16', '2022-11-28 21:14:15'),
(5, 56, 32, 0, '2022-11-23 21:14:16', '2022-11-28 21:14:17');

-- Решение 

SELECT * FROM storehouses_products ORDER BY CASE WHEN value = 0 THEN TRUE ELSE FALSE END, value;

/* Задание 3
(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий (may, august)
*/

SELECT id, name, birthday_at FROM users WHERE (birthday_at LIKE '%may%' OR birthday_at LIKE '%august%');

/*Практическое задание теме «Агрегация данных»
 Задание 1
Подсчитайте средний возраст пользователей в таблице users.
*/

ALTER TABLE users ADD age INT NOT NULL;

UPDATE users SET age = TIMESTAMPDIFF(YEAR, birthday_at, NOW());

SELECT AVG(age) FROM users;

/*Задание 2
Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/

SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day, COUNT(*) AS total FROM users GROUP BY day ORDER BY total DESC;

/*Задание 3
Подсчитайте произведение чисел в столбце таблицы
*/

SELECT EXP(SUM(LN(id))) FROM storehouses_products;