use pubs

-- 1. хранимая процедура принимает имя автора и удаляет все его книги и его потом удаляет
delimiter //
create or replace procedure DeleteAuthor(fName varchar(20))
begin
  delete titles from titles
  left outer join titleauthor on titleauthor.title_id = titles.title_id
  left outer join authors on titleauthor.au_id = authors.au_id
  where au_fname = fName;

  delete from authors
  where au_fname = fName;
end //
delimiter ;

select au_fname from authors;
call DeleteAuthor('Marjorie');

-- просмотр книг автора
select title from titles
left outer join titleauthor on titleauthor.title_id = titles.title_id
left outer join authors on titleauthor.au_id = authors.au_id
where au_fname = 'Marjorie';


-- 2. представление показывает авторов, которые не написали ничего (тунеядцы)
create view authorParasitesView as
  select * from authors
  where au_id not in (select au_id from titleauthor);

select * from authorParasitesView;


-- 3. хранимая процедура увеличивает стоимость книг авторов указанного штата на указанную величину
delimiter //
create or replace procedure IncreasePrice(st varchar(5), val int)
begin
  update titles
  left outer join titleauthor on titles.title_id = titleauthor.title_id
  left outer join authors on titleauthor.au_id = authors.au_id
  set price = price + val
  where state = st;
end //
delimiter ;

call IncreasePrice('UT', 10);

-- показать изменения
select title, price, state from titles
left outer join titleauthor on titles.title_id = titleauthor.title_id
left outer join authors on titleauthor.au_id = authors.au_id
where state = 'UT';



-- 4. для каждого штата показать: 
-- 	- количество авторов, проживающих
-- 	- максимальную и минимальную цену книг авторов из штата
-- 	- колиечтво жанров книг

-- Variant 1
select 
  state,
  max(price) as 'Max price',
  min(price) as 'Min price',
  count(distinct type) as 'Book`s type count'
from authors
left outer join titleauthor on titleauthor.au_id = authors.au_id
left outer join titles on titleauthor.title_id = titles.title_id
group by state;


-- Variant 2 
select 
  state,
  count(*) as 'Authors count',
  (
    select max(price) from titles
    left outer join titleauthor on titleauthor.title_id = titles.title_id
    left outer join authors a1 on titleauthor.au_id = a1.au_id
    where a1.state = a.state
  ) as 'Max price',
  (
    select min(price) from titles
    left outer join titleauthor on titleauthor.title_id = titles.title_id
    left outer join authors a1 on titleauthor.au_id = a1.au_id
    where a1.state = a.state
  ) as 'Min price',
  (
    select count(distinct type) from titles
    left outer join titleauthor on titleauthor.title_id = titles.title_id
    left outer join authors a1 on titleauthor.au_id = a1.au_id
    where a1.state = a.state
  ) as 'Book`s type count'
from authors a
group by state;



----------------------------------------



drop procedure DeleteAuthor;
drop view authorParasitesView;
drop procedure IncreasePrice;


