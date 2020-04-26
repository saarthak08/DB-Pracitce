create table if not exists book (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title varchar(200) NOT NULL,
    publisher varchar(200) NOT NULL,
    ISBN int NOT NULL UNIQUE,
    total_no_of_copies int default 0,
    no_of_copies_available int default 0,
    library_id int NOT NULL,
    FOREIGN KEY (library_id) REFERENCES library(id)
);

