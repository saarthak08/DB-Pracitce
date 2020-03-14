
CREATE database if not exists test;

use database;


select CONCAT('hello'," ", 'world'); 


source book.sql;

select CONCAT(author_fname,' ',author_lname) from books;


select author_fname as first, author_lname as last,
CONCAT(author_fname,' ',author_lname) as full
from books;



select substring("Hello World",1,4);

select substring(author_fname,2,4) from books;


select replace("helloworld","hello","bye");

select replace(author_fname,"a","bc") from books;


select reverse("hello world");

select reverse(author_fname) from books where book;


select *,reverse (author_fname) from books where book_id>10;


select char_length(author_fname) from books;


select upper('hello');

select lower('HELLO');


