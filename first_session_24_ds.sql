--  ======================================= Create a database ==================================

create database feb_batch; 

-- ======================================== Drop a database======================================

drop database feb_batch;

--  ======================================= To show all the databases ==============================

show databases;  

--  ========================================= To enter into a database =============================

use feb_batch;

  -- ======================================== How to create a table =================================
  create table students (
  id int primary key,
  s_name varchar(100),
  marks int
  );

  -- ============================================= show tables =======================================
  
show tables;


-- ================================================== employee table ======================================
create table employee(
emp_id int primary key,
name varchar(100),
department varchar(100),
salary int
);
--  ================================================= show table =================================
show tables;


-- ================================================= How to drop a  table =
drop table employee;
drop table students;


-- ============================================= How to show table data ==================================
select * from employee;
select * from students;


select id, s_name from students;



-- ===================Second_session _feb_27=======================

 use feb_batch;
 show tables;

-- ==========================DQL (Data_query_language)==================
select * from employee;
select name, salary from employee;

-- ===========================insert data  into employee table=============

insert into employee (emp_id, name, department, salary) values
(1, "Amit", "HR", 50000),
(2, "yogita", "IT", 60000),
(3, "sajani", "Finance", 70000),
(4, "Deepika", "HR", 55000),
(5, "Ganesh", "IT", 40000),
(6, "krish", "IT", 65000);



-- ===========================insert data  into students table====
show tables;
select * from students;
select s_name, marks from students;


insert into students (id, s_name, marks) values
(1, "Darshan", 75),
(2, "Dileep", 76),
(3, "Sharanya", 77),
(4, "Harshita", 78),
(5, "pavitra", 79),
(6, "Sneha", 75),
(7, "Madhavi", 76),
(8, "Rajesh", 75),
(9, "Sreeja", 78);


-- practice question: create a payment table includes columns (payment_id, type, amount)
-- Type: ["cash", "UPI"] Amount: [between 50000 and 100000] 
-- insert data into "payments" table. (5 rows)

-- Create payments table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    type ENUM('cash', 'UPI'),
    amount DECIMAL(10,2) CHECK (amount BETWEEN 50000 AND 100000)
);

-- Insert 5 rows into payments table
INSERT INTO payments (type, amount) VALUES
('cash', 50000),
('UPI', 75000),
('cash', 98000),
('UPI', 60000),
('cash', 100000);

-- View table data
SELECT * FROM payments;

--  find the average amount for each payment type, print it in descending order. print first column name as "payment" and for  second "Average"

SELECT type, round(AVG(amount), 2) AS average_amount FROM payments
GROUP BY type
ORDER BY average_amount DESC;

-- print the least amount from each department 

select payment_type as payment, MIN(amount)as Highest from payments
group by payment_type
order by Average desc;

Use condition to get the output
select * from  students
where marks > 77;

select * from students
where marks < 78;

-- print the all employee from IT department

select * from employee
where department  = "IT"; 


-- print the all employee from IT department whose salary is more than 50k

select * from employee
where department  = "IT" and salary > 50000; 

-- how to sort the output ascending or descending order.
select * from students
order by marks; 
 
select * from students
order by marks desc;

select * from employee 
order by salary; 

select * from employee 
order by salary desc;

select * from students
order by marks asc;

select * from students
order by marks desc;

-- How to print limited rows like top 3, top 2, etc

select  s_name, marks from students
order by marks desc
limit 3; 


-- =====================third_session_feb_28========================

use feb_batch;
show tables;

select * from employee;
select * from students;

-- ques: Calculate the salary for each department

select department, sum(salary) from employee
group by department 
order by sum(salary) desc;

-- ques: Calculate the salary for HR  department where 

select department, sum(salary) from employee
where department = "HR"
group by department  
order by sum(salary) desc;

-- count the students whose marks are more than 75.alter

select count(*) from students
where marks > 75;

-- Practice Question: Create a "payments" table having includes (payment_id, type, amount )
-- Type, ["Cash", "UPI"] amount:[between 50000 and 100000]
 -- Insert data into "payments" table. (5 Rows)  

create table payments (
payment_id int primary key,
payment_type varchar(100),
amount int 
);

insert into payments values 
(1, "CASH", 25000),
(2, "CASH", 50000),
(3, "UPI", 25000),
(4, "CASH", 80000),
(5, "UPI", 46000),
(6, "UPI", 34000),
(7, "CASH", 46000),
(8, "UPI", 65000),
(9, "CASH", 85000),
(10, "UPI", 95000),
(11, "UPI", 55000),
(12, "UPI", 35000),
(13, "CASH", 55000),
(14, "UPI", 75000),
(15, "UPI", 90000);

select * from payments;

-- Find the average amount for each payment type, print it in the descending order. 

select payment_type, round(avg(amount),2) from payments
group by payment_type
order by avg(amount) desc;

-- Find the average amount for each payment type, print it in the descending order. print first co;lumn name as "Payment" and for second "Average" 

select payment_type as Payment, round(avg(amount),2) as Average from payments
group by payment_type
order by Average desc;


-- print the least amount from each department 

select payment_type as Payment, Min(amount) as Least from payments
group by payment_type
order by Least; 

-- print the Highest amount from each department

select payment_type as Payment, Max(amount) as Highest from payments
group by payment_type
order by Highest desc;

select payment_type as payment, MIN(amount)as Highest from payments
group by payment_type
order by Average desc;

select * from students;

-- print all the students whose name start with "s".alter
select s_name from students
where s_name Like "S%"; 

-- print all the students whose name end with "a"
select s_name from students
where s_name Like "%a";

-- print all the students whose name start with "S" and end with "a".

select s_name from students
where s_name Like "S%a"; 

-- print all the students whose name start with "S" and end with "a"
select s_name from students
where s_name Like "%a";

-- print all the students whose name contain "a" as second charecter
select s_name from students
where s_name Like "_a%";
 

-- ================== Fourth_session_March_5 ==================

use feb_batch;
show tables; 
select * from dim_customer;
select * from dim_date;
select * from dim_host;
select * from dim_property;
select * from students;
select * from employee;

-- How to insert the null values in the table

insert into students values 
(10, "jancy", Null),
(11, "nancy", Null),
(12, Null, 99),
(13, Null, Null);


-- print the all the entries without having name  
select * from students
where s_name is null;   

-- print the all the entries without having name and marks

select * from students;
    

-- print the all the entries without null values

select * from students
where s_name is not null;

where s_name is null and marks is null;

-- ===================Friday _session_March_6 ========================
-- =========================== joins =======================================

use feb_batch;
show tables;

select * from dim_customer;
select * from dim_date;
select * from dim_host;
select * from dim_property;
select * from fact_bookings;

select  dh.Superhost_Flag, round(sum(fb.revenue),2) as Total_revenue from dim_host as dh
join fact_bookings as fb on fb.Host_ID = dh.Host_ID
group by dh.Superhost_Flag;

-- ================= saturday_session_march_7 ============================== 
use feb_batch;
show tables;

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,

    emp_name VARCHAR(50),

    dept_id INT,

    salary INT

);

 CREATE TABLE departments (

    dept_id INT PRIMARY KEY,

    dept_name VARCHAR(50)

);

 INSERT INTO employees VALUES

(1, 'Rahul', 101, 60000),

(2, 'Priya', 102, 75000),

(3, 'Amit', 103, 50000),

(4, 'Neha', 101, 72000),

(5, 'Arjun', NULL, 45000);

 INSERT INTO departments VALUES

(101, 'HR'),

(102, 'Finance'),

(104, 'Marketing');

select *  from employees;
select * from departments;

--  Inner join returns matching data  points =========

select e.emp_name, d.dept_name from employees e
join departments d on d.dept_id = e.dept_id;

--  Left  join returns all data from left table and matching data  from right table =========

select e.emp_name, d.dept_name from employees e
 left join departments d on d.dept_id = e.dept_id;

--  Right  join returns all data from right table and matching data  from left table =========

select e.emp_name, d.dept_name from employees e
 right join departments d on d.dept_id = e.dept_id;


--  Full outer  join returns all data from left table and matching data  from right table =========

select * from employees e
 left join departments d on d.dept_id = e.dept_id;

union

select * from employees e
 right join departments d on d.dept_id = e.dept_id;
 
 -- Cross join returns c- product. 
select e.emp_name, d.dept_name from employees e
 cross join departments d
 Limit 10;
 
 select *  from employees;
select * from departments;

select d.dept_name, sum(e.salary)  total_income from departments d
join employees e on e.dept_id = d.dept_id
group by d.dept_name;

-- ques: find the average salary  for each department.



select d.dept_name, round(avg(e.salary),2) avg_income from departments d
join employees e on e.dept_id = d.dept_id
group by d.dept_name
having avg_income > 70000
order by avg_income desc;  


