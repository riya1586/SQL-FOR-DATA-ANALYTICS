create table rivision(      --create
id serial primary key,
name varchar(50) not null,
class int not null,
mobile_number int not null,
age smallint not null
);

insert into rivision(name,class,mobile_number,age)  ---insert
values 
('riya',8,123456,10),
('prashant',8,789654,11),
('aaradhna',2,000000,4),
('tushar',3,11111,5);

select * from rivision; --read

update rivision set name='prt' where id = 1;  --update

delete from rivision where id=1;  --delete

--comparision operator
select name from rivision where id = 2;
select name from rivision where id != 2;
select name from rivision where age > 2 ;
select name from rivision where age < 1 ;

-- range - between 
select name from rivision where age between 2 and 4;

--Set - in()
select name from rivision where class in (8,2,3);

-- Like (%)
select * from rivision where name like 'a%';

--upper()
select upper(name) from rivision ;

--lower()
select lower(name) from rivision;

--length()
select length(name) from rivision;

--substring()
select age , substring(name , 1,2) from rivision;

--left()
select age , left(name,2) from rivision;

--right()
select age , right(name,3) from rivision;

--concat()
select age , concat(name , ' ' , class) from rivision;

--concat_ws()
select concat_ws(' ',name , class , age) from rivision;

--trim()
select trim('       aaradhna    ');

--replace()
select age , replace(name , left(name , 2),'aa') from rivision;

