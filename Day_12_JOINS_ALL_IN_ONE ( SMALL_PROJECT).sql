/* 
For this project I am using two external files to import data into the table .
File-1 : orders.csv
File-2 : products.csv

How to import data into the table from externally
Step-1 : First create tables according to the requirement.
Step-2 : Then right-click on the table choose import/export option and choose your file location .
Note : If there are any header go into the second section and enable the header toggle.
Step-3 : Choose encoding "UTF-8"
Then click on okay data will be imported from the external file to your table .
*/

create table products  (
product_id int primary key ,
product_name varchar(100),
category text , 
price numeric (10,2),
stock_quantity int , 
is_available boolean ,
added_on date
);

create table orders (
order_id int primary key ,
product_id int,
quantity int , 
order_date date , 
customer_name varchar(50),
payment_method varchar(50),
constraint fk_product 
foreign key (product_id) 
references products(product_id)
on delete cascade
);

select * from orders ;
select * from products ;

-- EXERSISE --

-- Q1. Show each order along with the product name and price.
select o.order_id , o.customer_name , p.product_name , p.price
from orders o inner join products p
on o.product_id = p.product_id ;

-- Q2. Show all products even if they were never ordered.
select o.order_id  , p.product_name 
from products p left join orders o
on o.product_id = p.product_id ;

-- Q3. Show orders for only 'Electronics' category.
select o.order_id , p.product_name , p.category
from orders o join products p
on o.product_id = p.product_id
where p.category = 'Electronics';

-- Q4. List all orders sorted by product price (high to low).
select o.order_id , p.product_name , p.price
from orders o join products p
on o.product_id = p.product_id
order by p.price desc;

-- Q5. Show number of orders placed for each product.
select p.product_name , count(o.order_id) as total_orders
from products p
left join orders o on p.product_id = o.product_id
group by p.product_name;

-- Q6. Show total revenue earned per product.
select p.product_name , sum(o.quantity * p.price) as revenue
from 
products p join orders o on p.product_id = o.product_id
group by p.product_name
order by revenue desc;

-- Q7. Show products where total order revenue > ₹2000.
select p.product_name , sum(o.quantity * p.price) as revenue
from 
products p join orders o on p.product_id = o.product_id
group by p.product_name
having sum(o.quantity * p.price) > 2000;

-- Q8. Show unique customers who ordered 'Fitness' products.
select distinct o.customer_name 
from orders o
join products p on o.product_id = p.product_id
where p.category = 'Fitness';ll

-- DATA INSERTS

INSERT INTO products VALUES
(101, 'Wireless Mouse', 'Electronics', 1611.53, 79, FALSE, '2025-04-29'),
(102, 'Bluetooth Speaker', 'Electronics', 135.14, 23, TRUE, '2025-06-04'),
(103, 'Laptop Stand', 'Accessories', 1020.92, 161, FALSE, '2025-07-09'),
(104, 'USB-C Hub', 'Accessories', 408.39, 164, FALSE, '2025-05-12'),
(105, 'Notebook', 'Stationery', 1987.74, 116, TRUE, '2025-07-01'),
(106, 'Pen Set', 'Stationery', 1048.1, 150, TRUE, '2025-06-29'),
(107, 'Coffee Mug', 'Home & Kitchen', 1063.53, 76, FALSE, '2025-04-15'),
(108, 'LED Desk Lamp', 'Home & Kitchen', 239.1, 93, FALSE, '2025-05-23'),
(109, 'Yoga Mat', 'Fitness', 1514.86, 162, TRUE, '2025-05-05'),
(110, 'Water Bottle', 'Fitness', 420.99, 191, TRUE, '2025-05-09'),
(111, 'Smartphone', 'Electronics', 361.2, 200, FALSE, '2025-04-18'),
(112, 'Headphones', 'Electronics', 154.84, 178, TRUE, '2025-05-18'),
(113, 'Gaming Keyboard', 'Accessories', 103.24, 100, FALSE, '2025-04-19'),
(114, 'Monitor', 'Electronics', 305.2, 123, FALSE, '2025-05-20'),
(115, 'HDMI Cable', 'Accessories', 552.97, 105, TRUE, '2025-06-17'),
(116, 'Power Bank', 'Electronics', 831.88, 13, FALSE, '2025-07-01'),
(117, 'Backpack', 'Accessories', 1517.11, 64, TRUE, '2025-05-08'),
(118, 'Webcam', 'Electronics', 1428.3, 76, FALSE, '2025-06-11'),
(119, 'Desk Organizer', 'Home & Kitchen', 404.69, 136, FALSE, '2025-06-14'),
(120, 'Fitness Band', 'Fitness', 1451.69, 171, FALSE, '2025-05-06');

INSERT INTO orders VALUES
(1, 120, 5, '2025-06-26', 'Rohan', 'Cash on Delivery'),
(2, 116, 5, '2025-06-21', 'Anjali', 'Cash on Delivery'),
(3, 101, 3, '2025-06-23', 'Rohan', 'Credit Card'),
(4, 115, 3, '2025-06-16', 'Akarsh', 'Credit Card'),
(5, 105, 3, '2025-06-24', 'Simran', 'Credit Card'),
(6, 110, 3, '2025-06-20', 'Simran', 'Credit Card'),
(7, 113, 5, '2025-07-06', 'Anjali', 'Credit Card'),
(8, 106, 1, '2025-06-30', 'Rohan', 'Credit Card'),
(9, 107, 3, '2025-06-27', 'Anjali', 'Cash on Delivery'),
(10, 112, 2, '2025-06-15', 'Meera', 'Cash on Delivery'),
(11, 105, 4, '2025-07-07', 'Meera', 'Net Banking'),
(12, 110, 3, '2025-06-13', 'Anjali', 'UPI'),
(13, 106, 3, '2025-07-10', 'Simran', 'Credit Card'),
(14, 104, 3, '2025-06-16', 'Akarsh', 'Net Banking'),
(15, 106, 1, '2025-07-11', 'Anjali', 'Cash on Delivery'),
(16, 119, 1, '2025-06-18', 'Akarsh', 'Cash on Delivery'),
(17, 111, 2, '2025-07-05', 'Akarsh', 'Cash on Delivery'),
(18, 107, 3, '2025-07-10', 'Anjali', 'Credit Card'),
(19, 119, 1, '2025-06-27', 'Meera', 'Cash on Delivery'),
(20, 109, 1, '2025-07-08', 'Akarsh', 'Credit Card');
