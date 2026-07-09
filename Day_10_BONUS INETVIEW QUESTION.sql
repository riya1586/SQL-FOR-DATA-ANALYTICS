CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30),
    experience INT
);


INSERT INTO employee VALUES
(101, 'Riya', 'HR', 30000, 'Delhi', 2),
(102, 'Aman', 'IT', 55000, 'Noida', 4),
(103, 'Priya', 'Sales', 40000, 'Delhi', 3),
(104, 'Rahul', 'IT', 60000, 'Lucknow', 5),
(105, 'Neha', 'HR', 35000, 'Noida', 2),
(106, 'Karan', 'Sales', 45000, 'Delhi', 4),
(107, 'Anjali', 'IT', 70000, 'Noida', 6),
(108, 'Rohit', 'Finance', 50000, 'Delhi', 5);


select * from employee;


               ----Bonus Interview Questions---

--1. WHERE aur HAVING me difference?

-- WHERE (EXPLANATION)--		
--. Rows ko filter karta hai	
--. GROUP BY se pehle execute hota hai	
--. Aggregate functions (SUM, AVG, COUNT) use nahi kar s

--EXAMPLE (WHERE)--
SELECT *
FROM employees
WHERE salary > 50000;



--HAVING (EXPLANATION)--
-- . Groups ko filter karta hai.
-- . GROUP BY ke baad execute hota hai.
-- . Aggregate functions use kar sakte hai.

--EXAMPLE (HAVING)--
SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) >= 2;


--2. DELETE, TRUNCATE, aur DROP me difference?

--DELETE (EXPLANATION)--
--. Selected rows delete karta hai.
--. WHERE use kar sakte hain.
--. Table structure rehti hai
--. Rollback possible (transaction par depend karta hai)

 --EXAMPLE (DELETE)--
 DELETE FROM employees
WHERE department = 'HR';


--TRUNCATE (EXPLANATION)--
-- Table ka sara data delete karta hai.
-- WHERE clause use nahi kar sakte.
-- Table structure rehti hai.
-- Rollback DBMS aur transaction support par depend karta hai.

--TRUNCATE (EXAMPLE)--
TRUNCATE TABLE employees;


--DROP (EXPLANATION)--
-- . Puri table delete kar deta hai.
-- . WHERE clause use nahi hota.
-- . Table ka structure bhi delete ho jata hai.
-- . Rollback generally possible nahi hota.

--DROP(EXAMPLE)--
DROP TABLE employees;


--3. PRIMARY KEY aur FOREIGN KEY me difference?

--PRIMARY KEY--
-- . Record ko uniquely identify karti hai.	
-- . Duplicate values allowed nahi karta.
-- . NULL allowed nahi hota hai.	
-- . Ek table me sirf ek Primary Key hoti hai.	

--PRIMARY KEY (EXAMPLE)--
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);


--FOREIGN KEY--
-- . Do tables ke beech relationship banati hai.
-- . Duplicate values allowed ho sakti hain.
-- . NULL allowed ho sakta hai (design par depend karta hai).
-- . Ek table me multiple Foreign Keys ho sakti hain.

--FOREIGN KEY(EXAMPLE)--
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


--4. GROUP BY kab use karte hain?
--Jab hume same values ko group karke aggregate functions (COUNT, SUM, AVG, MAX, MIN) lagani hoti hain tab group by ka use karte h.


--GROUP BY (Example)--
SELECT d.dept_name,
       COUNT(*) AS total_employees
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

select * from departments;
	

--5. COUNT(*) aur COUNT(column_name) me difference?

--COUNT(*) (EXPLANATION)-- 
--Sabhi rows count karta hai.

--COUNT(*) (EXAMPLE)--

| emp_id | phone      |
| -----: | ---------- |
|      1 | 9876543210 |
|      2 | NULL       |
|      3 | 9123456789 |

SELECT COUNT(*) FROM employees;


--COUNT(column_name) (EXPLANATION)--
--.Sirf non-NULL values count karta hai.

--COUNT(column_name)(EXAMPLE)--
SELECT COUNT(phone) FROM employees;

