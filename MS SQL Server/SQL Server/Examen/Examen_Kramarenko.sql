use pubs

-- 1. „ј—“№

-- SELECT
-- order by
select au_fname, contract from authors
order by contract desc, au_fname

-- top 1
select top 1 * from authors 
where state = 'CA'

-- group by
select state, count(*) [кол-во авторов в штате] from authors
group by state

select state, count(*) [кол-во авторов в штате (более 2)] from authors
group by state
having count(*) > 2

-- distinct
select distinct state from authors

-- ALTER TABLE
create table testTable(id int identity primary key, value1 int, value2 int)
select * from testTable

-- Add column
alter table testTable add value3 int
select * from testTable

-- remove column
alter table testTable drop column value3
select * from testTable

insert into testTable
(value1, value2)
values
(5 , 8),
(7, 2),
(3, 9)
select * from testTable

-- UPDATE
update testTable
set value1 = 10, value2 = 20
where id = 3
select * from testTable

-- DELETE
delete testTable
where id = 3
select * from testTable

drop table testTable


-- 2 аггрегатные функции
select sum(price) [сумма цен книг в жанре business] from titles
where type = 'business'

select avg(price) [средн€€ цена книг в жанре business] from titles
where type = 'business'


-- 2 функции работы с датами
select * from titles 
where month(pubdate) = 12

select month(dateadd(dd, 3487, getdate()))

-- 2 строковые функции
select left(au_fname, 3) + right(au_lname, 2), 
au_fname + ' ' + au_lname from authors 

-- 2 like
select * from authors
where state like('%N%')

select * from titles
where price like('2%')


-- 2 join

-- inner
select  title, price, pub_id
from titles inner join sales
on titles.title_id = sales.title_id

-- outer
select  title, price
from titles full outer join sales
on titles.title_id = sales.title_id


-- 2 подзапрос

-- 2 таблицы
select title, price from titles
where title_id in (select title_id from sales
where MONTH(ord_date) = 10)

-- 3 таблицы
select title, price from titles
where title_id in (select title_id from titleauthor
where au_id in (select au_id from authors
where au_lname like('%[wg]%')))


-- EXCEPT
select title, price from titles
except
select title, price from titles
where price > 5 or price is NULL

-- INTERSECT
select title, price from titles
where title like('%u%')
intersect
select title, price from titles
where title like('%o%')

-- INTERSECT
select title, price from titles
where title like('%v%')
union
select title, price from titles
where title like('%x%')


-- 2. „ј—“№

-- 1)
select au_fname, au_lname, state from authors
where state = 'CA' and
au_id in (select au_id from titleauthor
group by au_id having count(title_id) = 1)

-- 2)
create view Task2
as
select distinct stor_name from stores
where stor_id in (select stor_id from sales
where title_id in (select title_id from titles
where price = (select min(price) from titles)))

select * from Task2

drop view Task2

-- 3)
create function Task3(@type varchar(max))
returns int
as
begin
	return DATEDIFF(dd, 
	(select min(pubdate) from titles where type = @type),
	(select max(pubdate) from titles where type = @type))
end

select dbo.Task3('business')

select min(pubdate) from titles where type = 'business' 
select max(pubdate) from titles where type = 'business'

drop function Task3

-- 4)

create function Task4(@type varchar(max))
returns table
as
return select au_fname, au_lname from authors
where au_id in (select au_id from titleauthor
where title_id in (select title_id from titles
where type = @type and
(price = (select min(price) from titles where type = @type) or
price = (select max(price) from titles  where type = @type))))

select * from Task4('business' )

drop function Task4


-- 5)
create proc Task5(@price money, @changeCnt int out, @avgMoney money out)
as
begin
	declare @tmp table(price money)

	insert into @tmp (price)
	select price + 2 from titles
	where price < @price

	update titles
	set price += 2
	where price < @price

	select @changeCnt = count(*) from @tmp
	select @avgMoney = avg(price) from @tmp
end

select price from titles where price < 32

declare @changes int, @avg money
exec Task5 32, @changes out, @avg out
select @changes count, @avg avgMoney

select price from titles where price < 32


drop proc Task5


