use pubs

-- 1. показать книги, которые были опубликованы НЕ в жанре 'Business'
select title, type from titles
where type != 'business'

-- 2. показать издательства, которые НЕ публикуют книги, результат поместить в новую таблицу
select pub_name from publishers
except
select pub_name from publishers, titles 
where titles.pub_id = publishers.pub_id

-- 3. увеличить стоимость книг НЕ в жанре 'Business' на 5%
update titles
set price = price + (price/20)
where type != 'business'
select title, price from titles
where type != 'business'

-- 4. добавить в таблицу Titles новый столбец под названием kolvo записать туда номер месяца издания книги
alter table titles add kolvo int

update titles
set kolvo = month(pubdate)
select title, pubdate, kolvo from titles

-- 5. удалить столбец kolvo
alter table titles drop column kolvo
