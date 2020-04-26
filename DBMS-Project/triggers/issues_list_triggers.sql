
DELIMITER $$

CREATE TRIGGER insert_before_issues_list
    BEFORE INSERT ON issues_list FOR EACH ROW
    BEGIN
        IF ((SELECT available FROM book_copy WHERE id=new.book_copy_id) <=> 0 )
        THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'BOOK COPY NOT AVAILABLE YET!';
        END IF;
    END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER insert_after_issues_list
    AFTER INSERT ON issues_list FOR EACH ROW
    BEGIN
        UPDATE book_copy x
            SET x.available=0,
            x.issues_list_id = new.id
        where new.book_copy_id <=> x.id;
    END$$

DELIMITER ;
