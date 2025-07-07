-- показать поля из таблицы Authors

-- объявление переменных для значений из таблицы
DECLARE @au_id varchar(11), @au_fname varchar(20), @au_lname varchar(40)

-- объявление курсорной переменной
DECLARE authors_cursor CURSOR dynamic FOR 
SELECT au_id, au_fname, au_lname FROM authors

-- открытие курсора (исполнение запроса)
OPEN authors_cursor

-- запросить из курсора первую строку результата
FETCH LAST FROM authors_cursor 
INTO @au_id, @au_fname, @au_lname

-- цикл по результатам работы курсора (пока не закончились записи в курсоре)
WHILE @@FETCH_STATUS = 0
BEGIN

-- обработка результатов курсора
select @au_id, @au_fname, @au_lname

-- получить следующую запись из курсора
FETCH PRIOR FROM authors_cursor
INTO @au_id, @au_fname, @au_lname

END

-- освобождение памяти из-под результатов запроса
close authors_cursor

-- освобождение памяти из-под самого курсора
deallocate authors_cursor

-- показать title_id, title, pubdate для всех книг при помощи курсора
DECLARE @title_id varchar(11), @title varchar(100), @pubdate datetime

-- объявление курсорной переменной
DECLARE titles_cursor CURSOR dynamic FOR 
SELECT title_id, title, pubdate
FROM titles

-- открытие курсора (исполнение запроса)
OPEN titles_cursor

-- запросить из курсора первую строку результата
FETCH first FROM titles_cursor 
INTO @title_id, @title, @pubdate

-- цикл по результатам работы курсора (пока не закончились записи в курсоре)
WHILE @@FETCH_STATUS = 0
BEGIN

-- обработка результатов курсора
select @title_id, @title, @pubdate

-- получить следующую запись из курсора
FETCH NEXT FROM titles_cursor
INTO @title_id, @title, @pubdate

END

-- освобождение памяти из-под результатов запроса
close titles_cursor

-- освобождение памяти из-под самого курсора
deallocate titles_cursor

select * from titles

-- добавить к названию каждой книги в конце год издания в круглых скобках. пример: Secrets of Silicon Valley (1994)

DECLARE @title_id varchar(11), @title varchar(100), @pubdate datetime

-- объявление курсорной переменной
DECLARE titles_cursor CURSOR dynamic FOR 
SELECT title_id, title, pubdate FROM titles

-- открытие курсора (исполнение запроса)
OPEN titles_cursor

-- запросить из курсора первую строку результата
FETCH first FROM titles_cursor 
INTO @title_id, @title, @pubdate

-- цикл по результатам работы курсора (пока не закончились записи в курсоре)
WHILE @@FETCH_STATUS = 0
BEGIN

-- update сработает только для той строки, на которой стоит курсор
update titles set title = @title + ' ('+ CAST(datepart(yy, @pubdate) AS varchar(20))  + ')'
where current of titles_cursor

-- получить следующую запись из курсора
FETCH NEXT FROM titles_cursor
INTO @title_id, @title, @pubdate

END

-- освобождение памяти из-под результатов запроса
close titles_cursor

-- освобождение памяти из-под самого курсора
deallocate titles_cursor

select * from titles

-- удалить год издания после каждого названия книги

DECLARE @title_id varchar(11), @title varchar(100), @pubdate datetime

-- объявление курсорной переменной
DECLARE titles_cursor CURSOR dynamic FOR 
SELECT title_id, title, pubdate FROM titles

-- открытие курсора (исполнение запроса)
OPEN titles_cursor

-- запросить из курсора первую строку результата
FETCH first FROM titles_cursor 
INTO @title_id, @title, @pubdate

-- цикл по результатам работы курсора (пока не закончились записи в курсоре)
WHILE @@FETCH_STATUS = 0
BEGIN

-- update сработает только для той строки, на которой стоит курсор
update titles set title = left(@title, len(@title)-7)
where current of titles_cursor

-- получить следующую запись из курсора
FETCH NEXT FROM titles_cursor
INTO @title_id, @title, @pubdate

END

-- освобождение памяти из-под результатов запроса
close titles_cursor

-- освобождение памяти из-под самого курсора
deallocate titles_cursor

select * from titles

-- ДОМАШНЕЕ ЗАДАНИЕ

-- 1. В таблице authors добавить столбец BooksCount
-- 2. В курсоре заполнить для каждого автора этот столбец как количество книг, написанных каждым автором