Welcome to payroll service

--UC1--
-------Create DataBase------
CREATE DATABASE payroll_service;
USE payroll_service;

--UC2--
---Create table for DataBase---
CREATE TABLE employee_payroll(
id int not null,
name varchar(20) not null,
salary money not null,
startdate date not null
);


--UC3--
---Insert table in database---
INSERT INTO employee_payroll VALUES
(1,'srujan',100000.00,'2021-04-03'),
(2,'naresh',200000.00,'2020-05-22'),
(3,'suresh',300000.00,'2019-06-19')

