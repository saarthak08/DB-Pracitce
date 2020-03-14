create database if not exists test;

use test;


source book.sql;


create table customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100)
);


CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT NOT NULL, --UNIQUE, -- here UNIQUE PROPERTY DENOTES ONE TO ONE RELATIONSHIP. IF NOT UNIQUE THEN ONE TO MANY RELATIONSHIP
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);


INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

-- Finding Orders Placed By George: 2 Step Process
SELECT id FROM customers WHERE last_name='George';
SELECT * FROM orders WHERE customer_id = 1;


-- Finding Orders Placed By George: Using a subquery
SELECT * FROM orders WHERE customer_id =
    (
        SELECT id FROM customers
        WHERE last_name='George'
    );


-- Cross Join Craziness  --Maps each customer to each order
SELECT * FROM customers, orders; 


-- IMPLICIT INNER JOIN
SELECT * FROM customers, orders 
WHERE customers.id = orders.customer_id;

    
-- EXPLICIT INNER JOINS
SELECT * FROM customers
INNER JOIN orders
    ON customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
ORDER BY order_date;


-- LEFT JOIN  (INCLUDES ALL CUSTOMERS)
SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;



-- RIGHT JOIN  (INCLUDES ALL CUSTOMERS)
SELECT * FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;




-- WORKING WITH ON DELETE CASCADE (DELETES ALL ORDERS IF CUSTOMER IS DELETED)
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) 
        REFERENCES customers(id)
        ON DELETE CASCADE
);


INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);