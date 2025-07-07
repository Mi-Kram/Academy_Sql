use pubs;

-- function
delimiter //
create or replace function f1(st varchar(5))
returns int(4)
begin
  declare cnt int(4);

  select count(*) into cnt from authors 
  where state = st;

  return cnt;
end //
delimiter ;

select f1('CA') as 'Count';
drop function f1;


-- cursor
delimiter //
create or replace procedure curtest()
begin
  declare done int(4) default 0;
  declare fname varchar(255);
  declare lname varchar(255);
  
  declare cur1 cursor for
  select au_fname, au_lname from authors;
  
  declare continue handler for not found set done=1;
  
  open cur1;
  fetch cur1 into fname, lname;
  select fname, lname;
  fetch cur1 into fname, lname;

  while done = 0 do
    select fname, lname;
    fetch cur1 into fname, lname;
  end while;

  close cur1;
end //
delimiter ;

call curtest();
drop procedure curtest;





-- просмотр

show procedure status;  -- show procedures
show function status;   -- show function
select db, name, type from mysql.proc; -- show all













