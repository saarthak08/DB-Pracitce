create database if not exists test;

use test;


create table people (
	name varchar(100),
	birthdate DATE,
	birthtime TIME,
	birthdt DATETIME,
);


insert into
	people (name, birthdate, birthtime, birthtd)
values
	(
		'Padma',
		'1983-11-11',
		'10:30:05',
		'1983-11-11 10:30:05'
	);


insert into
	people (name, birthdate, birthtime, birthtd)
values
	('Saarthak', CURDATE(), CURTIME(), NOW());


select
	name,
	birthdate,
	dayname(birthdate)
from
	people;


select name, birthdate, day(birthdate) from people;

select name, birthdate, dayofyear(birthdate) from people;

select name, birthdate, dayofweek(birthdate) from people;


select name, birthdate, month(birthdate) from people;

select name, birthdate, monthname(birthdate) from people;


select name, birthtime, minute(birthtime) from people;

select name, birthtime, hour(birthtime) from people;

select date_format(birthtd, 'was born on %W') from people;


create table comments (
	content varchar(100),
	created_at TIMESTAMP default NOW() on UPDATE CURRENT_TIMESTAMP
);


insert into comments (content) values ('Hello World!');