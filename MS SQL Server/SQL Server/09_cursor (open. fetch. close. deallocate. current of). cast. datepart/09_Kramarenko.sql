use pubs

alter table authors add BookCount int

exec updateAuthors

select * from authors

update authors set BookCount = 0



create proc updateAuthors
as
begin
	declare @au_id varchar(max)
	
	declare au_cursor cursor dynamic for
	select au_id from authors
	
	open au_cursor
	
	fetch first from au_cursor
	into @au_id
	
	while (@@FETCH_STATUS = 0)
	begin
		update authors
		set BookCount = (select count(*) from titleauthor where @au_id = titleauthor.au_id)
		where au_id = @au_id
	
		fetch next from au_cursor
		into @au_id
	end
	
	close au_cursor
	deallocate au_cursorend
end