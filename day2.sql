create DATABASE if not EXISTS day2;
use day2;
create table if not exists emp(
    id int,
    name VARCHAR(30),
    address VARCHAR(30),
    city VARCHAR(30)
);
insert INTO emp VALUES(1,'sdsdsd','delhi1','delhi');
SELECT * FROM emp;
alter table emp add COLUMN dob date; 
alter table emp MODIFY COLUMN name VARCHAR(100);
select * from emp;
alter Table emp drop COLUMN city;
alter table emp rename column name to full_name;
alter table emp add constraint id_unique unique(id);
select * from emp;
insert into emp values(1,'dsdsd','ddfdf','2023-12-23');
alter table emp drop constraint  id_unique;
drop table p1;
CREATE table if not exists p1(
    id INT,
    name VARCHAR(30),
    age int,
    constraint pk PRIMARY KEY (id)
);
insert into p1 VALUES(1,'sdsdsd',34);
insert into p1 VALUES(1,'sdsddsdssd',34);
insert into p1 VALUES(null,'sdsdsd',34);
alter table p1 add constraint age_un unique(age);
insert into p1 VALUES(1,'sdsdsd',34);
insert into p1 VALUES(2,'sdsdsd',324);
insert into p1 VALUES(3,'sdsdsd',324);
insert into p1 VALUES(3,'sdsdsd',null);
create table customer(
    id int,
    name VARCHAR(30),
    age int,
    constraint pk PRIMARY KEY (id)
);
alter table customer rename COLUMN id to ids;

create table orders(
    order_id int,
    order_num int,
    customer_id int,
    constraint pk primary key (order_id),
    constraint fk FOREIGN KEY(customer_id) REFERENCES customer(ids)
);

show tables;
select * from p1;
truncate table p1;
drop table p1;
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
select count(*) as total_rows from employee;

select salary, age from employee;
select salary as sal, age as ag from employee;
select distinct(hiring_date) from employee;
select count(distinct(hiring_date)) from employee;
select * from employee;

select age, 
    salary as old_salary,
    (salary + 1000) as new_salary 
    from employee;

update employee set age=30;
update employee set id = id + 10 ;

select * from employee where hiring_date = '2021-08-11';

update employee set salary = 1000 where hiring_date = '2021-08-11';
select * from employee;
DELETE from employee WHERE id = 11;