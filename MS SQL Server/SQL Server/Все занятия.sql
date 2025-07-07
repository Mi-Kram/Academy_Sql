-- top. between. (val is NULL). [tow words]. percent. sum.
-- getdate(). day. month. year. (yy. mm. dd. hh. mi. ss. ms). datediff. dateadd. len. left. right. substring. replace. lower. upper. like(regExp)
-- JOIN - left outer, right outer, set language english




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

-- найти автора книги по pub_id (который есть в двух таблицах и он должен быть равным)
select title, titles.pub_id, pub_name, price 
from titles, publishers
where titles.pub_id = publishers.pub_id

-- показать данные о книгах в жанре 'Business'
select titles.*, pub_name
from titles, publishers
where titles.pub_id = publishers.pub_id
and type = 'Business'

select * from sales
select * from stores

-- книги и их продажи
select title, titles.title_id, ord_date, qty, price
from titles, sales
where titles.title_id = sales.title_id









--	№6

use pubs

select * from titles		-- title_id | pub_id
select * from authors		-- au_id
select * from titleauthor	-- au_id | title_id
select * from publishers	-- pub_id

-- связать 2 таблицы промежуточной (3-ей) таблицой
select au_fname, au_lname, title, price
from authors, titles, titleauthor
where titles.title_id = titleauthor.title_id
and authors.au_id = titleauthor.au_id

-- связать 3 таблицы
select au_fname, au_lname, title, price, pub_name
from authors, titles, titleauthor, publishers
where titles.title_id = titleauthor.title_id
and authors.au_id = titleauthor.au_id
and titles.pub_id = publishers.pub_id

-- книги жанра бизнес, в городе CA и стоимостью меньше 15$
select title, au_fname, price
from titles, titleauthor, authors
where type = 'business' and price < 15 and state = 'CA'
and authors.au_id = titleauthor.au_id
and titles.title_id = titleauthor.title_id

-- самая дорогая книга
select top 1 au_fname, au_lname, title, price
from authors, titles, titleauthor
where titles.title_id = titleauthor.title_id
and authors.au_id = titleauthor.au_id
order by price desc

-- издательства, не публикующие книги авторов города UT
select pub_name
from authors, titles, publishers, titleauthor
where authors.au_id=titleauthor.au_id
and titleauthor.title_id=titles.title_id
and titles.pub_id=publishers.pub_id
except
select pub_name
from authors, titles, publishers, titleauthor
where authors.state='UT'
and authors.au_id=titleauthor.au_id
and titleauthor.title_id=titles.title_id
and titles.pub_id=publishers.pub_id

-- кол-во книг, которые были изданы летом авторами из города CA
select count(*)
from authors, titles, titleauthor
where authors.au_id = titleauthor.au_id
and titles.title_id = titleauthor.title_id
and month(pubdate) in (6,7,8)
and authors.state = 'CA'


select * from sales		-- stor_id | title_id
select * from stores	-- stor_id

-- магазины, продающие книги издательства Algodata Infosystems
select distinct stor_name
from stores, publishers, titles, sales
where sales.stor_id=stores.stor_id
and sales.title_id=titles.title_id
and titles.pub_id=publishers.pub_id
and publishers.pub_name='Algodata Infosystems'

-- жанры, которые продаются в магазине города Seattle
select distinct type
from titles, stores, sales
where city='Seattle'
and sales.stor_id = stores.stor_id
and sales.title_id = titles.title_id

-- книги и их издательства (есть записи в левой и правой таблице)
select title, type, pub_name, price
from titles inner join publishers
on publishers.pub_id = titles.pub_id

-- книги и их издательства (есть записи в левой и может не быть в правой таблице)
select title, type, pub_name, price
from titles left outer join publishers
on publishers.pub_id = titles.pub_id

-- книги и их издательства (есть записи в правой и может не быть в левой таблице)
select title, type, pub_name, price
from titles right outer join publishers
on publishers.pub_id = titles.pub_id

-- книги и их издательства (записи в правой и левой таблице могут быть не записаны)
select title, type, pub_name, price
from titles full outer join publishers
on publishers.pub_id = titles.pub_id

-- имя, название, жанр, цена
select au_fname, au_lname, title, type, price
from authors inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titleauthor.title_id = titles.title_id

-- имя, название, жанр, цена
select au_fname, au_lname, title, type, price
from authors inner join titleauthor
inner join titles
on titleauthor.title_id = titles.title_id
on titleauthor.au_id = authors.au_id

-- имя, название, жанр, цена
select au_fname, au_lname, title, type, price
from authors full outer join titleauthor
on authors.au_id = titleauthor.au_id
full outer join titles
on titleauthor.title_id = titles.title_id

-- имя, название, жанр, цена
select au_fname, au_lname, title, type, price
from authors full outer join titleauthor
full outer join titles
on titleauthor.title_id = titles.title_id
on titleauthor.au_id = authors.au_id

-- магазины, которые не продают книги в жанре бизнес
select stor_name from stores 
except
select distinct stor_name
from stores inner join sales
on stores.stor_id = sales.stor_id
inner join titles
on titles.title_id = sales.title_id
where titles.type = 'business'









-- №7

use pubs

-- мин цена всех книг
select min(price) from titles

-- все самые дешёвые книги
select * from titles
where price = (select min(price) from titles)

-- кол-во всех самых дешёвых книг
select count(*) from titles
where price = (select min(price) from titles)

-- все книги, цена которох больше средней цены всех книг
select * from titles
where price > (select avg(price) from titles)

-- издательства издающие самые дешёвые книги
select * from publishers
where pub_id in
(select pub_id from titles
where price = (select min(price) from titles))

-- издательства издающие самые дешёвые книги
select title, price, pub_name
from publishers inner join titles
on titles.pub_id = publishers.pub_id
where price in (select min(price) from titles)

-- магазины, продающие книги жанра Business
select stor_name from stores
where stor_id in (select stor_id from sales
where title_id in (select title_id from titles 
where type='business'))

-- магазины, продающие книги жанра Business
select distinct stor_name 
from stores inner join sales
on stores.stor_id = sales.stor_id
inner join titles
on sales.title_id = titles.title_id
where type='business'

-- авторы, которые публикуют свои книги в издательствах города Boston
select au_fname, au_lname from authors
where au_id in (select au_id from titleauthor
where title_id in (select title_id from titles
where pub_id in (select pub_id from publishers where city='Boston')))

-- авторы, которые публикуют свои книги в издательствах города Boston
select distinct au_fname, au_lname 
from authors inner join titleauthor
on authors.au_id = titleauthor.au_id
inner join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on publishers.pub_id = titles.pub_id 
where publishers.city='Boston'


-- группировка

-- авторы сгрупированные по штатам
select state, count(*) kolvo from authors
group by state

-- книги сгрупированные по жанрам
select type, count(*) kolvo, min(price) min, avg(price) avg, max(price) max from titles
group by type

-- книги сгрупированные по жанрам, и выведенные только те, в которых кол-во книг больше 3
select type, count(*) kolvo, min(price) min, avg(price) avg, max(price) max from titles
group by type
having count(*) > 3

-- книги сгрупированные по жанрам, и выведенные только те, в которых жанр является НЕ Business и кол-во книг больше 3
select type, count(*) kolvo, min(price) min, avg(price) avg, max(price) max from titles
where type != 'business'
group by type
having count(*) > 3

-- авторы, опубликовавшие 2 книги
select au_fname, au_lname from authors 
where au_id in (select au_id from titleauthor
group by au_id having count(*) = 2)

-- издательства, которые не публикуют книги
select pub_name from publishers
where pub_id in (select pub_id from publishers
except select pub_id from titles)

-- издательства, которые не публикуют книги
select pub_name from publishers
where pub_id in (select publishers.pub_id
from titles full outer join publishers
on titles.pub_id = publishers.pub_id
group by publishers.pub_id
having count(title) = 0)









-- №8

use pubs

-- объявить переменную
declare @a int, @b int

-- определить переменную
set @a = 23
select @a = 20, @b = 50

-- вывод переменной
select @a Let_A, @b Let_B
print @a

-- IF / ELSE
declare @c int
set @c = 24
if(@c=23)
begin
	print 'Yes!'
end
else print 'NO!'

-- WHILE
declare @i int = 1
while(@i <= 10)
begin
	print @i
	set @i += 1
end


-- хранимые процедуры

-- создать процедуру без параметров
create procedure show_authors
as
begin
	select * from authors
end
-- вызвать процедуру
exec show_authors

create proc show_authors2(@st varchar(2))
as
begin
	select * from authors where state = @st
end
exec show_authors2 'UT'


create proc show_authors3(@st varchar(2), @contr int)
as
begin
	select * from authors where state = @st and contract = @contr
end

exec show_authors3 'UT', 1

-- удалить процедуры
drop procedure show_authors
drop proc show_authors2
drop proc show_authors3









-- №9

use pubs

-- процедура, которая возвращает значения (out)
alter proc FindMinMax(@type varchar(max), @min money out, @max money out)
as
begin
	select @min = min(price) from titles
	where type = @type

	select @max = max(price) from titles
	where type = @type
end

declare @minPrice money, @maxPrice money
exec FindMinMax 'business', @minPrice out, @maxPrice out
select @minPrice [Min price], @maxPrice [Max price]

drop proc FindMinMax

-- возврат: число книг автора и средняя стоимость его книг
create proc FindCountAvgByName(@name varchar(max), @cnt int out, @avg money out)
as 
begin
	select @cnt = COUNT(title_id) from titleauthor
	where au_id in (select au_id from authors
	where au_fname = @name)

	select @avg = AVG(price) from titles
	where title_id in (select title_id from titleauthor
	where au_id in (select au_id from authors
	where au_fname = @name))
end

declare @cnt int, @avg money
exec FindCountAvgByName 'Johnson', @cnt out, @avg out
select @cnt cnt, @avg avg

drop proc FindCountAvgByName


-- ХРАНИМЫЕ ФУНКЦИИ

-- возврат: квадрат числа @x
create function sqr(@x int)
returns int
as
begin
	return @x*@x
end

select dbo.sqr(5) [Квадрат числа]
drop function sqr

-- возврат: кол-во авторов из штата @st
create function GetAuthorsCountFromState(@st varchar(20))
returns int
as
begin
	declare @cnt int
	select @cnt = COUNT(*) from authors
	where state = @st
	return @cnt
end

select dbo.GetAuthorsCountFromState('UT') count
drop function GetAuthorsCountFromState

-- возврат: кол-во жанров, которые попубликовало издательство @pub_name
create function GetTypeCountByPubName(@pub_name varchar(max))
returns int
as
begin
	declare @cnt int
	select @cnt = count(*) from 
	(select distinct type from titles
	where pub_id in (select pub_id from publishers
	where pub_name = @pub_name)) tmp -- tmp: count(*) from tmp
	return @cnt
end

select dbo.GetTypeCountByPubName('New Moon Books') [Кол-во жанров]
drop function GetTypeCountByPubName

-- возврат (таблица): авторы из штата @st
create function GetAutors(@st varchar(2))
returns table
as
return select au_fname, au_lname from authors
where state = @st

select * from GetAutors('UT')
drop function GetAutors

-- возврат: издательства, публикующие книгу @title
create function GetPublishersByTitle(@title varchar(max))
returns table
as
return select pub_name from publishers
where pub_id in (select pub_id from titles
where title = @title)

select * from GetPublishersByTitle('Net Etiquette')
drop function GetPublishersByTitle

-- переменная типа table
declare @myTable table(fname varchar(50), lname varchar(50))

insert into @myTable(fname, lname)
select au_fname, au_lname from authors

select * from @myTable


-- возврат: таблица авторов
create function GetAuthorsByCity(@city varchar(max))
returns @t table(fname varchar(max), lname varchar(max), city varchar(max), state varchar(max), contract bit)
as
begin
	insert into @t 
	(fname, lname, city, state, contract)
	values
	('Vasya', 'Pupkin', 'Makeevka', 'DN', 1)

	insert into @t 
	(fname, lname, city, state, contract)
	select au_fname, au_lname, city, state, contract from authors

	return
end

select * from GetAuthorsByCity('Oakland')
drop function GetAuthorsByCity


-- возврат: книги, удовлетворяющие диапозон цены
create function GetTitles(@minPrice money, @maxPrice money, @type varchar(max))
returns @t table(title varchar(max), type varchar(max), price money)
as
begin
	insert into @t 
	(title, type, price)
	select title, type, price from titles
	where type = @type and
	price between @minPrice and @maxPrice

	return
end

select * from GetTitles(0, 15, 'business')
drop function GetTitles

-- VIEW
create view  v1
as
select title, type, price, pub_name
from titles inner join publishers
on publishers.pub_id = titles.pub_id

select * from v1
drop view v1



