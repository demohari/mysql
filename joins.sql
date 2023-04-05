create database joins;

use test;
create table orders
(
    order_id int,
    cust_id int,
    order_dat date, 
    shipper_id int
);

create table customers
(
    cust_id int,
    cust_name varchar(50),
    country varchar(50)
);

create table shippers
(
    ship_id int,
    shipper_name varchar(50)
);
insert into orders values(10308, 2, '2022-09-15', 3);
insert into orders values(10309, 30, '2022-09-16', 1);
insert into orders values(10310, 41, '2022-09-19', 2);

insert into customers values(1, 'Neel', 'India');
insert into customers values(2, 'Nitin', 'USA');
insert into customers values(3, 'Mukesh', 'UK');

insert into shippers values(3,'abc');
insert into shippers values(1,'xyz');

select * from orders;
select * from customers;
select * from shippers;
select o.*,c.* from orders o
INNER JOIN
customers c
on o.cust_id = c.cust_id;

select o.*,c.* 
from orders o
left JOIN
customers c
on o.cust_id=c.cust_id;
select 
o.*, c.*
from orders o
right join customers c on o.cust_id = c.cust_id;

select o.*, c.*
from orders o
cross join customers c;

select 
o.*, c.*
from orders o
full outer join customers c
on o.cust_id = c.cust_id
ORDER BY c.cust_id;

SELECT o.*,c.* FROM orders o
LEFT JOIN t2 ON t1.id = t2.id
UNION
SELECT * FROM t1
RIGHT JOIN t2 ON t1.id = t2.id;

select 
o.*, c.*
from orders o
left join customers c on o.cust_id = c.cust_id
UNION
select 
o.*, c.*
from orders o
RIGHT join customers c on o.cust_id = c.cust_id;

create table employees_full_data
(
    emp_id int,
    name varchar(50),
    mgr_id int
);

insert into employees_full_data values(1, 'Shashank', 3);
insert into employees_full_data values(2, 'Amit', 3);
insert into employees_full_data values(3, 'Rajesh', 4);
insert into employees_full_data values(4, 'Ankit', 6);
insert into employees_full_data values(6, 'Nikhil', null);

select * from employees_full_data;
select DISTINCT name from employees_full_data;

