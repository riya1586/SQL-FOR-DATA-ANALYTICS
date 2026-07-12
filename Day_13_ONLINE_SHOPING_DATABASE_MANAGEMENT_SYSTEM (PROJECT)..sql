---PROJECT NAME: ONLINE SHOPING DATA BASE MANAGEMENT SYSTEM(⭐⭐⭐ MEDIUM)---

--TOOLS: PostgreSQL--


--CONCEPT USED:--

/*  DDL, DML, Constraints, Primary Key, Foreign Key, Joins, Aggregate Functions,
GROUP BY, HAVING, ORDER BY, LIMIT, Reporting Queries. */


---DESCERIPTION:---

/* Designed and implemented a relational database for an online shopping system. 
Created normalized tables for customers, categories, products, orders, and order items.
Wrote SQL queries to generate business reports such as total sales, best-selling products,
monthly revenue, top customers, pending orders, category-wise sales, and customer purchase history
using joins and aggregate functions.*/

.--PROJECT : ONLINE SHOPING DATABASE(⭐⭐⭐ MEDIUM)--

---Create Tables (DDL)---

--. Customers
--. Products
--. Orders
--. Order_Items.


---CUSTOMER---

CREATE TABLE Customers(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);


---PRODUCTS---

CREATE TABLE Products(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);


---ORDERS---

CREATE TABLE Orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),

    FOREIGN KEY(customer_id)
    REFERENCES Customers(customer_id)
);



---ORDER_ITEMS---

CREATE TABLE Order_Items(
    order_item_id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY(order_id)
    REFERENCES Orders(order_id),

    FOREIGN KEY(product_id)
    REFERENCES Products(product_id)
);



--- Insert Data (DML)---

--. INSERT INTO Customers
--. INSERT INTO Products
--. INSERT INTO Orders
--. INSERT INTO Order_Items



---INSERT_CUSTOMERS---

INSERT INTO Customers(customer_name,email,city)
VALUES
('Riya','riya@gmail.com','Noida'),
('Priya','priy@gmail.com','Delhi'),
('prashant','pt@gmail.com','Lucknow'),
('Ariya','ariya@gmail.com','Kanpur'),
('Neha','neha@gmail.com','Mumbai');



---INSERT_PRODUCTS---

INSERT INTO Products(product_name,price,stock)
VALUES
('Laptop',60000,10),
('Mouse',700,100),
('Keyboard',1500,50),
('Headphones',2500,40),
('Monitor',12000,20);



---INSERT_ORDERS---

INSERT INTO Orders(customer_id,order_date,status)
VALUES
(1,'2026-07-01','Delivered'),
(2,'2026-07-02','Pending'),
(3,'2026-07-03','Delivered'),
(4,'2026-07-05','Cancelled'),
(5,'2026-07-06','Pending'),
(1,'2026-07-08','Delivered');



---INSERT_ORDER_ITEMS---

INSERT INTO Order_Items(order_id,product_id,quantity)
VALUES
(1,1,1),
(1,2,2),

(2,3,1),

(3,5,1),
(3,2,3),

(4,4,2),

(5,2,5),

(6,1,1),
(6,3,1);

---Basic Queries---
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Order_Items;


---1. Show All Customers---
SELECT * FROM Customers;


---2. Show All Products---
SELECT * FROM Products;


---3.Customer Order History---
SELECT c.customer_name,
       o.order_id,
       o.order_date,
       o.status
FROM Customers c
JOIN Orders o
ON c.customer_id=o.customer_id;


---4. Product Wise Sales---
SELECT p.product_name,
       SUM(oi.quantity) AS total_sold
FROM Products p
JOIN Order_Items oi
ON p.product_id=oi.product_id
GROUP BY p.product_name;


---5. Total Sales---
SELECT SUM(oi.quantity*p.price) AS total_sales
FROM Order_Items oi
JOIN Products p
ON oi.product_id=p.product_id;


---6. Best Selling Product---
SELECT p.product_name,
       SUM(oi.quantity) AS quantity
FROM Products p
JOIN Order_Items oi
ON p.product_id=oi.product_id
GROUP BY p.product_name
ORDER BY quantity DESC
LIMIT 1;


---7. Customer Who Spent Most---
SELECT c.customer_name,
 SUM(oi.quantity*p.price) AS total_spent
FROM Customers c
JOIN Orders o
ON c.customer_id=o.customer_id
JOIN Order_Items oi
ON o.order_id=oi.order_id
JOIN Products p
ON oi.product_id=p.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;


---8. Monthly Sales---
SELECT DATE_TRUNC('month',o.order_date) AS month,
SUM(oi.quantity*p.price) AS sales
FROM Orders o
JOIN Order_Items oi
ON o.order_id=oi.order_id
JOIN Products p
ON oi.product_id=p.product_id
GROUP BY DATE_TRUNC('month',o.order_date);


---9. Pending Orders---
SELECT *
FROM Orders
WHERE status='Pending';


---10. Total Pending Orders---
SELECT COUNT(*) AS pending_orders
FROM Orders
WHERE status='Pending';


---11. Most Expensive Product---
SELECT COUNT(*) AS pending_orders
FROM Orders
WHERE status='Pending';


---12. Lowest Price Product---
SELECT *
FROM Products
ORDER BY price
LIMIT 1;


---13. Average Product Price---
SELECT AVG(price)
FROM Products;


---14. Total Orders---
SELECT COUNT(*)
FROM Orders;


---15. Delivered Orders---
SELECT COUNT(*)
FROM Orders
WHERE status='Delivered';


---16 Cancelled Orders---
SELECT COUNT(*)
FROM Orders
WHERE status='Cancelled';


---17 Customer-wise Number of Orders---
SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_name;


--- CONCLUSION ---

--This project demonstrates the use of SQL for designing and managing an online shopping database.
--It covers DDL, DML, joins, aggregate functions, grouping, sorting, and business reporting queries.




