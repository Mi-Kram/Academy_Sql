-- 1. показать все жанры, которых работают авторы из UT
select distinct type from titles
where title_id in (
  select title_id from titleauthor
  where au_id in (
    select au_id from authors
    where state = 'UT'
  )
)

-- 2. показать авторов книг, в названии которых есть слово "Comp"
select au_fname, au_lname from authors
where au_id in (
  select au_id from titleauthor
  where title_id in (
    select title_id from titles
    where title like('%comp%')
  )
)

-- 3. год публикации самой дорогой книги
select strftime('%Y', pubdate) from titles
where price = (select max(price) from titles) 

-- 4. показать книги, дешевле средней цены в своём жанре
select t1.title, t1.type, t1.price from titles t1
where t1.price < (
  select avg(t2.price) from titles t2
  where t2.type = t1.type 
)


