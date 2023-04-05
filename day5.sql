create database test;
use test;

create table customers
(
    id int,
    name varchar(50)
);

create table orders
(
    order_id int,
    amount int,
    cust_id int
);
insert into customers values(1,'John');

insert into customers values(2,'David');

insert into customers values(3,'Ronn');

insert into customers values(4,'Betty');

insert into orders values(1,100,10);

insert into orders values(2,500,3);

insert into orders values(3,300,6);

insert into orders values(4,800,2);

insert into orders values(5,350,1);
select * from orders;
select * from customers;

select c.*,o.* 
from orders o
inner join customers c on o.cust_id=c.id
where o.amount >400;

select c.*,o.* 
from orders o
inner join customers c on o.cust_id=c.id and o.amount >400;


create table shop_sales_data
(
sales_date date,
shop_id varchar(5),
sales_amount int
);

insert into shop_sales_data values('2022-02-14','S1',200);
insert into shop_sales_data values('2022-02-15','S1',300);
insert into shop_sales_data values('2022-02-14','S2',600);
insert into shop_sales_data values('2022-02-15','S3',500);
insert into shop_sales_data values('2022-02-18','S1',400);
insert into shop_sales_data values('2022-02-17','S2',250);
insert into shop_sales_data values('2022-02-20','S3',300);
select * from shop_sales_data;
SELECT *,
    count(*)
    over(PARTITION BY shop_id) as total_sales_count_by_shop
    from shop_sales_data;

select *,
       sum(sales_amount) over(order by sales_amount desc) as total_sum_of_sales
from shop_sales_data;
select *,
       sum(sales_amount) over(order by shop_id desc) as total_sum_of_sales
from shop_sales_data;
select *,
       sum(sales_amount) over(partition by shop_id) as total_sum_of_sales
from shop_sales_data;
select *,
       sum(sales_amount) over(partition by shop_id ORDER BY sales_amount) as total_sum_of_sales
from shop_sales_data;

select *,
       sum(sales_amount) over(partition by shop_id ORDER BY sales_amount desc) as total_sum_of_sales
from shop_sales_data;
select *,
       sum(sales_amount) over(ORDER BY sales_amount desc) as total_sum_of_sales
from shop_sales_data;

create table amazon_sales_data
(
    sales_data date,
    sales_amount int
);


insert into amazon_sales_data values('2022-08-21',500);
insert into amazon_sales_data values('2022-08-22',600);
insert into amazon_sales_data values('2022-08-19',300);

insert into amazon_sales_data values('2022-08-18',200);

insert into amazon_sales_data values('2022-08-25',800);

select * from amazon_sales_data;

select *,
       avg(sales_amount) over(order by sales_data) as rolling_avg
from amazon_sales_data;

select *,
       SUM(sales_amount) over(order by sales_data) as rolling_avg
from amazon_sales_data;

select *,
    avg(sales_amount) as avgs 
    from amazon_sales_data;

    select *,
       avg(sales_amount) over(order by sales_data) as rolling_avg,
       sum(sales_amount) over(order by sales_data) as rolling_sum
from amazon_sales_data;
create table shop_sales_data
(
sales_date date,
shop_id varchar(5),
sales_amount int
);

insert into shop_sales_data values('2022-02-19','S1',400);
insert into shop_sales_data values('2022-02-20','S1',400);
insert into shop_sales_data values('2022-02-22','S1',300);
insert into shop_sales_data values('2022-02-25','S1',200);
insert into shop_sales_data values('2022-02-15','S2',600);
insert into shop_sales_data values('2022-02-16','S2',600);
insert into shop_sales_data values('2022-02-16','S3',500);
insert into shop_sales_data values('2022-02-18','S3',500);
insert into shop_sales_data values('2022-02-19','S3',300);

insert into shop_sales_data values('2022-02-14','S1',200);
insert into shop_sales_data values('2022-02-15','S1',300);
insert into shop_sales_data values('2022-02-14','S2',600);
insert into shop_sales_data values('2022-02-15','S3',500);
insert into shop_sales_data values('2022-02-18','S1',400);
insert into shop_sales_data values('2022-02-17','S2',250);

insert into shop_sales_data values('2022-02-20','S3',300);
select * from shop_sales_data;

select *,
       row_number() over(partition by shop_id order by sales_amount desc) as row_num,
       rank() over(partition by shop_id order by sales_amount desc) as rank_val,
       dense_rank() over(partition by shop_id order by sales_amount desc) as dense_rank_val
from shop_sales_data;
create table employees
(
    emp_id int,
    salary int,
    dept_name VARCHAR(30)

);

insert into employees values(1,10000,'Software');
insert into employees values(2,11000,'Software');
insert into employees values(3,11000,'Software');
insert into employees values(4,11000,'Software');
insert into employees values(5,15000,'Finance');
insert into employees values(6,15000,'Finance');
insert into employees values(7,15000,'IT');
insert into employees values(8,12000,'HR');
insert into employees values(9,12000,'HR');
insert into employees values(10,11000,'HR');

select * from employees;
select *,
        row_number() over(partition by dept_name order by salary desc) as row_num
    from employees;
select 
    tmp.*
from (select *,
        row_number() over(partition by dept_name order by salary desc) as row_num
    from employees) tmp
where tmp.row_num = 1;

select 
    tmp.*
from (select *,
        rank() over(partition by dept_name order by salary desc) as rank_num
    from employees) tmp
where tmp.rank_num = 1;

select 
    tmp.*
from (select *,
        DENSE_RANK() over(partition by dept_name order by salary desc) as rank_num
    from employees) tmp
where tmp.rank_num = 1;
where tmp.rank_num = 1;sys.types;
CREATE TYPE MyCustomType FROM NVARCHAR(255) NOT NULL;
EXEC GetTablesData @persistData = 'N',@truncateTable = 'N';

select 
    tmp.*
from (select *,
        dense_rank() over(partition by dept_name order by salary desc) as dense_rank_num
    from employees) tmp
where tmp.dense_rank_num <= 2;

select 
    tmp.*
from (select *,
        rank() over(partition by dept_name order by salary desc) as rank_num
    from employees) tmp
where tmp.rank_num <= 2;
create table daily_sales
(
sales_date date,
sales_amount int
);

insert into daily_sales values('2022-03-11',400);
insert into daily_sales values('2022-03-12',500);
insert into daily_sales values('2022-03-13',300);
insert into daily_sales values('2022-03-14',600);
insert into daily_sales values('2022-03-15',500);
insert into daily_sales values('2022-03-16',200);

select * from daily_sales;
select *,
      lag(sales_amount, 1) over(order by sales_date) as pre_day_sales
from daily_sales;
select sales_date,
       sales_amount as curr_day_sales,
       lag(sales_amount, 1) over(order by sales_date) as prev_day_sales,
       sales_amount - lag(sales_amount, 1) over(order by sales_date) as sales_diff
from daily_sales;
select sales_date,
       sales_amount as curr_day_sales,
       lag(sales_amount, 1, 0) over(order by sales_date) as prev_day_sales,
       sales_amount - lag(sales_amount, 1, 0) over(order by sales_date) as sales_diff
from daily_sales;

select *,
      lag(sales_amount, 1) over(order by sales_date) as pre_day_sales
from daily_sales;

select *,
      lead(sales_amount, 1) over(order by sales_date) as next_day_sales
from daily_sales;

select *,
      lead(sales_amount, 1,0) over(order by sales_date) as next_day_sales
from daily_sales;
select * from daily_sales;
select *,
      sum(sales_amount) over(order by sales_date rows between 1 preceding and 1 following) as prev_plus_next_sales_sum
from daily_sales;
select *,
      sum(sales_amount) over(order by sales_date rows between 0 preceding and 1 following) as prev_plus_next_sales_sum
from daily_sales;
select *,
      sum(sales_amount) over(order by sales_date rows between 0 preceding and 0 following) as prev_plus_next_sales_sum
from daily_sales;
select *,
      sum(sales_amount) over(order by sales_date rows between 1 preceding and current row) as prev_plus_next_sales_sum
from daily_sales;
select *,
      sum(sales_amount) over(order by sales_date rows between current row and 1 following) as prev_plus_next_sales_sum
from daily_sales;
select *,
      sum(sales_amount) over(order by sales_date rows between 2 preceding and 1 following) as prev_plus_next_sales_sum
from daily_sales;