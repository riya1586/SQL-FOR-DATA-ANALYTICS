/*
SMALL PROJECT

Create a database named Flipkart_db and then create a table with the following fields:

Product ID – Serial
Name – String
SKU Code – 8-digit String
Price – Number (Maximum: 99999999)
Stock Quantity – Number (must be greater than 0)
Is Available – Boolean (Default: TRUE)
Category – String (NOT NULL)
Added On – Date
Last Update – Date
*/

--Creating Table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    sku_code CHAR(8) UNIQUE NOT NULL,
    price NUMERIC(10,2) CHECK (price > 0),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
    is_available BOOLEAN DEFAULT TRUE,
    category TEXT NOT NULL,
    added_on DATE DEFAULT CURRENT_DATE,
    last_updated TIMESTAMP DEFAULT NOW()
);

--Inserting the data into the table
INSERT INTO products (name, sku_code, price, stock_quantity, is_available, category)
VALUES
('Wireless Mouse', 'WM123456', 699.99, 50, TRUE, 'Electronics'),
('Bluetooth Speaker', 'BS234567', 1499.00, 30, TRUE, 'Electronics'),
('Laptop Stand', 'LS345678', 799.50, 20, TRUE, 'Accessories'),
('USB-C Hub', 'UC456789', 1299.99, 15, TRUE, 'Accessories'),
('Notebook', 'NB567890', 99.99, 100, TRUE, 'Stationery'),
('Pen Set', 'PS678901', 199.00, 200, TRUE, 'Stationery'),
('Coffee Mug', 'CM789012', 299.00, 75, TRUE, 'Home & Kitchen'),
('LED Desk Lamp', 'DL890123', 899.00, 40, TRUE, 'Home & Kitchen'),
('Yoga Mat', 'YM901234', 499.00, 25, TRUE, 'Fitness'),
('Water Bottle', 'WB012345', 349.00, 60, TRUE, 'Fitness');

--CLAUSES WITH OPERATORS
--1. COMPARISON ( = , != ,< ,> ,<= ,>= )

select * from products where category = 'Electronics';

select * from products where category != 'Electronics';

select * from products where price < 2000;

select * from products where price > 2000;

select * from products where price <= 2000;

select * from products where price >= 2000;

--2. RANGE (BETWEEN) FUNCTION/OPERATOR
select * from products where price Between 400 and 2000;

--3. SET ( IN ) FUNCTION/OPERATOR
select * from products where category in ('Electronics','Accessories','Fitness');

--4. PATTERN (LIKE) FUNCTION/OPERATOR
select * from products where sku_code LIKE 'W%';
select * from products where sku_code Like '%234';
select * from products where sku_code Like '__9%';
select * from products where sku_code Like '_S%';

--LOGICAL (AND,OR,NOT) FUNCTION/OPERATOR

--AND - and operator ka kaam hai ki wo dono tables mein se data deta hai matlab ki agar do condition diya hai to dono condition sahi honi chahiye
--OR - or operator ka kaam hai ki wo diye gaye conditionsmein se agar koi eh bhi sahi hai to wo value return krta hai
--NOT - not operator true value ko false kar deta hai aur false value ko true kar deta hai.

select * from products where price Between 400 and 2000;
select * from products where category = 'Electronics' or category = 'Accessories' or category = 'Fitness';
select * from products where not category = 'Electronics';

--AGGREGATION FUNCTION
--Aggregation function are used to summarize data. (like COUNT() , SUM() , AVG() , MIN() , MAX() )
--COUNT() - count function row ko count karta hai.
--SUM() - sum function number wale values ko add karta hai.
--AVG() - average function avetrage count karta hai kisi bhi diye gaye 2 ya 3 ya jitne chahe utne numbers ke beech mein
--MIN() - minimum function kisi bhi diye gaye data ke beech mein minimum value find krta hai .
--MAX() - maximum function kisi bhi diye gaya data ke beech mein maximum value find  karta hai .

select count (product_id)from products ; --COUNT() EXAMPLE.
select sum (price)from products ; --SUM() EXAMPLE WITHOUT CONDITION.
select sum (price)from products where category = 'Electronices'; --SUM() EXAMPLE WITH CONDITION.
select avg (price)from products ; --AVG() EXAMPLE.
select round(avg (price),2)from products ; --AVG() EXAMPLE WITH ROUND FUNCTION.
select min (price)from products ; --MIN() EXAMPLE.
select max (price)from products ; --MAX() EXAMPLE.



















