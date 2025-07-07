-- 1. Создать представление, которое показывает самую дорогую и самую дешёвую книги
create view vTask1 as
  select title, type, price from titles
  where 
    price = (select max(price) from titles) or
    price = (select min(price) from titles);

select * from vTask1;

drop view vTask1;


-- 2. хранимая процедура, которая добавляет новое издательство
delimiter //
create or replace procedure pTask2(
  pubId varchar(10), 
  pubName varchar(50), 
  city varchar(20), 
  state varchar(5), 
  country varchar(20))
begin
  insert into publishers
  values (pubId, pubName, city, state, country);
end //
delimiter ;

call pTask2('12345', 'My Publisher', 'Donetsk', 'DN', 'Undefined');
select * from publishers;
delete from Publishers where PUB_ID = '12345';
drop procedure pTask2;

-- 3. 
delimiter //
create or replace procedure pTask3(typ varchar(20), out cnt int)
begin
  select count(*) into cnt from titles
  where type = typ;
end //
delimiter ;

call pTask3('business', @cnt);
select @cnt as 'Count';

drop procedure pTask3;





