create table if not exists library_member (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) NOT NULL,
    contact_number int NOT NULL,
    email_address varchar(100) NOT NULL UNIQUE,
    address varchar(200),
    department_id int NOT NULL, 
    FOREIGN KEY(department_id) REFERENCES department(id)
);