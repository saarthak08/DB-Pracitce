create table if not exists returns_list (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    book_copy_id int NOT NULL,
    library_member_id int NOT NULL,
    staff_id int NOT NULL,
    date_of_return DATETIME default NOW(),
    FOREIGN KEY(book_copy_id) REFERENCES book_copy(id),
    FOREIGN KEY(library_member_id) REFERENCES library_member(id),
    FOREIGN KEY(staff_id) REFERENCES staff(id)
);




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

CREATE TRIGGER insert_after_return_list
    AFTER INSERT ON returns_list FOR EACH ROW
    BEGIN
        UPDATE book_copy x
            SET x.available=1,
            x.returns_list_id = new.id
        where new.book_copy_id <=> x.id;
    END$$

DELIMITER ;
