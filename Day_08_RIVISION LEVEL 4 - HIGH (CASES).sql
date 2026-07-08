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

--Level 4 (CASE)

--1. Salary ke basis par category banao:
--Salary >= 60000 → High
--Salary >= 40000 → Medium
--Otherwise → Low.
SELECT emp_name,
CASE
WHEN salary >= 60000 THEN 'High'
WHEN salary >= 40000 THEN 'Medium' 
ELSE 'Low'
END AS salary_category 
FROM employees;

--2. Experience ke basis par:
--5+ → Senior
--3–4 → Mid-Level
--Otherwise → Fresher
SELECT EMP_NAME , EXPERIENCE ,
CASE 
WHEN EXPERIENCE >= 5 THEN 'SENIOR'
WHEN EXPERIENCE BETWEEN 3 AND 4 THEN 'MID-LEVEL'
ELSE 'FRESHER'
END AS EXPERIENCE_CATEGORY
FROM EMPLOYEES;
