drop database if exists library_management_system;

create database if not exists library_management_system;

use library_management_system;

source models/library.sql;

source models/author.sql;

source models/book.sql;

source models/department.sql;

source models/library_member.sql;

source models/staff.sql;

source models/book_copy.sql;

source models/issues_list.sql;

source models/returns_list.sql;

source triggers/book_copy_triggers.sql;

source triggers/issues_list_triggers.sql;

source triggers/returns_list_triggers.sql;

source relationships/relationship_tables.sql;