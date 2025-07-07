--	Урок №1

-- создать БД 
create database KramarenkoLibrary

-- удалить БД 
drop database KramarenkoLibrary

-- использовать БД 
use KramarenkoLibrary

/* создать таблицу
создание столбца: <имя> <тип>
identity - "оператор ++"
primary key - ключевое поле (без повторений) начало с 1
*/
create table authors (id int identity primary key, firstname varchar(20), 
lastname varchar(20), age int, adress varchar(20))

drop table authors

/* запрос данных таблицы
* - все элементы (столбцы)
вывод определённых стролбцов: <столбец1>, <столбец2>, ...
*/
select * from authors

/* показ двух столбцов */
select id, firstname from authors 

/* добавить ряд в таблицу
(поле1, поле2, ...)
values
(значение1, значение2, ...)
*/
insert into authors
(firstname, lastname, age, adress)
values
('Alex', 'Petrov', 23, 'Donetsk')

/* удалить элементы
- delete from authors - удалить всё
- where id = 6 (удалить ряд с id равным 6)
- where (условие)
*/
delete from authors
where id = 6 

/* обновить / переименовать
 set <поле1>=<значение1>, ...
 where "условие" 
*/
update authors
set firstname = 'Vasya', lastname = 'Pupkin'
where id = 5










--	Урок №2

use pubs
select * from authors

select au_fname, au_lname, state,contract from authors
where (state = 'CA' or state = 'UT') and contract = 1

--  SQL - structured query language










--	№3

use pubs
select * from titles
where price > 10 and price < 20

select * from titles
where price between 10 and 20

select * from titles
where price is NULL

select au_fname, au_lname, state,contract from authors
where (state = 'CA' or state = 'UT') and contract = 1

select au_fname, au_lname, state,contract from authors
where state in ('UT', 'KS', 'TN')

select state from authors

-- убрать повторяющиеся элементы
select distinct state from authors

-- первые 10 записей
select top 10 * from authors

-- первые 10% всех записей 
select top 10 percent * from authors

-- кол-во записей 
select count(*) as kolvo from authors
select count(*) kolvo from authors
select count(*) from authors
select count(*) [Количество записей] from authors

/* считает кол-во элементов ячейка которого не равна NULL */
select count(price) from titles

-- выводит: колво | max цена | min цена | avg цена | sum всех цен
select count(price), min(price),max(price),avg(price),sum(price) from titles










--	№4

use pubs

-- текущая дата и время
select getdate()

-- текущие: день, месяц, год
select day(getdate()),month(getdate()),year(getdate())

-- получить заданные: день, месяц, год (формат: '<month>-<day>-<year>')
select day('12-23-2012'),month('12-23-2012'),year('12-23-2012')

-- получить текущие: час, минуту, секунду, милисекунду
select datepart(hh, getdate()),datepart(mi, getdate()),
datepart(ss, getdate()),datepart(ms, getdate())

-- TimeSpan разница во времени
select datediff(dd,'10-12-1990', getdate())
select datediff(mm,'10-12-1990', getdate())
select datediff(yy,'10-12-1990', getdate())

-- title и год издания
select title, YEAR(pubdate) from titles

-- показать только те элементы, в котрых год больше 1991
select * from titles
where year(pubdate) > 1991

-- type: business, date: summer
select * from titles
where month(pubdate) between 5 and 9 and type = 'business'

-- type: business, date: summer
select * from titles
where month(pubdate) in (6, 7, 8) and type = 'business'

-- добавление времени к текущей дате (дни)
select dateadd(dd, 21, getdate())

-- добавление времени к текущей дате (год)
select dateadd(yy, 5, getdate())

-- добавить 2 месяца к дате бубликации книги, тип которой = 'business'
update titles
set pubdate = DATEADD(mm, 2, pubdate)
where type = 'business'

select title, pubdate from titles
where type = 'business'

-- вывод: название и длину названия
select title, len(title) from titles

-- вывод: название, первые 3 буквы названия и последние 5 букв из названия
select title, left(title, 3), right(title, 5) from titles

-- вывод: название и подстроку со 2-го по 5-ый символ включительно
select title, SUBSTRING(title, 2, 5) from titles

-- замена строки 'u' на '!'
select title, replace(title, 'u', '!') from titles

-- перевод в верхний/нижний регистр
select title, upper(title), lower(title) from titles

/*
% - много любых символов
_ - один любой символ
[abd] - перечисление разрешённых символов
*/
-- вывод всех названий, которые начинаются с буквы 's'
select title from titles
where title like 's%'

-- вывод всех названий, которые содержат подстроку 'and'
select title from titles
where title like '%and%'

-- вывод всех названий, которые содержат слова из 3-ёх букв
select title from titles
where title like '% ___ %'

-- вывод всех названий, которые начинаются с букв a, b, c, d, e, f
select title from titles
where title like '[abcdef]%'

-- вывод всех названий, которые начинаются с букв от a до n
select title from titles
where title like '[a-n]%'

-- вывод всех названий, которые НЕ начинаются с букв от o до z
select title from titles
where title like '[^o-z]%'

-- вывод всех авторов у которых имя начинается с гласной буквы
select * from authors
where au_fname like '[eyuioa]%'










--	№5

use pubs

-- объеденение множиств
select au_fname, au_lname, state from authors where state='UT'
union
select au_fname, au_lname, state from authors where state='TN'
union
select au_fname, au_lname, state from authors where state='KS'
order by au_fname

-- только общие(повторяющиеся) записи
select au_fname, au_lname, state from authors
intersect
select au_fname, au_lname, state from authors where state='UT'

-- НЕ включает повторяющиеся записи
select au_fname, au_lname, state from authors
except
select au_fname, au_lname, state from authors where state='CA'
except
select au_fname, au_lname, state from authors where state='UT'

-- сортировка по возрастанию
select contract from authors
order by contract

-- сортировка по убыванию
select contract from authors
order by contract desc

-- сортировка: по контракту, и (в каждом значении по 
-- контракту) сортировка по имени в убывании
select contract, au_fname from authors
order by contract desc, au_fname desc

-- добавить столбец в таблицу
alter table authors add age int

select * from authors

-- заполнить столбец age
update authors 
set age = len(address) + 23

-- поменять тип столбца
alter table authors alter column age varchar(20)

-- изменить значения после изменения типа для избежания ошибки
update authors set age = null

-- удалить столбец
alter table authors drop column age

-- создать таблицу t1 и положить в неё записи(au_fname, au_lname, state) из таблицы authors с значением state равным 'CA'
select au_fname, au_lname, state into t1
from authors
where state = 'CA'

select * from t1

-- очистить все записи
delete from t1
drop table t1

-- добавит в таблицу данные из другой таблицы
insert into t1(au_fname, au_lname, state)
select au_fname, au_lname, state
from authors where state = 'CA'


select * from titles
select * from publishers

-- найти автора книги по pub-id (который есть в двух таблицах и он должен быть равным)
select title, titles.pub_id, pub_name, price 
from titles, publishers
where titles.pub_id = publishers.pub_id


select * from sales
select * from stores

select title, titles.title_id, ord_date, qty, price
from titles, sales
where titles.title_id = sales.title_id

select titles.*, pub_name 
from titles, publishers
where titles.pub_id = publishers.pub_id and type = 'business'



