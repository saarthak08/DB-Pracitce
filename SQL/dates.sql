


create database if not exists test;


	use test;




	create table people (
		name varchar(100),
		birthdate DATE,
		birthtime TIME,
		birthdt DATETIME,
		);


	insert into people (name, birthdate, birthtime, birthtd)
		values ('Padma', '1983-11-11', '10:30:05', '1983-11-11 10:30:05');


		insert into people (name, birthdate, birthtime, birthtd)
			values ('Saarthak', CURDATE(), CURTIME(), NOW());
