Welcome to payroll service

--UC1--
-------Create DataBase------
CREATE DATABASE payroll_service;
USE payroll_service;

--UC2--
---Create table for DataBase---
CREATE TABLE employee_payroll(
id int not null,
Name varchar(20) not null,
Salary money not null,
Startdate date not null
);


--UC3--
---Insert table in database---
INSERT INTO employee_payroll VALUES
(1,'srujan',100000.00,'2021-04-03'),
(2,'naresh',200000.00,'2020-05-22'),
(3,'suresh',300000.00,'2019-06-19');

--------UC4-----------
---Retrieve all data from employee_payroll
SELECT * FROM employee_payroll;

----------UC5-----------------------
---------Retrieve Specific Data-------
SELECT Name, Startdate FROM employee_payroll WHERE Name='srujan';
  SELECT * FROM employee_payroll WHERE StartDate between CAST('2019-01-01' as date) and GETDATE();


  --------------UC6------------------------
-----------Alter the table to add gender---
ALTER TABLE employee_payroll ADD Gender CHAR(1);
UPDATE employee_payroll SET Gender='M' WHERE id=1;
SELECT * FROM employee_payroll;

