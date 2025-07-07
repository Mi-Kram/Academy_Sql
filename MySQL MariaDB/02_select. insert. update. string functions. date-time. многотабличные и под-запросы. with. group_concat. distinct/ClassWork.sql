-- показать авторов, которые написали книги, опубликованные летом
select au_fname, au_lname, title, pubdate 
from authors, titles, titleauthor 
where month(pubdate) in (6,7,8) and 
authors.au_id = titleauthor.au_id and 
titles.title_id = titleauthor.title_id;

-- показать все издательства, которые не публикуют книг авторов из UT
select pub_name from publishers
except
select pub_name 
from publishers
left outer join titles on publishers.pub_id = titles.pub_id
left outer join titleauthor on titleauthor.title_id = titles.title_id
left outer join authors on titleauthor.au_id = authors.au_id
where authors.state = 'UT';




