/*
Task : Create a table named "Order" with 4 entities (order_id(INT) , order_name(char(50)) , date(date) , location(char(50))) .
Insert atleast 3 data into the table and perfrom Read , Update and Delete operation . */

CREATE TABLE orders (
order_id INT,
order_name char (50),
date date,
location char (50)
	);

INSERT INTO orders(order_id,order_name,date,location)
VALUES(101,'laptop','2026-6-18','noida');

INSERT INTO orders(order_id,order_name,date,location)
VALUES(102,'phone','2026-6-19','delhi'),
(103,'tab','2026-6-28','maskanwa');

SELECT * FROM orders;

SELECT order_name from orders WHERE order_id = 101;
SELECT date from orders WHERE order_id = 102;
SELECT location from orders WHERE order_id =102;

UPDATE orders 
SET order_name = 'pen'
where order_id = 101 ;

UPDATE orders
SET order_name ='cap'
where order_id = 102 ;

DELETE FROM orders 
where order_id =101;

DELETE FROM orders
where order_name = 'tab';

SELECT * FROM orders;

