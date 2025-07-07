use pubs;

-- 1. хранимая процедура принимает название магазина и возвращает всех авторов, которые там продают книги
delimiter //
create or replace procedure GetAuthorsByStor(stor varchar(50))
begin
  select authors.au_id, au_fname, au_lname from authors
  left outer join titleauthor on titleauthor.au_id = authors.au_id
  left outer join titles on titleauthor.title_id = titles.title_id
  left outer join sales on sales.title_id = titles.title_id
  left outer join stores on sales.stor_id = stores.stor_id
  where stor_name = stor;
end //
delimiter ;

call GetAuthorsByStor('Eric the Read Books');

-- 2. хранимая функция принимает диапазон цен и возвращает количество книг в этом диапазоне
delimiter //
create or replace function GetTitlesCountInPriceRange(minPrice float(4), maxPrice float(4))
returns int(4)
begin
  declare cnt int(4);

  select count(*) into cnt from titles
  where price between minPrice and maxPrice;

  return cnt;
end //
delimiter ;

select GetTitlesCountInPriceRange(3, 10) as 'Count';


-- 3. курсор удаляет из названий книг все точки и цифры
delimiter //
create or replace procedure RemoveDotsAndDigits()
begin
  declare done int(4) default 0;
  declare tid varchar(255);
  
  declare cur1 cursor for
  select title_id from titles;
  
  declare continue handler for not found set done=1;
  open cur1;

  fetch cur1 into tid;
  update titles 
  set title = regexp_replace(title, '[\.0-9]+', '')
  where title_id = tid;

  fetch cur1 into tid;
  while done = 0 do
    update titles 
    set title = regexp_replace(title, '[\.0-9]+', '')
    where title_id = tid;
    fetch cur1 into tid;
  end while;

  close cur1;
end //
delimiter ;

update titles set title = concat(title, '123.456.789');
select title from titles;
call RemoveDotsAndDigits();
select title from titles;

-- 4. представление показывает всех авторов, которые продают книги больше, чем в одном магазине

create view SuccessAuthors as
  select authors.au_id, au_fname, au_lname from authors
  left outer join titleauthor on titleauthor.au_id = authors.au_id
  left outer join titles on titleauthor.title_id = titles.title_id
  left outer join sales on sales.title_id = titles.title_id
  left outer join stores on sales.stor_id = stores.stor_id
  group by authors.au_id
  having count(stor_name) > 1;

select * from SuccessAuthors;


------------------------------------

drop procedure GetAuthorsByStor;
drop function GetTitlesCountInPriceRange;
drop procedure RemoveDotsAndDigits;
drop view SuccessAuthors;



