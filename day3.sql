create DATABASE test_db;
use test_db;

create table if not exists employee(
    id int,
    name VARCHAR(50),
    age int,
    hiring_date date,
    salary int,
    city varchar(50)
);

insert into employee values(1,'Shashank', 24, '2021-08-10', 10000, 'Lucknow');
insert into employee values(2,'Rahul', 25, '2021-08-10', 20000, 'Khajuraho');
insert into employee values(3,'Sunny', 22, '2021-08-11', 11000, 'Banaglore');
insert into employee values(5,'Amit', 25, '2021-08-11', 12000, 'Noida');
insert into employee values(1,'Puneet', 26, '2021-08-12', 50000, 'Gurgaon');
select * from employee;

update employee set age=20,salary=100 where hiring_date='2021-08-11';
insert into employee values(1,'Shashank', 24, '2021-08-10', 10000, 'Lucknow');
insert into employee values(2,'Rahul', 25, '2021-08-10', 20000, 'Khajuraho');
insert into employee values(3,'Sunny', 22, '2021-08-11', 11000, 'Banaglore');
insert into employee values(5,'Amit', 25, '2021-08-11', 12000, 'Noida');
insert into employee values(1,'Puneet', 26, '2021-08-12', 50000, 'Gurgaon');
select * from employee;

create table auto1(
    id_no int AUTO_INCREMENT,
    name VARCHAR(30),
    PRIMARY key (id_no)
);
insert into auto1 values(1,'dsdsd');
insert into auto1(name) values('dsdsdsd');
select * from auto1;
create table auto_inc_exmp
(
  id int auto_increment,
  name varchar(20),
  primary key (id)
);
insert into auto_inc_exmp(name) values('Shashank');
insert into auto_inc_exmp(name) values('Rahul');

select * from auto_inc_exmp;
select * from employee limit 2;

create table if not exists employee(
    id int,
    name VARCHAR(50),
    age int,
    hiring_date date,
    salary int,
    city varchar(50)
);

insert into employee values(1,'Shashank', 24, '2021-08-10', 10000, 'Lucknow');
insert into employee values(2,'Rahul', 25, '2021-08-10', 20000, 'Khajuraho');
insert into employee values(3,'Sunny', 22, '2021-08-11', 11000, 'Banaglore');
insert into employee values(5,'Amit', 25, '2021-08-11', 12000, 'Noida');
insert into employee values(1,'Puneet', 26, '2021-08-12', 50000, 'Gurgaon');
select * from employee;
select * from employee ORDER BY name;
select * from employee ORDER BY name desc;
select * from employee ORDER BY salary desc limit 1;
select * from employee order by salary limit 1;
create table if not exists employee(
    id int,
    name VARCHAR(50),
    age int,
    hiring_date date,
    salary int,
    city varchar(50)
);
insert into employee values(1,'Shashank', 24, '2021-08-10', 10000, 'Lucknow');
insert into employee values(2,'Rahul', 25, '2021-08-10', 20000, 'Khajuraho');
insert into employee values(3,'Sunny', 22, '2021-08-11', 11000, 'Banaglore');
insert into employee values(55,'Amit', 25, '2021-08-11', 50000, 'Noida');
insert into employee values(1,'Puneet', 26, '2021-08-12', 50000, 'Gurgaon');
select * from employee;
insert into employee values(5,'Amit', 25, '2021-08-11', 12000, 'Noida');
select * from employee
    ORDER BY salary desc,
    name asc;

select * from employee order by salary desc;
select * from employee where salary > 20000;
select * from employee where salary >= 20000;
select* from employee WHERE salary<20000;
select* from employee WHERE age <24;

select * from employee where hiring_date between '2021-08-10' AND '2021-08-11';
select* from employee where id BETWEEN 2 and 5;
select * from employee where name like 's%';
select * from employee where name like '%k';
select * from employee where name like 'S%k';
SELECT * from employee;
SELECT * from employee WHERE name like '_____';
SELECT * from employee WHERE name like '%_____%';
SELECT * from employee WHERE name like '%_____';
insert into employee values(10,'Kapil', null, '2021-08-10', 10000, 'Assam');
insert into employee values(11,'Nikhil', 30, '2021-08-10', null, 'Assam');
select * from employee;
select * from employee where age is null;
select count(*) as num from employee where age is not null;
select count(select * from employee where age is null) from employee;

select * from employee where age is not null;




create table orders_data
(
 cust_id int,
 order_id int,
 country varchar(50),
 state varchar(50)
);


insert into orders_data values(1,100,'USA','Seattle');
insert into orders_data values(2,101,'INDIA','UP');
insert into orders_data values(2,103,'INDIA','Bihar');
insert into orders_data values(4,108,'USA','WDC');
insert into orders_data values(5,109,'UK','London');
insert into orders_data values(4,110,'USA','WDC');
insert into orders_data values(3,120,'INDIA','AP');
insert into orders_data values(2,121,'INDIA','Goa');
insert into orders_data values(1,131,'USA','Seattle');
insert into orders_data values(6,142,'USA','Seattle');
insert into orders_data values(7,150,'USA','Seattle');

insert into orders_data values(1,100,'USA','Seattle');
insert into orders_data values(2,101,'INDIA','UP');
insert into orders_data values(2,103,'INDIA','Bihar');
insert into orders_data values(4,108,'USA','WDC');
insert into orders_data values(5,109,'UK','London');
insert into orders_data values(4,110,'USA','WDC');
insert into orders_data values(3,120,'INDIA','AP');
insert into orders_data values(2,121,'INDIA','Goa');
insert into orders_data values(1,131,'USA','Seattle');
insert into orders_data values(6,142,'USA','Seattle');
insert into orders_data values(7,150,'USA','Seattle');
select * from orders_data;
select country, count(*) as order_count_by_each_country from orders_data group by country;
select country from orders_data;

select order_id, count(*) as order_count_by_each_country from orders_data group by country;
select age, sum(salary) as total_salary_by_each_age_group from employee group by age;
select * from employee;
select  state,count(order_id) from orders_data GROUP BY state;
select age, 
	   sum(salary) as total_salary_by_each_age_group,
       max(salary) as max_salary_by_each_age_group,
       min(salary) as min_salary_by_each_age_group,
       avg(salary) as avg_salary_by_each_age_group,
       count(*) as total_employees_by_each_age_group
from employee group by age;