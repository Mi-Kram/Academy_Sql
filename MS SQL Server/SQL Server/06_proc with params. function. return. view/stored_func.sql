-- хранимая процедура принимает жанр книги и возвращает минимальную и максимальную
-- цены книг в заданном жанре
create procedure FindMinMax(@genre varchar(20), @min money out, @max money out)
as
begin
	select @min = min(price) from titles
	where type = @genre
	select @max = max(price)  from titles
	where type = @genre
end

declare @min money, @max money
exec FindMinMax 'business', @min out, @max out
select @min [Minimal price], @max [Maximal price]

select * from titles

-- хранимая процедура принимает имя автора и возвращает количество книг и среднюю
-- цену книг, написанных этим автором
create proc FindCountAvgByName(@au_fname varchar(max), @au_lname varchar(max),
								@cnt int out, @avg money out)
as 
begin
    select @cnt = COUNT(title_id) from titleauthor
    where au_id in (select au_id from authors
    where au_fname = @au_fname and au_lname = @au_lname)

    select @avg = AVG(price) from titles
    where title_id in (select title_id from titleauthor
    where au_id in (select au_id from authors
    where au_fname = @au_fname and au_lname = @au_lname))
end

select * from authors

declare @cnt int, @avg money
exec FindCountAvgByName 'Marjorie', 'Green', @cnt out, @avg out
select @cnt, @avg

-- скалярная функция, которая находит квадрат числа
create function sqr(@x int)
returns int
as
begin
	return @x*@x
end

select dbo.sqr(2)

-- функция возвращает количество авторов, проживающих в заданном штате
create function GetAuthorsCountByState(@st varchar(20))
returns int
as
begin
	declare @cnt int
	select @cnt = count(*)
	from authors
	where state = @st
	return @cnt
end

select dbo.GetAuthorsCountByState('UT')

-- функция принимает название издательства и возвращает количество жанров, в которых
-- издательство публикует книги
alter function GenresCount (@pub_name varchar(40))
returns int
as
begin
declare @num int
select @num = count(*) from
(select distinct type from titles where pub_id in
(select pub_id from publishers where pub_name = @pub_name)) tmp
return @num
end

select dbo.GenresCount('Algodata infosystems')

--  пример подзапроса, возвращающего таблицу
select au_fname, au_lname from
(select au_fname, au_lname, state, city, contract
from authors) au
where state = 'CA'

-- inline-функция принимает название штата и возвращает таблицу авторов из этого штата
create function GetAuthors(@st varchar(20))
returns table
as
return select au_fname, au_lname, state, city, contract
from authors
where state = @st

select * from GetAuthors('CA')

-- функция принимает название книги и возвращает названия издательств, которые ёё издают
create function GetPublishersByTitle(@title_name varchar(40))
returns table
as
return select pub_name from publishers, titles
where titles.pub_id = publishers.pub_id
and titles.title = @title_name

select * from GetPublishersByTitle('Life Without Fear')

-- использование переменных типа table
declare @mytable table(fname varchar(20), lname varchar(20))

insert into @mytable(fname, lname)
select au_fname, au_lname from authors where state = 'CA'

select * from @mytable

create function GetAuthorsByCity(@city varchar(20))
returns @t table(au_fname varchar(20), au_lname varchar(20), city varchar(20), state varchar(2), contract int)
as
begin
	insert into @t (au_fname, au_lname, city, state, contract)
	values ('Vasya', 'Pupkin', 'Makeevka', 'DN', 1)

	insert into @t (au_fname, au_lname, city, state, contract)
	select au_fname, au_lname, city, state, contract
	from authors
	where city = @city

	return
end

select * from GetAuthorsByCity('Oakland')

-- функция принимает диапазон цен книг и название жанра и возвращает
-- список книг, удовлетворяющих условиям
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

select * from GetTitles(1, 15, 'Business')

-- представление, которое показывает издательства и их книги
create view v1
as
select title, price, type, pub_name
from titles inner join publishers
on titles.pub_id = publishers.pub_id

select * from v1

drop view v1