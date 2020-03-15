create database if not exists trigger_demo;

use trigger_demo;


create table users(
    username varchar(100),
    age INT
);

insert into users(username ,age) values('bobby',23);


/*
TRIGGER SYNTAX

Delimiters are used to indicate the end of input. Delimiter $$ denotes that $$ is the end of input.
Then at last, DELIMITER ; set backs delimiter to ;.


DELIMITER $$
CREATE TRIGGER trigger_name
    trigger_time trigger_event ON table_name FOR EACH ROW
    BEGIN
    -- MAIN TRIGGER CODE --
    END;
$$
DELIMITER ;

*/


-- TRIGGER CODE
DELIMITER $$

CREATE TRIGGER must_be_adult
    BEFORE INSERT ON users FOR EACH ROW
    BEGIN
        IF NEW.age < 18
        THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'MUST BE AN ADULT!';
        END IF;
    END;

$$

DELIMITER ;
-- TRIGGER CODE


insert into users(username,age) values('Sue',23);

insert into users(username,age) values('Sue',15);

show triggers;

drop trigger trigger_demo.must_be_adult;