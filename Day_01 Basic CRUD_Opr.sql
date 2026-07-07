--Basic CRUD operation (C-Create , R-Read , U-Update , D-Delete)

--This is the syntax to create the table
CREATE TABLE employees(
emp_ID INT,
emp_name char(21),
position char(50), 
salary BIGINT, 
address char (50)
);

--This is the method to insert the data into the table
INSERT INTO employees(emp_id,emp_name,position,salary,address)
VALUES (101,'prashant','data science',10000000,'rajkot'),
(102,'riya','data sciences',10000000000,'noida');

--Now the method to read any data
Select * from employees; --pura table read krne ke liye
--kisi particular user ki data read krne ke liye hun condition ka use krenge jiske liye "where" clause ka use kiya jata hai
Select emp_name from employees where emp_id=102;

--Now U-Update ke liye syntax
Update employees 
Set emp_name ='priya'
where emp_id = 102;
--Now check the updation
Select emp_name from employees where emp_id = 102;

/* 
Note : table mein kuch bhi update krne ke liye sabse pehle likhenge "Update" keyword uske baad "table-name" uske baad 
likhenge "Set" keyword phir jis column mein hame change krna hai uss column ka naam likhenge phir jo nayi value
insert krna hai wo likhenge uske baad "Where" clause ka use krke comdition provide krenge ki hame actully mein change kaha
krna hai */

--Now D-Delete ke liye syntax
Delete from employees 
where emp_id = 101;
-- Checking
Select * from employees;
