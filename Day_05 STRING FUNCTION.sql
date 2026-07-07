/*
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

               --STRING FUNCTION---
			   
--STRING - JITNE BHINTEXT HOTE HAI UNHE STRING KAHTE H 

--(UPPER , LOWER , LENGTH)
-- 1. UPPER() - YE SARE TEXT KO UPPER CASE ME BADAL DETA HAI .
SELECT UPPER (NAME) FROM PRODUCTS; -- UPPER CASE EXAMPLE . 

-- 2. LOWER() - YE SARE TEXT KO LOWER CASE ME BADAL DETA HAI . 
SELECT LOWER (NAME) FROM PRODUCTS; -- LOWER CASE EXAMPLE .

-- 3. LENGTH() - YE KISI BHI TEXT KI LENGTH FIND KARNE KE LIYE USE HOTI HAI .
SELECT LENGTH (NAME) FROM PRODUCTS; -- LENGTH  EXAMPLE .


                    
				-- SUB STRING FUNCTION()--
				
--SUB STRING - STRING KE ANDER STRING HOTA HAI TO SUB STRING BOLTE HAI . 

SELECT NAME , SUBSTRING (SKU_CODE , 1,2) FROM PRODUCTS;--EXAMPLE OF SUB STRING .
SELECT NAME ,LOWER (SUBSTRING (SKU_CODE , 1,2)) AS SKU_CODE FROM PRODUCTS; --EXAMPLE OF LOWER CASE SUB STRING .


--LEFT() , RIGTH(), FUNCTION IN STRING --
SELECT NAME , LEFT (SKU_CODE , 2) FROM PRODUCTS;--EXAMPLE OF LEFT ()FUNCTION IN STRING .
SELECT NAME , RIGHT (SKU_CODE , 2) FROM PRODUCTS;--EXAMPLE OF RIGHT ()FUNCTION IN STRING .


                           --CONCATE() FUNCTION
						   
--CONCATE() - CONCATINATION FUNCTION JO HAI USE HOTA HAI TWO OR MORE STRING KO ADD KARNE KE LIYE . 
SELECT * FROM PRODUCTS ; 
SELECT CONCAT(NAME,' ', CATEGORY)FROM PRODUCTS; --EXAMPLE OF CONCAT FUNCTIO.

                            --CONCATE_WS() FUNCTION
							
--CONCATE_WS() - CONCATINTION WITH SEPERATED
SELECT CONCAT_WS(' ',NAME,CATEGORY,SKU_CODE) FROM PRODUCTS; --EXAMPLE OF CONCAT_WS FUNCTION.


                     --TRIM() FUNCTION AND REPLACE() FUNCTION . 

-- 1. TRIM() - TRIM FUNCTION IS USED TOI REMOVE ALL SPACES .
-- 2 .REPLACE() - REPLACE FUNCTION IS USED TO REPLACR ANYTHINGS YOU WANT.(KISI BHI CHEEJ KO REPLACE KARNE KE LIYE USE HOTA HAI)
SELECT TRIM('  BROTHER     '); --EXAMPLE OF TRIM .
SELECT NAME , REPLACE (SKU_CODE , LEFT (SKU_CODE ,2) , 'GG')FROM PRODUCTS ; --EXAMPLE OF REPLACE FUNCTION . 




















