
create database if not exists test;

	use test;

	drop table if exists cats;



	create table cats (
		id INT NOT NULL AUTO_INCREMENT,
		name VARCHAR(100) NOT NULL,
		breed VARCHAR(50) DEFAULT "Indian",
		age INT NOT NULL DEFAULT 0
		PRIMARY KEY(id)
		);


	insert into cats(name, breed, age)
		values('Cat1','abc',20),
		('Cat2','bcd',10),
		('Cat3','abc',30);


	select name from cats;  -- returns name in table cats

	select name,age from cats; --returns name and age from cats

	select name from cats where name='Cat1';

	select * from cats where age=10;

	select id as cat_id , name from cats; --returns id as cat_id column and name from cats.

	update cats
		set breed='hello' where breed='abc' AND age=20; -- updates breed;


		update cats 
			set breed='don',name='catty' where breed='hello' AND age=20;


			delete from cats where breed='don';