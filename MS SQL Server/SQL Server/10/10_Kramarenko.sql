create database HWDataBase02


create table titles(title_id varchar(6) primary key, title varchar(80), type char(12), pub_id char(4), 
					price money, advance money, royalty int, ytd_sales int, notes varchar(200), pubdate datetime)

insert into HWDataBase02.dbo.titles
select * from pubs.dbo.titles


create function GetTitles()
returns table
as 
return select title, type, price, pubdate from titles
where type = 'business' and price > 5


select * from GetTitles()


create proc AddTitle(@title_id varchar(6), @title varchar(80), @type char(12), @pub_id char(4), @price money, 
					@advance money, @royalty int, @ytd_sales int, @notes varchar(200), @pubdate datetime)
as
begin
	if(@price < 100)
	begin
		insert into titles(title_id, title, type, pub_id, price, advance, royalty, ytd_sales, notes, pubdate)
		values (@title_id, @title, @type, @pub_id, @price, @advance, @royalty, @ytd_sales, @notes, @pubdate)
		print 'Книга добавленна'
	end
	else print 'Книга не добавленна, т.к. её цена должна быть меньше 100'
end


-- ---------------------------------------------------------

exec AddTitle 'test01', 'test01', 'business', 'test', 500, 777, 5, 5, 'test01', '08-08-2000'
exec AddTitle 'test02', 'test02', 'business', 'test', 100, 777, 5, 5, 'test02', '08-08-2000'
exec AddTitle 'test03', 'test03', 'business', 'test', 55, 777, 5, 5, 'test03', '08-08-2000'

select * from GetTitles()