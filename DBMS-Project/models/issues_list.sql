create table if not exists issues_list (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    book_copy_id int NOT NULL,
    library_member_id int NOT NULL,
    staff_id int NOT NULL,
    date_of_issue DATETIME default NOW(),
    FOREIGN KEY(book_copy_id) REFERENCES book_copy(id),
    FOREIGN KEY(library_member_id) REFERENCES library_member(id),
    FOREIGN KEY(staff_id) REFERENCES staff(id)
);


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
