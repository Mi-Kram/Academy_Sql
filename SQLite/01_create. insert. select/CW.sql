create table authors
(
	au_id integer primary key, -- integer set identity (auto_increment)
	au_fname varchar(20),
	au_lname varchar(20),
	city varchar(20),
	state varchar(2)
)


insert into authors2(au_fname, au_lname, city, state)
values 
	('Alex', 'Petrov', 'Moscow', 'MS'),
	('Ivan', 'Pupkin', 'Donetsk', 'DN')

select * from authors




create table authors2
(
	au_id int primary key,
	au_fname varchar(20),
	au_lname varchar(20),
	city varchar(20),
	state varchar(2)
)

insert into authors2(au_fname, au_lname, city, state)
values 
	('Alex', 'Petrov', 'Moscow', 'MS'),
	('Ivan', 'Pupkin', 'Donetsk', 'DN')

select rowid, * from authors2


