drop database if exists library_management_system;

create database if not exists library_management_system;

use library_management_system;

source models/author.sql;

source models/book.sql;

source models/department.sql;

source models/library_member.sql;

source models/staff.sql;

source models/book_copy.sql;

source models/issues_list.sql;

source models/returns_list.sql;


alter table book_copy
    add FOREIGN KEY(returns_list_id) REFERENCES returns_list(id);

alter table book_copy
    add FOREIGN KEY(issues_list_id) REFERENCES issues_list(id);