select * from authors
select * from titles
select * from titleauthor

-- показать всех авторов и их книги
select au_fname, au_lname, title, price
from authors, titles, titleauthor
where titles.title_id = titleauthor.title_id
and authors.au_id = titleauthor.au_id

-- показать всех авторов и их книги и их издательства
select au_fname, au_lname, title, price, pub_name
from authors, titles, titleauthor, publishers
where titles.title_id = titleauthor.title_id
and authors.au_id = titleauthor.au_id
and titles.pub_id = publishers.pub_id

-- показать авторов книг, живущих в 'CA' в жанре 'Business',
-- которые стоят дешевле $15
select distinct au_fname,au_lname
from authors,titles,titleauthor
where authors.au_id=titleauthor.au_id
and titles.title_id=titleauthor.title_id
and state='CA'
and price<15
and type='Business'

-- показать автора самой дорогой книги
select top 1 au_fname, au_lname, title, price
from authors, titles, titleauthor
where titles.title_id = titleauthor.title_id
and authors.au_id = titleauthor.au_id
order by price desc

-- показать издательства, которые НЕ публикуют книг авторов из 'UT'
select pub_name
from authors,titles,publishers,titleauthor
where  authors.au_id=titleauthor.au_id
and titleauthor.title_id=titles.title_id
and titles.pub_id=publishers.pub_id
except 
select pub_name 
from authors,titles,publishers,titleauthor
where authors.state='UT'
and authors.au_id=titleauthor.au_id
and titleauthor.title_id=titles.title_id
and titles.pub_id=publishers.pub_id

-- показать количество книг, которые были изданы летом авторами из 'CA'
select count(*) 
from authors,titles,titleauthor
where authors.au_id=titleauthor.au_id
and titleauthor.title_id=titles.title_id
and MONTH(pubdate) in (6, 7, 8)
and authors.state='CA'

select * from sales
select * from stores

-- показать магазины, продающие книги издательства 'Algodata infosystems'
select distinct stor_name
from titles, sales, stores, publishers
where sales.stor_id=stores.stor_id
and sales.title_id=titles.title_id
and titles.pub_id=publishers.pub_id
and publishers.pub_name='Algodata infosystems'

-- показать жанры книг, которые продаются в магазинах города Seattle
select distinct titles.type
from sales,stores,titles
where sales.stor_id=stores.stor_id
and sales.title_id=titles.title_id
and stores.city='Seattle'

-- показать книги и их издательства
select title, type, pub_name, price
from titles full outer join publishers
on publishers.pub_id = titles.pub_id

-- показать авторов и их книги
select au_fname, au_lname, title, type, price
from authors full outer join titleauthor
on authors.au_id = titleauthor.au_id
full outer join titles
on titleauthor.title_id = titles.title_id

select au_fname, au_lname, title, type, price
from authors full outer join titleauthor
full outer join titles
on titleauthor.title_id = titles.title_id
on authors.au_id = titleauthor.au_id

-- показать все магазины, которые не продают книги в жанре 'Business'
select stor_name from stores
except
select distinct stores.stor_name
from stores inner join sales
on stores.stor_id=sales.stor_id
inner join titles
on titles.title_id=sales.title_id
where titles.type = 'Business'

-- ДЗ
-- 1. показать авторов, которые не написали ни одной книги
-- 2. показать книги, у которых нет авторов
-- 3. показать магазины, которые продают самую дешёвую книгу
-- 4. показать жанры книг, которые продаются в магазинах города Seattle
-- 5. показать среднюю стоимость книг, авторов из 'CA' в жанре 'Business'
-- для всех запросов использовать JOIN