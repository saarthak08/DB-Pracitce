create table if not exists book_copy (
    id int NOT NUll AUTO_INCREMENT PRIMARY KEY,
    book_id int NOT NULL,
    local_id int, 
    returns_list_id int default NULL, 
    issues_list_id int default NULL,
    available boolean NOT NULL,
    FOREIGN KEY(book_id) REFERENCES book(id)
);

