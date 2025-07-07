use pubs

-- 1) Триггер запрещает удалять авторов из штата 'CA'
create trigger tr1
on authors instead of delete
as
begin
	declare @cnt int
	select @cnt = count(*) from deleted where state = 'CA'

	if(@cnt > 0) print 'Authors from the state CA were not removed'

	delete from authors
	where au_id in (select au_id from deleted except
	select au_id from authors where state = 'CA')

end

-- 2) Триггер запрещает удалять авторов, если у них есть книги
create trigger tr2
on authors instead of delete
as
begin
	declare @cnt int
	select @cnt = count(*) from deleted
	where au_id not in (select distinct au_id from titleauthor)

	if(@cnt > 0) print 'Some authors were not removed, because they wrote books'


	delete from authors
	where au_id in (select au_id from deleted
	where au_id not in (select distinct au_id from titleauthor))
end



-- 3) Триггер запрещает добавлять авторов, если их уже больше 27
create trigger tr3
on authors instead of insert
as 
begin
	declare @cnt int = (select COUNT(*) from authors) + (select count(*) from inserted)

	if(@cnt > 27)
	begin
		print 'A lot of authors'
	end

	else
	begin
		insert into authors
		select * from inserted
	end
end


-- 4) Триггер запрещает уменьшать стоимость книг
create trigger tr4
on titles instead of update
as
begin
	update titles
	set
	title	  = (select title     from inserted where titles.title_id = inserted.title_id),
	type	  = (select type      from inserted where titles.title_id = inserted.title_id),
	pub_id	  = (select pub_id    from inserted where titles.title_id = inserted.title_id),
	advance	  = (select advance   from inserted where titles.title_id = inserted.title_id),
	royalty	  = (select royalty   from inserted where titles.title_id = inserted.title_id),
	ytd_sales = (select ytd_sales from inserted where titles.title_id = inserted.title_id),
	notes	  = (select notes     from inserted where titles.title_id = inserted.title_id),
	pubdate	  = (select pubdate   from inserted where titles.title_id = inserted.title_id)
end


-- 5) Триггер запрещает добавлять авторов, если в имени или в фамилии нет гласных букв
create trigger tr5
on authors instead of insert
as
begin
	insert into authors
	select * from inserted
	where au_fname like '%[eyuioa]%' and
	au_lname like '%[eyuioa]%'
end






drop trigger tr1
drop trigger tr2
drop trigger tr3
drop trigger tr4
drop trigger tr5