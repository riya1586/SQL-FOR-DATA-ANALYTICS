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


--Level 2 (INTERMEDIATE) ---

--1. IT department me kitne employees hain?
select count(*) as total_it_employees from employees where department = 'IT';

--2. Maximum salary find karo.
select max (salary) as maximum_sal from employees;

--3. Minimum salary find karo.
select min (salary) as min_sal from employees;

--4. Average salary calculate karo.
select avg (salary) as avg_sal from employees;

--5. Total salary of all employees.
select sum (salary) as total_salary from employees;

--6. Har department me kitne employees hain?
select count (emp_name) from employees group by department;

--7. Har department ki average salary.
select avg (salary) from from employees group by department;

--8. Highest salary kis department me hai?
 select department, max(salary) as highest_salary from  employees group by department order by highest_salary desc limit 1;

--9. Delhi me kitne employees hain?
select count emp_id from employees where city ='Delhi'

--10. Salary 40,000 aur 60,000 ke beech wale employees
select * from employees where salary between 40000 and 60000;
