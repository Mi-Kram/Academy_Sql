use pubs

-- 1. Хранимая процедура принимает штат и показывает книги, написанные авторами из этого штата
create proc ShowBooks(@st varchar(2))
as
begin
	select title from titles
	where title_id in (select title_id from titleauthor
	where au_id in (select au_id from authors
	where state = @st))
end

exec ShowBooks 'UT'

drop proc ShowBooks


-- 2. Хранимая процедура принимает неообходимые параметры и добавляет автора
create proc AddAuthor(@id varchar(11), @fname varchar(20), @lname varchar(40), @phone varchar(12), 
@address varchar(40), @city varchar(20), @state varchar(2), @zip varchar(5), @contract bit)
as 
begin
	insert into authors
	(au_id, au_fname, au_lname, phone, address, city, state, zip, contract)
	values
	(@id, @fname, @lname, @phone, @address, @city, @state, @zip, @contract)
end

exec AddAuthor '455-99-1111', 'Petr', 'Velikiy', '071-123-4578', '1028 Long St.', 'Donetsk', 'DN', '77777', 1
select * from authors where city = 'Donetsk'

drop proc AddAuthor


-- 3. Хранимая процедура принимает название книги и удаляет все книги с таким названием
create proc RemoveTitles(@title varchar(80))
as
begin
	delete from titles
	where title = @title
end

drop proc RemoveTitles

-- 4. Хранимая процедура принимает жанр и сумму и увеиличивает цену всех книг этого жанра на указанную сумму
create proc AddPrice(@type varchar(12), @price money)
as
begin
	update titles
	set price += @price
	where type = @type
end

exec AddPrice 'psychology', 100
select * from titles where type = 'psychology'

drop proc AddPrice
