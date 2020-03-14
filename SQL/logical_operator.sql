create database if not exists test;

use test;


source book.sql;


select * from books where released_year = 2000;

select * from books where released_year != 2000;

select * from books where author_lname not like '%ah%'; 


select * from books where released_year > 2000;


select * from books where released_year <= 2000;


select * from books where released_year <= 2000 && pages <500;

select * from books where released_year <= 2000 AND pages <500;


select * from books where released_year <= 2000 OR pages <500;



select * from books where released_year BETWEEN 2000 AND 2015;


select * from books where released_year NOT BETWEEN 2000 AND 2015;

select title, author_lname from books where author_lname in ('Carver','Lahiri','Smith');

select title, author_lname from books where author_lname not in ('Carver','Lahiri','Smith');


