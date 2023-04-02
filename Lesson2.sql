/* Задание 1
Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.

[mysql]
user=root
password=2010

1. СУБД MySQL установил.
2. Файл my.cnf разместил в директории mysql server
3. Захожу без пароля
*/

/* Задание 2
Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
*/

-- Создаю базу

CREATE DATABASE example;

-- Использую базу

USE example;

-- Создаю таблицу users

CREATE TABLE users (
	id INT PRIMARY KEY,
	name VARCHAR(255)
);


/* Задание 3 
Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
*/

-- Создаю база sample

CREATE DATABASE sample;

-- В консоли

mysqldump example > esdump.SQL

mysql sample < esdump.SQL

/* 4 Задание 

(по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы
*/

-- В консоли

mysqldump mysql help_keyword --where="1 limit 100" > esdump.SQL

