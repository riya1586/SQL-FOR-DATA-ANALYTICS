---Objective of the Project---
---Project Title: Online Examination Management System

/*The main objective of the Online Examination Management System
is to develop a secure, reliable, and user-friendly application that allows educational
institutions to conduct examinations online. The system automates the complete examination
process, from student registration and exam creation to result generation, reducing manual work and improving accuracy.

--Objectives--

1. To provide a digital platform for conducting online examinations.
2. To allow students to register, log in, and attend exams securely.
3. To enable the admin to create and manage subjects, exams, and questions.
4. To store student, exam, question, and result data efficiently using a PostgreSQL database.
5. To evaluate student answers and generate results quickly and accurately.
6. To reduce paperwork and save time in the examination process.
7. To maintain data security and prevent unauthorized access.
8. To generate reports and analyze student performance easily.
9. To improve transparency, accuracy, and efficiency in examination management.
10. To provide a scalable system that can be enhanced with future features such as timers, negative marking, online proctoring, and email notifications.*/


---1: STUDENTS---

CREATE TABLE Students
(
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    course VARCHAR(50),
    password VARCHAR(100)
);



---2: ADMIN---

CREATE TABLE Admin
(
    admin_id SERIAL PRIMARY KEY,
    admin_name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100)
);



---3: SUBJECTS---

CREATE TABLE Subjects
(
    subject_id SERIAL PRIMARY KEY,
    subject_name VARCHAR(100)
);



---4: EXAMS---

CREATE TABLE Exams
(
    exam_id SERIAL PRIMARY KEY,
    subject_id INT,
    exam_name VARCHAR(100),
    total_marks INT,
    exam_date DATE,
    duration INT,

    FOREIGN KEY(subject_id)
    REFERENCES Subjects(subject_id)
);



---5: QUESTIONS---

CREATE TABLE Questions
(
    question_id SERIAL PRIMARY KEY,
    exam_id INT,

    question TEXT,

    option_a VARCHAR(200),
    option_b VARCHAR(200),
    option_c VARCHAR(200),
    option_d VARCHAR(200),

    correct_answer CHAR(1),

    marks INT,

    FOREIGN KEY(exam_id)
    REFERENCES Exams(exam_id)
);



---6: STUDENT ANSWER---

CREATE TABLE Student_Answers
(
    answer_id SERIAL PRIMARY KEY,

    student_id INT,

    question_id INT,

    selected_option CHAR(1),

    FOREIGN KEY(student_id)
    REFERENCES Students(student_id),

    FOREIGN KEY(question_id)
    REFERENCES Questions(question_id)
);




---7. RESULTS---

CREATE TABLE Results
(
    result_id SERIAL PRIMARY KEY,

    student_id INT,

    exam_id INT,

    score INT,

    percentage DECIMAL(5,2),

    status VARCHAR(20),

    FOREIGN KEY(student_id)
    REFERENCES Students(student_id),

    FOREIGN KEY(exam_id)
    REFERENCES Exams(exam_id)
);



---INSERT DATA---

---1: STUDENTS---

INSERT INTO Students(student_name,email,phone,course,password)
VALUES
('Riya Mishra','riya@gmail.com','9876543210','BCA','123'),

('Aman Singh','aman@gmail.com','9876543211','BCA','123'),

('Neha Sharma','neha@gmail.com','9876543212','BCA','123'),

('Rahul Verma','rahul@gmail.com','9876543213','BCA','123'),

('Priya Yadav','priya@gmail.com','9876543214','BCA','123');



---2: ADMIN---

INSERT INTO Admin(admin_name,email,password)
VALUES
('Admin','admin@gmail.com','admin123');
Subjects
INSERT INTO Subjects(subject_name)
VALUES
('Java'),
('SQL'),
('Python'),
('C Programming'),
('Data Structures');



---3: EXAMS----

INSERT INTO Exams(subject_id,exam_name,total_marks,exam_date,duration)
VALUES

(1,'Java Mid Exam',100,'2026-08-10',60),

(2,'SQL Test',100,'2026-08-12',60),

(3,'Python Test',100,'2026-08-15',60);



---4: QUESTIONS---

INSERT INTO Questions
(exam_id,question,option_a,option_b,option_c,option_d,correct_answer,marks)

VALUES

(2,
'SQL stands for?',
'Structured Query Language',
'Simple Query Language',
'System Query Language',
'Sequential Query Language',
'A',
5),

(2,
'Which command retrieves data?',
'SELECT',
'GET',
'SHOW',
'OPEN',
'A',
5),

(2,
'Which clause filters rows?',
'ORDER BY',
'GROUP BY',
'WHERE',
'HAVING',
'C',
5),

(3,
'Python is?',
'Programming Language',
'Database',
'Browser',
'Compiler',
'A',
5),

(1,
'Java is?',
'Programming Language',
'Database',
'OS',
'Network',
'A',
5);



---5: STUDENT ANSWER---

INSERT INTO Student_Answers
(student_id,question_id,selected_option)

VALUES

(1,1,'A'),
(1,2,'A'),
(1,3,'C'),

(2,1,'B'),
(2,2,'A'),
(2,3,'A'),

(3,1,'A'),
(3,2,'A'),
(3,3,'C');



---6: RESULTS---

INSERT INTO Results
(student_id,exam_id,score,percentage,status)

VALUES

(1,2,15,100,'Pass'),

(2,2,5,33.33,'Fail'),

(3,2,15,100,'Pass');



--1. Show Students--
SELECT * FROM Students;


--2. Show Subjects--
SELECT * FROM Subjects;


--3. Show Exams--
SELECT * FROM Exams;


--4. Student Result--
SELECT
s.student_name,
e.exam_name,
r.score,
r.percentage,
r.status

FROM Results r

JOIN Students s

ON r.student_id=s.student_id

JOIN Exams e

ON r.exam_id=e.exam_id;


--5. Students Passed--
SELECT *
FROM Results
WHERE status='Pass';


--6. Highest Score--
SELECT MAX(score)
FROM Results;


--7. Average Score--
SELECT AVG(score)
FROM Results;


--8. Number of Students--
SELECT COUNT(*)
FROM Students;


--9. Total Exams--
SELECT COUNT(*)
FROM Exams;


--10. Students by Course--
SELECT course,
COUNT(*)
FROM Students
GROUP BY course;


--11. Students Score Greater Than 10--
SELECT *
FROM Results
WHERE score>10;


--12. Order by Percentage--
SELECT *
FROM Results
ORDER BY percentage DESC;


--13. Student + Subject--
SELECT

s.student_name,

sub.subject_name,

e.exam_name

FROM Students s

JOIN Results r

ON s.student_id=r.student_id

JOIN Exams e

ON r.exam_id=e.exam_id

JOIN Subjects sub

ON e.subject_id=sub.subject_id;


--14. Topper--
SELECT

s.student_name,

MAX(r.score)

FROM Students s

JOIN Results r

ON s.student_id=r.student_id

GROUP BY s.student_name

ORDER BY MAX(r.score) DESC

LIMIT 1;


--15. Students Who Failed--
SELECT

s.student_name,
r.status

FROM Students s

JOIN Results r

ON s.student_id=r.student_id

WHERE status='Fail';


--16. View--
CREATE VIEW Student_Result_View AS

SELECT

s.student_name,

sub.subject_name,

e.exam_name,

r.score,

r.percentage,

r.status

FROM Students s

JOIN Results r

ON s.student_id=r.student_id

JOIN Exams e

ON r.exam_id=e.exam_id

JOIN Subjects sub

ON e.subject_id=sub.subject_id;


--Use:--
SELECT * FROM Student_Result_View;


---Conclusion--

The Online Examination Management System is an efficient
and reliable database application that simplifies the process of conducting online exams.
It helps manage students, exams, questions, and results accurately using PostgreSQL. 
The system reduces manual work, improves data accuracy, saves time, and 
provides a secure way to store examination records. Overall, 
this project demonstrates the practical use of DBMS concepts 
developing a real-world online examination system.
