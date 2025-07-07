/*select * from authors2
begin tran
delete from authors2
rollback tran
commit tran*/

alter trigger tr1
on authors for update
as
begin
	select * from inserted
	select * from deleted
	print 'Update trigger!!!'
	rollback tran
end

drop trigger tr1

select * from authors

delete from authors where au_id = '123987'

update authors set state = 'DN'
where au_id = '123987'

insert into authors(au_id, au_fname, au_lname, city, state, phone, contract)
values
('123987', 'Alex', 'Litovchenko', 'Moskow', 'MS', '12345', 1)