create table if not exists book_copy (
    id int NOT NUll AUTO_INCREMENT PRIMARY KEY,
    book_id int NOT NULL,
    local_id int, 
    returns_list_id int default NULL, 
    issues_list_id int default NULL,
    available boolean NOT NULL,
    FOREIGN KEY(book_id) REFERENCES book(id)
);


DELIMITER $$

CREATE TRIGGER on_insert_copy
    AFTER INSERT ON book_copy 
    FOR EACH ROW
    BEGIN
        UPDATE book x
            SET x.total_no_of_copies=x.total_no_of_copies+1,
            x.no_of_copies_available=x.no_of_copies_available+1
          WHERE x.id <=> new.book_id AND new.available <=> 1
        ;
        UPDATE book x
            SET x.total_no_of_copies=x.total_no_of_copies+1
          WHERE x.id <=> new.book_id AND new.available <=> 0
        ;
    END

$$

DELIMITER ;




DELIMITER $$

CREATE TRIGGER on_update_copy
    AFTER UPDATE ON book_copy 
    FOR EACH ROW
    BEGIN
    IF NOT ( NEW.available <=> OLD.available ) THEN
        IF (NEW.available <=> 1) THEN
            UPDATE book x
                SET x.no_of_copies_available=x.no_of_copies_available+1
              WHERE x.id <=> new.book_id
            ;
        END IF;
        IF (NEW.available <=> 0) THEN
            UPDATE book x
                SET x.no_of_copies_available = x.no_of_copies_available-1
              WHERE x.id <=> new.book_id AND NOT x.no_of_copies_available <=> 0
            ;
        END IF;
    END IF;
    END$$

DELIMITER ;


