use pubs

-- 1. показать авторов, которые не написали ни одной книги
select au_fname, au_lname from authors
except
select distinct au_fname, au_lname 
from authors inner join titleauthor
on titleauthor.au_id=authors.au_id


-- 2. показать книги, у которых нет авторов
select title from titles
except
select distinct title
from titles inner join titleauthor
on titles.title_id=titleauthor.title_id
inner join authors
on authors.au_id=titleauthor.au_id


-- 3. показать магазины, которые продают самую дешёвую книгу
select top 1 stor_name, title, price
from stores inner join sales
on stores.stor_id=sales.stor_id
inner join titles
on sales.title_id=titles.title_id
order by price


-- 4. показать жанры книг, которые продаются в магазинах города Seattle
select type
from titles inner join sales
on sales.title_id = titles.title_id
inner join stores
on sales.stor_id = stores.stor_id
where city='Seattle'


-- 5. показать среднюю стоимость книг, авторов из 'CA' в жанре 'Business'
select avg(price)
from titles inner join titleauthor
on titles.title_id=titleauthor.title_id
inner join authors
on authors.au_id = titleauthor.au_id
where state='CA' and type='Business'
