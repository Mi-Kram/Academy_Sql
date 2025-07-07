use pubs;

-- 1. функция принимает название жанра и возвращает количество авторов в этом жанре
delimiter //
create or replace function fTask1(typ varchar(20))
returns int(4)
begin
  declare cnt int(4);

  select count(distinct authors.au_id) into cnt from authors
  left outer join titleauthor on titleauthor.au_id = authors.au_id
  left outer join titles on titleauthor.title_id = titles.title_id
  where type = typ;

  return cnt;
end //
delimiter ;

select fTask1('business') as 'Count';
drop function fTask1;

-- просмотр автров
select distinct authors.au_id, au_fname, au_lname from authors
left outer join titleauthor on titleauthor.au_id = authors.au_id
left outer join titles on titleauthor.title_id = titles.title_id
where type = 'business';

-- 2. функция возвращает имя автора, который написал больше всего книг
delimiter //
create or replace function fTask2()
returns varchar(50)
begin
  declare result varchar(50);

  select concat(au_fname, ' ', au_lname) into result from authors
  where au_id = (
    select au_id as 'cnt' from titleauthor
    group by au_id
    order by cnt desc
    limit 1
  );

  return result;
end //
delimiter ;


select fTask2() as 'Name';
drop function fTask2;

-- select single author
select concat(au_fname, ' ', au_lname) as 'Name' from authors
where au_id = (
  select au_id as 'cnt' from titleauthor
  group by au_id
  order by cnt desc
  limit 1
);

-- select many authors
select concat(au_fname, ' ', au_lname) as 'Name' from authors
where au_id in (
  select au_id from titleauthor
  group by au_id
  having count(*) = (
    select count(*) as 'cnt' from titleauthor
    group by au_id
    order by cnt desc
    limit 1
  )
);

-- select many authors
with maxBooks(cnt) as
(
  select count(*) as 'cnt' from titleauthor
  group by au_id
  order by cnt desc
  limit 1
)
select concat(au_fname, ' ', au_lname) as 'Name' from authors
where au_id in (
  select au_id from titleauthor
  group by au_id
  having count(*) = (select cnt from maxBooks)
);


-- 4. курсор добавляет в название книги её стоимость в конце: (2.3)
delimiter //
create or replace procedure pTask4()
begin
  declare done int(4) default 0;
  declare tid varchar(255);
  declare ttl varchar(255);
  declare prc float(4);
  
  declare cur1 cursor for
  select title_id, title, price from titles;
  
  declare continue handler for not found set done=1;
  open cur1;

  fetch cur1 into tid, ttl, prc;
  update titles
  set title = concat(title, ' (', prc, ')')
  where title_id = tid;

  fetch cur1 into tid, ttl, prc;
  while done = 0 do
    update titles
    set title = concat(title, ' (', prc, ')')
    where title_id = tid;
    fetch cur1 into tid, ttl, prc;
  end while;

  close cur1;
end //
delimiter ;

call pTask4();
select title from titles;
drop procedure pTask4;

-- 5. курсор удаляет добавленное из задания 4
delimiter //
create or replace procedure pTask5()
begin
  declare done int(4) default 0;
  declare tid varchar(255);
  
  declare cur1 cursor for
  select title_id from titles
  where title like '% (%)';
  
  declare continue handler for not found set done=1;
  open cur1;

  fetch cur1 into tid;
  update titles
  set title = left(title, length(title) - length(substring_index(title, ' ', -1)) - 1)
  where title_id = tid;

  fetch cur1 into tid;
  while done = 0 do
    update titles
    set title = left(title, length(title) - length(substring_index(title, ' ', -1)) - 1)
    where title_id = tid;
    fetch cur1 into tid;
  end while;

  close cur1;
end //
delimiter ;

call pTask5();
select title from titles;
drop procedure pTask5;




