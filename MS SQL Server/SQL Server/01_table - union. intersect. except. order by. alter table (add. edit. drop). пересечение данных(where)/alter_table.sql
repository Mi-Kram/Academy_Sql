-- объединение результатов запросов
select au_fname, au_lname, state from authors where state = 'UT'
union
select au_fname, au_lname, state from authors where state = 'TN'
union
select au_fname, au_lname, state from authors where state = 'KS'
union
select title, type, left(title, 5) from titles where type='Business'
order by state

-- пересечение результатов
select au_fname, au_lname, state from authors
intersect
select au_fname, au_lname, state from authors where state = 'TN'

-- вычитание результатов запросов
select au_fname, au_lname, state from authors
except
select au_fname, au_lname, state from authors where state = 'CA'
except
select au_fname, au_lname, state from authors where state = 'UT'

-- сортировка
select * from authors
order by contract desc, state, au_fname desc

-- добавление нового столбца в таблицу
alter table authors add age int

select * from authors

update authors set age = len(address) + 23

-- измененение типа столбца на varchar(20)
alter table authors alter column age varchar(20)

update authors set age = null

alter table authors alter column age int

-- удаление столбца
alter table authors drop column age

-- поместить результаты запросы в новую таблицу (которая не существует)
select au_fname, au_lname, state, contract into t1
from authors
where state = 'CA'

select * from t1

-- вставка результатов запроса в существующую таблицу
insert into t1 (au_fname, au_lname, state, contract)
select au_fname, au_lname, state, contract
from authors
where state = 'CA'

delete from t1

select * from titles
select * from publishers

-- показать издательства и их книги
select title, titles.pub_id, pub_name, price
from titles, publishers
where titles.pub_id = publishers.pub_id

-- показать данные о книгах в жанре 'Business'
select titles.*, pub_name
from titles, publishers
where titles.pub_id = publishers.pub_id
and type = 'Business'

select * from sales
select * from stores

-- показать все книги и их продажи
select title, titles.title_id, ord_date, qty, price
from titles, sales
where titles.title_id = sales.title_id

-- ДЗ
-- 1. показать книги, которые были опубликованы НЕ в жанре 'Business'
-- 2. показать издательства, которые НЕ публикуют книги, результат
-- поместить в новую таблицу
-- 3. увеличить стоимость книг НЕ в жанре 'Business' на 5%
-- 4. добавить в таблицу Titles новый столбец под названием kolvo
-- записать туда номер месяца издания книги
-- 5. удалить столбец kolvo