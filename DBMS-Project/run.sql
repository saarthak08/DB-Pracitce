 
source db-maker.sql;

insert into author(name) values ("Author 1");
insert into author(name) values ("Author 2");

select * from author;

insert into book(title,author_id,publisher,ISBN) values("Java for Dummies",1,"Wiley Publications",420);
insert into book(title,author_id,publisher,ISBN) values("Python for Dummies",2,"Wiley Publications",123);
insert into book(title,author_id,publisher,ISBN) values("JavaScript for Dummies",1,"Wiley Publications",100);

select * from book;

insert into department(name) values("Computer");
insert into department(name) values("Electronics");

select * from department;

insert into library_member(name,contact_number,email_address,address,department_id) values("Tony Stark",100,"tonystark@starkindustries.com","Malibu CA, USA",1);
insert into library_member(name,contact_number,email_address,address,department_id) values("Steve Rogers",100,"steverogers@avengers.com","Avengers HQ, USA",1);
insert into library_member(name,contact_number,email_address,address,department_id) values("Peter Parker",100,"peterparker@starkindustries.com","Queens",1);
insert into library_member(name,contact_number,email_address,address,department_id) values("Thanos",100,"themadtitan@marvel.com","Titan",2);


select * from library_member;

insert into staff(name,contact_number,email_address,address) values ("Babu Bhaiya",420,"babubhaiya@herapheri.com","Mumbai");
insert into staff(name,contact_number,email_address,address) values ("Jethiya",420,"jethalalchampaklalgada@tmkoc.com","Goregaon, Mumbai");
insert into staff(name,contact_number,email_address,address) values ("Bertram Gilfoyle",420,"systemarchitect@piedpiper.com","Palo Alto, CA, USA");

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
