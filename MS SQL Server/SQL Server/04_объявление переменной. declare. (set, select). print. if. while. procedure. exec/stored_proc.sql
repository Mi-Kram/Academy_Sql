-- объявление переменной
declare @a int, @b int
set @a = 23
select @a = 3, @b = 5
select @a kolvo
print @a

-- условный оператор
if(@a + @b = 7)
begin
	print 'YES!'
end
else print 'NO!'

-- цикл
declare @i int = 1
while(@i <= 5)
begin
	select @i
	set @i+=1
end

-- хранимые процедуры
alter procedure show_authors(@st varchar(2), @contr int)
as
begin
	select * from authors 
	where state = @st and contract = @contr
end

drop procedure show_authors

exec show_authors 'UT', 1

-- ДЗ

-- Театр
/*
+ 1.  Название спектакля
+ 2.  ФИО актёра
+ 3.  ФИО режиссёра
+ 4.  ФИО сценариста
+ 5.  Цена билета
+ 6.  Название роли
+ 7.  № места
+ 8.  Тип места (балкон, амфитеатр)
+ 9.  Дата спектакля
+ 10. Ставка актёра за спектакль
+ 11. Длительность спектакля
+ 12. Адрес актёра
+ 13. Время начала сеанса
+ 14. Дата сеанса
+ 15. Название реквизита
+ 16. Стоимость реквизита
*/

-- perform
| perf_id | propsgroup_id |
| 01 	  | 169 		  | 

-- props_group
| group_id | prop_id | num |
| 169      | 567461  | 1   |
| 169      | 8979    | 2   |
| 128      | 7878    | 3   |
| 169      | 74182   | 4   |

-- props
| prop_id | prop_name | cost |
| 567461  | шляпа     | 592.2|
| 8979    | стул      | 456  |
| 74182   | стол      | 66   |






