
create database test;

use test;
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
select * from orders_data ;
select country from orders_data GROUP BY country having count(*)=1;
select DISTINCT(state) from orders_data;
select country,DISTINCT(state) from orders_data;
select country, 
GROUP_CONCAT(state) as states_in_country 
from orders_data 
group by country;
select country, 
GROUP_CONCAT(DISTINCT(state)) as DISTINCT_state 
from orders_data 
GROUP BY country;

select country,GROUP_CONCAT(distinct state ORDER BY state desc) as DISTINCT_state 
from orders_data
GROUP BY country;
select country, GROUP_CONCAT(distinct state order by state desc) as states_in_country from orders_data group by country;
select country,GROUP_CONCAT(DISTINCT state ORDER BY state desc SEPARATOR '-') as states_in_country from orders_data GROUP BY country;
select country, GROUP_CONCAT(distinct state order by state desc separator '<->') as states_in_country from orders_data group by country;
select country,group_concat(DISTINCT state SEPARATOR '@') as states_by_country from orders_data GROUP BY country;

create table employees
(
    id int,
    name varchar(50),
    salary int
);
insert into employees values(1,'Shashank',5000),(2,'Amit',5500),(3,'Rahul',7000),(4,'Rohit',6000),(5,'Nitin',4000),(6,'Sunny',7500);
select * from employees;
select salary from employees where name = 'Rohit';
select * from employees where salary > (select salary from employees where name = 'Rohit');
select * from employees where salary > (select salary from employees where name='Rohit');
select * from orders_data;
select * from orders_data where state not in ('Seattle', 'Goa');

Create table student_marks
(
    stu_id int,
    stu_name varchar(50),
    total_marks int
);

insert into student_marks values(1,'Shashank',50);
insert into student_marks values(2,'Rahul',91);
insert into student_marks values(3,'Amit',74);
insert into student_marks values(4,'Nikhil',65);
insert into student_marks values(5,'Rohit',86);
insert into student_marks values(6,'Deepak',77);

select * from student_marks;
select stu_id,
       stu_name,
       total_marks,
       case 
            when total_marks >=90 then 'A+'
            when total_marks >= 85 and total_marks < 90 then 'A'
            when total_marks >= 75 and total_marks < 85 then 'B+'
            when total_marks >= 60 and total_marks < 75 then 'B'
            else 'C'
       end as grade
from student_marks;

create table tree
(
    node int,
    parent int
);

insert into tree values (5,8),(9,8),(4,5),(2,9),(1,5),(3,9),(8,null);

select * from tree;
select DISTINCT(parent) from tree where parent is not NULL;
create table customer_order_data
(
    order_id int,
    cust_id int,
    supplier_id int,
    cust_country varchar(50)

);
insert into customer_order_data values(101,200,300,'USA'),(102,201,301,'INDIA'),(103,202,302,'USA'),(104,203,303,'UK');

create table supplier_data
(
    supplier_id int,
    sup_country varchar(50)
);

insert into supplier_data values(300,'USA'),(303,'UK');
select * from customer_order_data;
select * from supplier_data;
select * from customer_order_data where cust_country in
(select DISTINCT  sup_country from supplier_data);
select node,
       CASE
            when node not in (select distinct parent from tree where parent is not null) then 'LEAF'
            when parent is null then 'ROOT'
            else 'INNER'
       END as node_type
from tree;
select distinct parent from tree where parent is not null;
select * from tree;
create table transactions
(
    trx_date date,
    merchant_id varchar(10),
    amount int,
    payment_mode varchar(10)
);

insert into transactions values('2022-04-02','m1',150,'CASH');
insert into transactions values('2022-04-02','m1',500,'ONLINE');
insert into transactions values('2022-04-03','m2',450,'ONLINE');
insert into transactions values('2022-04-03','m1',100,'CASH');
insert into transactions values('2022-04-03','m3',600,'CASH');
insert into transactions values('2022-04-05','m5',200,'ONLINE');
insert into transactions values('2022-04-05','m2',100,'ONLINE');

select * from transactions;
select merchant_id,
       sum(case when payment_mode = 'CASH' then amount else 0 end) as cash_amount,
       sum(case when payment_mode = 'ONLINE' then amount else 0 end) as online_amount
from transactions 
group by merchant_id;
select merchant_id,
       sum(case when payment_mode = 'CASH' then amount else 0 ) end as cash_amount,
       sum(case when payment_mode = 'ONLINE' then amount else 0 ) end as online_amount
from transactions 
group by merchant_id;