-----ALTER----
/*USE CASES OF ALTER:
1. ADD NEW COLUMNS
2. REMOVE COLUMNS
3. RENAME COLUMNS
4. CHANGE DATA TYPES
5. SET OR REMOVE DEFAULT VALUES
6. ADD OR REMOVE CONSTRAINTS
7. RENAME THE TABLE */

create table student(
student_id serial primary key ,
name varchar (100),
age bigint
);

insert into student (name,age)
values
('prashant',21),
('riya',21),
('tulshi',11);

--ADD NEW COLUMN--
alter table student add column email varchar(100);
alter table student add column email varchar (200) default 'not provided';


--REMOVE A COLUMN--
alter table student drop column email;

--RENAME A COLUMN--
alter table student rename column name to first_name;

--CHANGE DATA TYPE OF COLUMN--
alter table student alter column age type smallint;

--SET A DEFAULT VALUE--
alter table student alter column age set default 18;

--REMOVE A DEFAULT VALUE--
alter table student alter column age drop default;

--ADD A CONSTRAINTS--
alter table student add constraint age_check check(age >= 0);

--REMOVE A CONSTRAINTS
alter table student drop constraint age_check;

--RENAME TABLE NAME
alter table student rename to school_students;

select * from school_students;



-------CASE-------
/* SYNTAX OF CASE IN SQL
SELECT COLUMN1,
CASE
WHEN (CONDITION) THEN RESULT1
WHEN (CONDITION2) THEN RESULT2
......
ELSE DEFAULT_RESULT
END AS NEW_COLUMN_NAME
FROM TABLE_NAME; */


--CASE DEFENATION--
/*Case ko samajhne ka best tareeka ek simple example se hai.

Isme tum ek custom column add karoge jiska naam price_tag hoga.

Agar price 1000 se zyada hai, to uska price_tag = "Expensive" hoga.
Agar price 500 se 1000 ke beech hai, to uska price_tag = "Moderate" hoga.
Aur agar price 500 se kam hai, to uska price_tag = "Cheap" hoga.*/

SELECT * FROM PRODUCTS;

SELECT NAME , PRICE, 
CASE WHEN (PRICE > 1000)THEN 'EXPENSIVE'
WHEN (PRICE BETWEEN 500 AND 1000)THEN 'MODERATE'
ELSE 'CHEAP'
END AS PRICE_TAG FROM PRODUCTS;
-- NOTE: Ye sirf table ka copy hai real table nahi hai matlab ki ye bas temporary table hai
-- Ise real table mein use karne ke liye alter command ka use krenge .

--STEPS TO ALTER THIS DATA INTOREAL TABLE
--STEP - 1: CREAT A NEW COLUMN
ALTER TABLE PRODUCTS ADD COLUMN PRICE_TAGE TEXT;

--STEP - 2: UPDATE THAT COLUMN USING CASE
UPDATE PRODUCTS
SET PRICE_TAGE =
CASE WHEN PRICE >1000 THEN 'MODERATE'
ELSE 'CHEAP'
END;
SELECT * FROM PRODUCTS;


--PRACTICE-2 HIGHLIGHT STOCK STATUS

/* SHOW PRODUCT NAME , STOCK QUANTITY AND LABEL:"
1. 'HIGH STOCK' IF QUANTITY > 100
2. 'MEDIUM STOCK' IF BETWEEN 30 AND 100
3. 'LOW STOCK' OTHERWISE */

 SELECT name,
    stock_quantity,
    CASE
    WHEN stock_quantity > 100 THEN 'High Stock'
    WHEN stock_quantity BETWEEN 30 AND 100 THEN 'Medium Stock'
    ELSE 'Low Stock'
    END AS stock_label
FROM products;


 
