CREATE database if not exists test;

use test;

source book.sql;


select
    count(*)
from
    books;


select
    count(distinct author_lname)
from
    books;


select
    count(distinct author_fname, author_lname)
from
    books;


select
    author_fname,
    author_lname,
    count(*)
from
    books
group by
    author_lname,
    author_fname;


select
    min(released_year)
from
    books;


select
    max(pages)
from
    books;


select
    max(pages),
    title
from
    books;


-- It doesn't work!!!
select
    *
from
    books
where
    pages = (
        select
            min(pages)
        from
            books
    );


select
    *
from
    books
order by
    pages asc
limit
    1;


select
    author_fname,
    author_lname,
    Sum(pages)
from
    books
group by
    author_fname,
    author_lname;


select
    avg(released_year)
from
    books;