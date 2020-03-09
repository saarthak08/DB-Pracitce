create database IF NOT EXISTS test;


	use test;


	create table if not exists cats (
		name VARCHAR(50) null,
		age INT null,
		);   -- creating table



	insert into cats (name, age)
		VALUES('MyCat',200);  --inserting data into table.


		insert into cats (name, age)
			VALUES('MyCat2',300),
		('MyCat3',400); -- inserting multiple data into table.


		insert into cats(name)
	VALUES ('Snowbell'); --here age will be null.

	select * from cats; -- show data in the table.


show warnings; --shows warnings



create table if not exists cats (
	name VARCHAR(50) not null,
	age INT not null default 10,
		);   -- Column's can't be null and default value of int will be 10.



create table if not exists cats (
	cat_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(10) NOT NULL DEFAULT 'Catty',
	age INT ,
	PRIMARY KEY (cat_id)
);  -- implementation of primary key



/*

Altering table columns

*/
alter table cats
add hello VARCHAR(20);


alter table cats
drop column hello;

alter table cats
add hello int;

alter table cats
modify column hello varchar(20) not null default 'Hello Cat';

/*

Altering table columns

*/

