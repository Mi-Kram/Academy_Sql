use pubs

begin tran
rollback tran

-- 1) триггер запрещает добавление авторов, если их в таблице уже больше 25
select COUNT(*) from authors
select * from authors

insert into authors(au_id, au_lname, au_fname, phone, address, city, state, zip, contract)
values ('777-77-7777','test','test','test','test','test','ZZ','77777',0)

drop trigger Trigger1


-- 2) триггер запрещает добавление авторов, если в имени автора нет гласных букв
insert into authors(au_id, au_lname, au_fname, phone, address, city, state, zip, contract)
values ('777-77-7777','tst','tst','test','test','test','ZZ','77777',0)

drop trigger Trigger2


-- 3) триггер запрещает удаление авторов, если они из штата 'CA'
delete from authors

drop trigger Trigger3


-- 4) триггер запрещает изменение данных, если изначальный штат это 'UT'
update authors
set au_fname = 'test'
where state = 'UT'

drop trigger Trigger4









-- 1) триггер запрещает добавление авторов, если их в таблице уже больше 25
create trigger Trigger1
on authors for insert
as
begin
	declare @cnt int
	select @cnt = ( select count(*) from authors) - (select COUNT(*) from inserted)
	if(@cnt > 25)
	begin
		print 'To much authors in table! (' + cast(@cnt as varchar) + ')'
		rollback tran
	end
end

-- 2) триггер запрещает добавление авторов, если в имени автора нет гласных букв
create trigger Trigger2
on authors for insert
as
begin
	declare @cnt int
	select @cnt = COUNT(*) from inserted
					where au_fname not like '%[eyuioa]%' 
					or au_lname not like '%[eyuioa]%'
	if(@cnt != 0)
	begin
		print 'Names must contain vowels!'
		rollback tran
	end
end

-- 3) триггер запрещает удаление авторов, если они из штата 'CA'
create trigger Trigger3
on authors for insert
as 
begin
	declare @cnt int
	select @cnt = count(*) from deleted where state = 'CA'

	if(@cnt != 0)
	begin
		print 'You cannot remove authors from state CA'
		rollback tran
	end
end

-- 4) триггер запрещает изменение данных, если изначальный штат это 'UT'
create trigger Trigger4
on authors for update
as
begin
	declare @cnt int
	select @cnt = count(*) from deleted
					where state = 'UT'
	if(@cnt != 0)
	begin
		print 'You cannot update authors from state UT'
		rollback tran
	end
end



drop trigger Trigger1
drop trigger Trigger2
drop trigger Trigger3
drop trigger Trigger4
