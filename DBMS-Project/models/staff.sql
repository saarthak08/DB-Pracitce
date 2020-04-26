create table if not exists staff (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) NOT NULL,
    address varchar(200),
    email_address varchar(100) UNIQUE,
    contact_number int NOT NULL
);