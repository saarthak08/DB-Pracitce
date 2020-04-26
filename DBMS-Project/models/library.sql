create table if not exists library (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email_address varchar(100),
    address varchar(200),
    contact_number int
);