use pubs

-- 1. �������� �����, ������� ���� ������������ �� � ����� 'Business'
select title, type from titles
where type != 'business'

-- 2. �������� ������������, ������� �� ��������� �����, ��������� ��������� � ����� �������
select pub_name from publishers
except
select pub_name from publishers, titles 
where titles.pub_id = publishers.pub_id

-- 3. ��������� ��������� ���� �� � ����� 'Business' �� 5%
update titles
set price = price + (price/20)
where type != 'business'
select title, price from titles
where type != 'business'

-- 4. �������� � ������� Titles ����� ������� ��� ��������� kolvo �������� ���� ����� ������ ������� �����
alter table titles add kolvo int

update titles
set kolvo = month(pubdate)
select title, pubdate, kolvo from titles

-- 5. ������� ������� kolvo
alter table titles drop column kolvo
