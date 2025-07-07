-- показать книги с минимальной ценой
select * from titles where price =
(select min(price) from titles)

-- показать количество книг с максимальной ценой
select count(*) from titles where price =
(select max(price) from titles)

-- показать книги дороже средней цены
select * from titles where price >
(select avg(price) from titles)

-- издательства, издающие книги с минимальной ценой
select * from publishers where pub_id in 
(select pub_id from titles where price =
(select min(price) from titles))

select title, price, pub_name
from publishers inner join titles
on titles.pub_id = publishers.pub_id
where price in (select min(price) from titles)

-- магазины, продающие книги в жанре 'Business'
select stor_name from stores where stor_id in 
 (select stor_id from sales where title_id in
 (select title_id from titles where titles.type='Business'))

select distinct stor_name 
from stores inner join sales
on stores.stor_id = sales.stor_id
inner join titles
on titles.title_id = sales.title_id
where titles.type='Business'

-- авторы, которые публикуют свои книги в издательствах
-- города 'Boston'
select au_fname,au_lname from authors where au_id in
 (select au_id from titleauthor where title_id in
 (select title_id from titles where pub_id in
 (select pub_id from publishers where publishers.city='Boston')))

select distinct au_fname, au_lname
from authors inner join titleauthor
on titleauthor.au_id=authors.au_id
inner join titles
on titles.title_id=titleauthor.title_id
inner join publishers
on publishers.pub_id=titles.pub_id
where publishers.city='Boston'

-- ГРУППИРОВКА ДАННЫХ

-- авторы, сгруппированные по штатам
select state, count(*) kolvo from authors
group by state

-- книги, сгруппированные по жанрам
select type, count(*) cnt, min(price), max(price), avg(price) 
from titles
where type != 'Business'
group by type
having count(*) > 1 and avg(price) < 18

-- показать авторов, которые написали по 2 книги
select * from authors where au_id in
(select authors.au_id
from authors inner join titleauthor
on authors.au_id = titleauthor.au_id
group by authors.au_id
having count(*) = 2)

-- показать издательства, не публикующие книг
select * from publishers where pub_id in
(select pub_id from publishers
except
select pub_id from titles)

select * from publishers
where pub_id in
(select publishers.pub_id
from titles full outer join publishers
on titles.pub_id = publishers.pub_id
group by publishers.pub_id
having count(title) = 0)

-- ДЗ
-- запросы

-- 1. показать магазины, которые не продают книг (group by)
-- 2. показать автора, написавшего больше всего книг
-- 3. показать издательство, издавшее больше всего книг
-- 4. показать жанр, в котором написано больше всего книг
-- 5. показать всех авторов, не публиковавших свои книги летом

/*
БД "Школа"

1. ФИО учителя
2. ФИО ученика
3. Название предмета
4. № урока
5. № аудитории
6. Адрес учителя
7. Адрес ученика
8. Номер телефона учителя
9. Номер телефона ученика
10. Оценка ученика
11. Название темы урока
12. Староста класса
13. Количество учебных часов в предмете
14. Время начала урока
15. Классный руководитель класса
16. Дата проведения занятия
*/