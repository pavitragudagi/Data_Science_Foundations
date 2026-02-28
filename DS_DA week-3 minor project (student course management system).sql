DA_DS WEEK-3 MINOR PROJECT
-- Student Course Management System (MySQL)

-- 1. ===========Create Database=============
create  database student_course_db;

-- ================use data base================
use student_course_db;


-- 3. ===================Create Table===================
create table students (
    student_id int primary key,
    full_name  varchar(50) not null,
    email varchar(100) unique not null,            
    phone_number  bigint unique,
    course_name varchar(30),
    date_of_birth date,
    registration_date datetime
);


show tables;



-- 4. ===============Insert 20 Records===============


insert into  students 
(student_id, full_name, email, phone_number, course_name, date_of_birth, registration_date)
values

(1, 'Rahul Sharma', 'rahul.sharma1@gmail.com', 9876543210, 'BCA', '2002-05-14', '2024-01-10 10:30:00'),
(2, 'Anita Verma', 'anita.verma2@gmail.com', 9876543211, 'BBA', '2001-07-21', '2024-01-11 09:15:00'),
(3, 'Rohit Kumar', 'rohit.kumar3@gmail.com', 9876543212, 'BSc', '2002-11-10', '2024-01-12 11:00:00'),
(4, 'Sneha Reddy', 'sneha.reddy4@gmail.com', 9876543213, 'BCom', '2001-03-18', '2024-01-13 12:20:00'),
(5, 'Arjun Patel', 'arjun.patel5@gmail.com', 9876543214, 'BCA', '2003-01-25', '2024-01-14 08:45:00'),
(6, 'Meera Joshi', 'meera.joshi6@gmail.com', 9876543215, 'MBA', '2000-09-12', '2024-01-15 10:10:00'),
(7, 'Kiran Rao', 'kiran.rao7@gmail.com', 9876543216, 'BSc', '2002-06-30', '2024-01-16 01:30:00'),
(8, 'Pooja Singh', 'pooja.singh8@gmail.com', 9876543217, 'BBA', '2001-12-05', '2024-01-17 02:00:00'),
(9, 'Vikram Nair', 'vikram.nair9@gmail.com', 9876543218, 'BCom', '2002-04-09', '2024-01-18 09:40:00'),
(10, 'Divya Shetty', 'divya.shetty10@gmail.com', 9876543219, 'BCA', '2003-08-19', '2024-01-19 10:55:00'),
(11, 'Suresh Babu', 'suresh.babu11@gmail.com', 9876543220, 'MBA', '2000-10-22', '2024-01-20 11:35:00'),
(12, 'Lakshmi Devi', 'lakshmi.devi12@gmail.com', 9876543221, 'BSc', '2002-02-14', '2024-01-21 03:15:00'),
(13, 'Naveen Kumar', 'naveen.kumar13@gmail.com', 9876543222, 'BCA', '2001-05-30', '2024-01-22 04:00:00'),
(14, 'Priya N', 'priya.n14@gmail.com', 9876543223, 'BBA', '2002-09-17', '2024-01-23 05:25:00'),
(15, 'Manoj K', 'manoj.k15@gmail.com', 9876543224, 'BCom', '2001-01-11', '2024-01-24 06:45:00'),
(16, 'Harini M', 'harini.m16@gmail.com', 9876543225, 'BSc', '2003-07-07', '2024-01-25 08:10:00'),
(17, 'Tejaswini R', 'tejaswini.r17@gmail.com', 9876543226, 'MBA', '2000-12-29', '2024-01-26 09:20:00'),
(18, 'Abhishek P', 'abhishek.p18@gmail.com', 9876543227, 'BCA', '2002-03-03', '2024-01-27 10:05:00'),
(19, 'Shreya S', 'shreya.s19@gmail.com', 9876543228, 'BBA', '2001-06-16', '2024-01-28 11:50:00'),
(20, 'Deepak R', 'deepak.r20@gmail.com', 9876543229, 'BCom', '2002-10-08', '2024-01-29 01:15:00');


show tables;


-- 5. =======================Verify Data=====================

select * from students;






