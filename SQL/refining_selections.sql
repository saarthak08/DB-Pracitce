

CREATE database if not exists test;

use database;

source book.sql;


select distinct author_lname from books;


select distinct concat(author_fname," ",author_lname) from books;


select distinct author_fname, author_lname from books;


select author_fname from books order by author_fname;


select author_fname from books order by author_fname desc;


select author_fname from books order by author_fname desc limit 5;


select author_fname from books order by author_fname desc limit 2,10;  -- from 2 to 10



select * from books where author_lname like '%ab%';  -- % means something, if we don't write % then it means absolute string.

select * from books where author_fname like '%a';  -- here author_fname ends with a.

select * from books where stock_quantity like '____';  -- where stock quantity is of 4 characters exact.



select * from books where title like '\_'; --where there is underscore


