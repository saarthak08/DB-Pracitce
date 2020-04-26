 
source db-maker.sql;

insert into author(name) values ("Author 1");
insert into author(name) values ("Author 2");

select * from author;

insert into library(email_address,address,contact_number) values("mal@amu.ac.in","AMU CAMPUS",202001);
select * from library;


insert into book(title,publisher,ISBN,library_id) values("Java for Dummies","Wiley Publications",420,1);
insert into book(title,publisher,ISBN,library_id) values("Python for Dummies","Wiley Publications",123,1);
insert into book(title,publisher,ISBN,library_id) values("JavaScript for Dummies","Wiley Publications",100,1);

select * from book;

insert into author_book(author_id, book_id) values (1,2);
insert into author_book(author_id, book_id) values (2,1);
insert into author_book(author_id, book_id) values (1,1);


select * from author_book
JOIN (select name as author_name, id as author_id from author) a
ON author_book.author_id=a.author_id
JOIN (select title as book_title, publisher as book_publisher, id as book_id, ISBN from book) b
ON author_book.book_id=b.book_id;

insert into department(name) values("Computer");
insert into department(name) values("Electronics");

select * from department;

insert into library_member(name,contact_number,email_address,address,department_id,library_id) values("Tony Stark",100,"tonystark@starkindustries.com","Malibu CA, USA",1,1);
insert into library_member(name,contact_number,email_address,address,department_id,library_id) values("Steve Rogers",100,"steverogers@avengers.com","Avengers HQ, USA",1,1);
insert into library_member(name,contact_number,email_address,address,department_id,library_id) values("Peter Parker",100,"peterparker@starkindustries.com","Queens",1,1);
insert into library_member(name,contact_number,email_address,address,department_id,library_id) values("Thanos",100,"themadtitan@marvel.com","Titan",2,1);


select * from library_member;

insert into staff(name,contact_number,email_address,address,library_id) values ("Babu Bhaiya",420,"babubhaiya@herapheri.com","Mumbai",1);
insert into staff(name,contact_number,email_address,address,library_id) values ("Jethiya",420,"jethalalchampaklalgada@tmkoc.com","Goregaon, Mumbai",1);
insert into staff(name,contact_number,email_address,address,library_id) values ("Bertram Gilfoyle",420,"systemarchitect@piedpiper.com","Palo Alto, CA, USA",1);

select * from staff;


insert into book_copy(book_id,available) values(1,true);
insert into book_copy(book_id,available) values(2,true);
insert into book_copy(book_id,available) values(1,true);
insert into book_copy(book_id,available) values(2,true);
insert into book_copy(book_id,available) values(1,true);
insert into book_copy(book_id,available) values(1,false);

select * from book;
select * from book_copy;

update book_copy set available=0 where id=1;

select * from book;
select * from book_copy;

update book_copy set available=1 where id=1;

select * from book;
select * from book_copy;

insert into issues_list(book_copy_id,library_member_id,staff_id) values(6,1,1);
insert into issues_list(book_copy_id,library_member_id,staff_id) values(1,1,1);

select * from book;
select * from book_copy;
select * from issues_list;

insert into returns_list(book_copy_id,library_member_id,staff_id) values(2,1,1);
insert into returns_list(book_copy_id,library_member_id,staff_id) values(1,1,1);

select * from book;
select * from book_copy;
select * from returns_list;
