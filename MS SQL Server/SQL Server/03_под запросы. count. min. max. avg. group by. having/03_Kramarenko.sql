use pubs

-- 1. показать магазины, которые не продают книг (group by)
-- магазинов, которые не продавали книги не существует
select stor_name from stores
where stor_id in (select stor_id from sales
group by stor_id having count(title_id) = 0)

--select stor_id, count(title_id) kolvo from sales
--group by stor_id 
--having count(title_id) = 2

-- 2. показать автора, написавшего больше всего книг
select au_fname, au_lname from authors
where au_id in (select top 1 au_id from titleauthor
group by au_id order by count(title_id) desc)

-- 3. показать издательство, издавшее больше всего книг
select pub_name from publishers
where pub_id in (select top 1 pub_id from titles
group by pub_id order by count(title_id) desc)

-- 4. показать жанр, в котором написано больше всего книг
select top 1 type, count(title) from titles
group by type
order by count(title) desc

-- 5. показать всех авторов, не публиковавших свои книги летом
select au_fname, au_lname from authors
where au_id in (select au_id from titleauthor
where title_id in (select title_id from titles
except
select title_id from titles
where month(pubdate) in (6,7,8)))