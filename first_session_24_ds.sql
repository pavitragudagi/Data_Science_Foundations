--  ======================================= Create a database ==================================

create database feb_batch1; 

-- ======================================== Drop a database======================================

drop database feb_batch;

--  ======================================= To show all the databases ==============================

show databases;  

--  ========================================= To enter into a database =============================

use feb_batch1;

  -- ======================================== How to create a table =================================
  create table students (
  id int primary key,
  s_name varchar(100),
  marks int
  );

  -- ============================================= show tables =======================================
  
show tables;


-- ================================================== employee table ======================================
create table employee (
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


-- Use condition to get the output
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
order by marks asc;

select * from students
order by marks desc;

select * from employee
order by salary;

select * from employee
order by salary desc;

-- How to print limited rows like top 3, top 2, etc

select * from students
order by marks desc
limit 3; 


-- =====================third_session_feb_28========================



