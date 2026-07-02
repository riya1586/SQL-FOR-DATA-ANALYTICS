/* 
Numeric Data Types 
1.SMALLINT (2 BYTE INTEGER)
2. INTEGER/INT (4 BYTE INTEGER)
3. BIGINT (8 BYTE INTEGER)
4. DECIMAL (P ,S ) P-PRECISION , S-SCALE
5. REAL (4-BYTE FLOATING POINT)
6. DOUBLE PRECISION (8-BYTE FLOATING POINT)
7. SERIAL (AUTO INCREMENT INTEGER)
*/

CREATE TABLE numbers(
IDs serial,
age smallint,
price numeric(4,2),
rating real
);

insert into numbers (age,price,rating)
values (14,30.03,5555),
(15,40.03,666),
(16,20.02,777);

select * from numbers ;

/* 
Character / String Data Types
1. CHAR (n) - Fixed length string (pads with space)
2. VARCHAR(n) - Variable length string (limit n chars)
3. TEXT - unlimited-lenght string
*/

create table strings(
code char (5),
email varchar(200),
bio text);

insert into strings
values ('23r4','riys@1586gmail.com','hello my name is riya mishra'),
('12p5','prashant@1586gmail.com','hello prashant');

select * from strings ;

/* BOOLEAN Data type
BOOLEAN TRUE , FALSE , NULL is active boliean
*/


/* DATE &TIME Data type
1. DATE - ONLY (YYYY-MM-DD)
2. TIME - ONLY TIME (HH:MM:SS)
3. TIMESTAMP - DATE +TIME   ( Khali time and date rhe ga isme)
4. TIMESTAMPZ -WITH TIMEZONE (GMT+5:30)  (time , date or timezone rhe ga )
5. INTERVAL - TIME DIFFERENCE   (kisi 2 cheejo ke beech me difference chahe time , month , day etc)
*/

/* CONSTRAINTS data type
PRIMARY KEY - (Hum har ek row uniquely find kr shakte h  primary key se)
NOT NULL - ( iska matlb hota hai ki value honi hi chahiye khali nhi hona chahiye)
UNIQUE - (Koi bhi duplicate  value nhi honi chahiye )
DEFAULT - (koi bhi default dena jaise ki aaj ki date aaj ka time )
CHECK - ( Kisi bhi value ko veryfi karne ke liye )
*/
 
create table random(
ID serial Primary Key ,  
name varchar(200)not Null ,
email text Unique not null ,
created_at date default now(),
age int check (age>=18)
 );


 insert into random (name,age,email)
 values ('riya',23,'riya123@gmail.com');

 select * from random ;

