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
UPDATE employee_payroll SET Gender='M' where id=1 ;
SELECT * FROM employee_payroll;


-------------------------UC7----------------------------------------
----calculate sum,avergae,min,max,count of employee ased on gender---
SELECT SUM(Salary) AS TotalSalary,Gender FROM employee_payroll GROUP BY Gender;
SELECT AVG(Salary) AS AverageSalary FROM employee_payroll GROUP BY Gender;
SELECT COUNT(Salary) AS TotalSalary,Gender FROM employee_payroll GROUP BY Gender;
SELECT MIN(Salary) AS  MinSalary,Gender FROM employee_payroll GROUP BY Gender;
SELECT MAX(Salary) AS MaxSalary,Gender FROM employee_payroll GROUP BY Gender;



---UC8---
----Adding new parameters PhoneNumber,Address,Department----
ALTER TABLE employee_payroll ADD PhoneNumber bigint;
ALTER TABLE employee_payroll ADD Department varchar(250) not null default 'ENGG';
ALTER TABLE employee_payroll ADD Address varchar(250) default 'baroda';
SELECT * FROM employee_payroll;

---UC9---
---RenameColumn name in existing table(Salary renamed as Basic pay)---
EXEC sp_rename 'employee_payroll.Salary', 'BasicPay';
ALTER TABLE employee_payroll ADD TaxablePay float, Deduction float,IncomeTax float,NetPay float;
UPDATE employee_payroll SET Deduction = '4000' WHERE Name = 'srujan';
UPDATE employee_payroll SET Deduction = '3000' WHERE Name = 'naresh';
UPDATE employee_payroll SET Deduction = '2000' WHERE Name = 'suresh';
UPDATE employee_payroll SET NetPay = (BasicPay-Deduction);
UPDATE employee_payroll SET TaxablePay = '1000';
UPDATE employee_payroll SET IncomeTax = '200';
SELECT * FROM employee_payroll;


---------UC10---------
------Create duplicate of person-------
INSERT INTO employee_payroll(id,Name,BasicPay,Startdate,Gender,PhoneNumber,Department,Address,TaxablePay,Deduction,IncomeTax,NetPay) VALUES(
4,'Terissa','525245','2018/03/01','F','7345787969','Sales','Chennai','1000','4000','200','522245');
INSERT INTO employee_payroll(id,Name,BasicPay,StartDate,Gender,PhoneNumber,Department,Address,TaxablePay,Deduction,IncomeTax,NetPay) VALUES(
5,'Terissa','525245','2018/03/01','F','7345787969','Marketing','Chennai','1000','5000','200','578945');
SELECT * FROM employee_payroll;
