use pubs;

-- Task1
-- показать авторов, которые не написали книг
select au_id, au_fname, au_lname from authors
where au_id not in (select au_id from titleauthor);

-- Task 2
-- показать месяцы, в которые не издано никаких книг
-- Variant 1
create or replace temporary table tab_months (monthNumber int primary key, month varchar(20));
insert into tab_months values (1, 'Январь'), (2, 'Февраль'), (3, 'Март'), (4, 'Апрель'), (5, 'Май'), (6, 'Июнь'), (7, 'Июль'), (8, 'Август'), (9, 'Сентябрь'), (10, 'Октябрь'), (11, 'Ноябрь'), (12, 'Декабрь');
select month from tab_months
where monthNumber not in (select month(pubdate) from titles);

-- Variant 2
with months(num, month) as
(
  select 1, 'Январь'
  union select 2, 'Февраль'
  union select 3, 'Март'
  union select 4, 'Апрель'
  union select 5, 'Май'
  union select 6, 'Июнь'
  union select 7, 'Июль'
  union select 8, 'Август'
  union select 9, 'Сентябрь'
  union select 10, 'Октябрь'
  union select 11, 'Ноябрь'
  union select 12, 'Декабрь'
)
select month from months
where num not in (select month(pubdate) from titles);

-- Task 3
-- увеличить цену книг в жанре Business на 10%
update titles
set price = price * 1.1
where type = 'business';

select title, type, price from titles where type = 'business';

-- Task 4
-- показать всех авторов, которые работают в соавторстве
-- a) книга и её авторы
select title_id, group_concat(concat(authors.au_fname, ' ', authors.au_lname) separator ' and ') as 'Authors' from titleauthor
left outer join authors on titleauthor.au_id = authors.au_id
where authors.au_id is not null
group by titleauthor.title_id
having count(*) > 1;

-- b) авторы, которые работали в соавторстве
select distinct au_id, au_fname, au_lname from authors
where au_id in (
  select au_id from titleauthor ta
  where ta.title_id in (
    select title_id from titleauthor ta1
    group by ta1.title_id having count(*) > 1))
order by au_fname, au_lname;

-- Task 5
-- показать самые дорогие книги в своих жанрах
select title, type, price from titles t1
where price = (select max(t2.price) from titles t2 where t1.type = t2.type);
