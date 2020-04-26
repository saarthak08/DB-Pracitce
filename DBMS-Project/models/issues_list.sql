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

