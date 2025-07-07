-- Вход:
/*

С:/xampp/mysql/bin> mysql -uroot
С:/xampp/mysql/bin> mysql -u root

С:/xampp/mysql/bin> mysql -uroot -proot
С:/xampp/mysql/bin> mysql -u root -p root

-u: user
-p: password

*/

-- просмотр всех БД
show databases;

-- создание БД
create database myTestDB;

use mytestdb

-- выбрать БД
use mytestdb

-- показать все таблицы данной БД
show tables;

-- создать таблицу
-- primary key - ключ
-- auto_increment - identity
-- int(4) - тип int, кол-во байт: 4
create table authors(au_id int(4) primary key auto_increment, au_fname varchar(20), au_lname varchar(20), age int(4), address varchar(20));

-- показать поля таблицы
show fields from authors;

-- выход из MySQL
exit

