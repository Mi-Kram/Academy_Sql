use pubs

-- view
create or replace view v1 as
  select au_fname, au_lname, state from authors
  where state = 'CA';

drop view v1;

-- procedure
delimiter //
create or replace procedure proc1(st varchar(10))
begin
  select au_fname, au_lname, state from authors
  where state = st;
end //
delimiter ;

call proc1('CA');
drop procedure proc1;

-- procedure, out params
delimiter //
create or replace procedure proc2(st varchar(10), out cnt int)
begin
  select count(*) into cnt from authors
  where state = st;
end //
delimiter ;

call proc2('CA', @cnt);
select @cnt as 'Count';
drop procedure proc2;






