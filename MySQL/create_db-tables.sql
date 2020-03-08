

/* In order to run a sql file :
	
	source <SQL file with complete file path followed by file name>

	Eg:
	source ~/Documents/abc.sql
	
	*/

show databases;   -- show the list of databases

create database test;  -- creates a database names test



drop database test;  -- drop database naming test


create database test;

use test; -- using the database i.e. current database is selected.


select database(); --return current selected database

