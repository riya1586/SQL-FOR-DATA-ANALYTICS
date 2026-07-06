CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30),
    experience INT
);

INSERT INTO employees VALUES
(101, 'Riya', 'HR', 30000, 'Delhi', 2),
(102, 'Aman', 'IT', 55000, 'Noida', 4),
(103, 'Priya', 'Sales', 40000, 'Delhi', 3),
(104, 'Rahul', 'IT', 60000, 'Lucknow', 5),
(105, 'Neha', 'HR', 35000, 'Noida', 2),
(106, 'Karan', 'Sales', 45000, 'Delhi', 4),
(107, 'Anjali', 'IT', 70000, 'Noida', 6),
(108, 'Rohit', 'Finance', 50000, 'Delhi', 5);

--Level 1 (Basic)--

-- 1. Sabhi employees ka data display karo.
select * from employees;

-- 2. Sirf emp_name aur salary show karo.
select emp_name , salary from employees;

-- 3. Delhi ke employees dikhaye.
select * from employees where city = 'Delhi' ;

-- 4. Salary 50,000 se zyada wale employees.
select * from employees where salary>50000;

-- 5. Experience 3 years ya usse zyada wale employees.
select * from employees where experience >3 ;

-- 6. IT department ke employees.
select * from employees where department = 'it';

-- 7. Salary descending order me display karo.
select * from employees order by salary desc ;

-- 8. Employee names alphabetical order me show karo.
select emp_name from employees order by emp_name;

-- 9. Top 3 highest paid employees.
select * from employees order by salary desc limit 3;

-- 10. Noida ke employees ki details.
select * from employees where city = 'Noida';


