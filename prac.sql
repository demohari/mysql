show databases;
create database practice;
use practice;


create table if not exists employee(
    id int,
    name varchar(50)
);
show tables;

show create table employee;
drop table employee;
create table if not exists employee(
    id INT,
    name VARCHAR(50),
    salary DOUBLE,
    hiring_date DATE
);

insert into employee VALUES(1,'hari',2000,'2021-12-01');
insert into employee VALUES(1,'hari',2000,'2021-12-01');

insert into employee(salary,name,id)values(1000,'hari1',2);
insert into employee 
VALUES(1,'har2i',2000,'2021-12-01'),
(1,'hasdsri',2000,'2021-12-01'),
(1,'hasdri',2000,'2021-12-01');

select * from employee;
create table if not exists new1(
    id INT NOT NULL,
    name VARCHAR(50) NOT null,
    salary DOUBLE,
    hiring_date DATE DEFAULT '2021-12-01',
    UNIQUE(id),
    CHECK(salary>1000)
);

insert into new1 VALUES(1,'dsds',2000,null);

select * FROM new1;
insert into new1 VALUES(2,'dsds',2000,DEFAULT);
insert into new1 VALUES(1,'dsds',2000,null);
Create table if not exists employee_with_constraints_tmp
(
    id int NOT NULL,
    name VARCHAR(50) NOT NULL,
    salary DOUBLE,
    hiring_date DATE DEFAULT '2021-01-01',
    CONSTRAINT unique_id UNIQUE (id),
    CONSTRAINT salary_check CHECK (salary > 1000)
);

insert into employee_with_constraints_tmp
values(1,'sdsd',10000,DEFAULT);

insert into employee_with_constraints_tmp
values(1,'sdsd',1001,DEFAULT);