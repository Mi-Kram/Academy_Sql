-- select
select * from authors;

-- insert
insert into authors (au_fname, au_lname, age, address) values ('Alex', 'Petrov', 34, 'new street 5');

-- insert with set
insert into authors set age = 37;

-- update
update authors set age = 25;

-- update
update authors set au_fname = 'Second fName', au_lname = 'Second lName', address = 'Second address' where au_id = '2';

-- length()
select au_lname, length(au_lname) as 'len' from authors;

-- left(), right(), substring()
select au_lname, left(au_lname, 3) as 'left', right(au_lname, 5) as 'right', substring(au_lname, 2, 3) as 'substring' from authors;

-- reverse(), lowe(), upper()
select au_lname, reverse(au_lname) as 'reverse', lower(au_lname) as 'lower', upper(au_lname) as 'upper' from authors;

-- ltrim(), rtrim(), trim()
select ltrim('   test   '), rtrim('   test   '), trim('   test   ');

-- replace()
select replace('teste', 'e', 'A');

-- get date: 2021-12-10 16:10:22
select now() as 'date-time', curdate() as 'date', curtime() as 'time';

-- year(), month(), day(), hour(), minute(), second()
select year(now()) as 'year', month(now()) as 'month', day(now()) as 'day', hour(now()) as 'hour', minute(now()) as 'minute', second(now()) as 'second';

-- interval for date
select now() + interval 200 year as 'future', now() - interval 200 year as 'past';

select '1999-12-23' + interval 201 year as '1999 -> 2200';

-- многотабличные запросы
select au_fname, au_lname, title from authors, titles, titleauthor where authors.au_id = titleauthor.au_id and titles.title_id = titleauthor.title_id;

-- подзапросы
select title, price from titles where pub_id in (select pub_id from publishers where pub_name = 'New Moon Books');










