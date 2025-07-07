use pubs

-- 1. �������� �������, ������� �� �������� �� ����� �����
select au_fname, au_lname from authors
except
select distinct au_fname, au_lname 
from authors inner join titleauthor
on titleauthor.au_id=authors.au_id


-- 2. �������� �����, � ������� ��� �������
select title from titles
except
select distinct title
from titles inner join titleauthor
on titles.title_id=titleauthor.title_id
inner join authors
on authors.au_id=titleauthor.au_id


-- 3. �������� ��������, ������� ������� ����� ������� �����
select top 1 stor_name, title, price
from stores inner join sales
on stores.stor_id=sales.stor_id
inner join titles
on sales.title_id=titles.title_id
order by price


-- 4. �������� ����� ����, ������� ��������� � ��������� ������ Seattle
select type
from titles inner join sales
on sales.title_id = titles.title_id
inner join stores
on sales.stor_id = stores.stor_id
where city='Seattle'


-- 5. �������� ������� ��������� ����, ������� �� 'CA' � ����� 'Business'
select avg(price)
from titles inner join titleauthor
on titles.title_id=titleauthor.title_id
inner join authors
on authors.au_id = titleauthor.au_id
where state='CA' and type='Business'
