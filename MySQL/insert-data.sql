create database if not exists test;


	use test;


	create table if not exists cats (
		name VARCHAR(50),
		age INT
		);



	insert into cats (name, age)
		VALUES('MyCat',200);