
DELIMITER $$

CREATE TRIGGER insert_before_returns_list
    BEFORE INSERT ON returns_list FOR EACH ROW
    BEGIN
        IF ((SELECT available FROM book_copy WHERE id=new.book_copy_id) <=> 1 )
        THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'BOOK COPY NOT ISSUED YET';
        END IF;
    END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER insert_after_returns_list
    AFTER INSERT ON returns_list FOR EACH ROW
    BEGIN
        UPDATE book_copy x
            SET x.available=1,
            x.returns_list_id = new.id
        where new.book_copy_id <=> x.id;
    END$$

DELIMITER ;