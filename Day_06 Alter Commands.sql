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
