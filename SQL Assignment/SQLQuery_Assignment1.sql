
--Assignment 1

Create Database Assesment1
--Problem 1
SELECT 'Abhay Padhiyar' as Name;

--Problem 2
SELECT 7 * 4 AS product;

--Problem 3
SELECT (7 - 4) * 8;

--Problem 4
SELECT 'Brewster''s SQL Training Class';

--Problem 5
SELECT 'Day 1 of Training' AS message,
        5 * 3 AS result;


--Select Statement Practice

--Problem 1

Create Table Emp
(NationalIdNumber INT,
Ename Varchar(20),
JobTitle Varchar(20),
Eage INT,
ESalary Money)

Select NationalIdNumber,JobTitle from Emp

--Problem 2

SELECT NationalIDNumber, JobTitle
FROM Emp

--Problem 3
CREATE TABLE Employee01 (
    NationalIDNumber VARCHAR(20),
    JobTitle VARCHAR(100),
    BirthDate DATE
);

SELECT TOP (20) PERCENT
       NationalIDNumber,
       JobTitle,
       BirthDate
FROM Employee01;

--Problem 4
INSERT INTO Employee01 
(NationalIDNumber, JobTitle, BirthDate)
VALUES
('12345', 'Software Developer', '1998-05-10'),
('12346', 'Database Administrator', '1995-03-22'),
('12347', 'HR Manager', '1990-11-15'),
('12348', 'Devloper', '1997-07-30'),
('12349', 'QA', '2001-01-05');

SELECT TOP (20) PERCENT
       NationalIDNumber,
       JobTitle,
       BirthDate
FROM Employee01;


--Problem 5
SELECT TOP 500
       NationalIDNumber AS SSN,
       JobTitle AS [Job Title],
       BirthDate
FROM Employee01;

--Problem 06
CREATE TABLE SalesOrderHeader (Product_id INT, Order_date DATE, Product_name VARCHAR(20), Description VARCHAR(MAX))
SELECT * FROM SalesOrderHeader

SELECT * FROM SalesOrderHeader;

--Problem 07
CREATE TABLE Customer (Customer_id INT, Customer_name varchar(20), Email VARCHAR(100), Phone_no VARCHAR(15))
SELECT top (50) PERCENT * FROM Customer

--Probelm 08
CREATE TABLE ProductAndDescription (Product_id INT, Product_name VARCHAR(20), Description VARCHAR(MAX))
SELECT Product_name AS "Product's Name" FROM ProductAndDescription

--Problem 09

CREATE TABLE Departmant (Dept_name VARCHAR(20), Dept_code INT)
SELECT top (400)  * FROM Customer


--Problem 10
CREATE TABLE BillOfMaterials (Bill_id INT, Bill_date DATE, Product VARCHAR(20))
SELECT * FROM Customer

--Problem 11

CREATE TABLE  vPersonDemographics (Id INT, purchase_date DATE, Gender CHAR(1), Edu VARCHAR(20))
SELECT TOP 1500 * FROM vPersonDemographics;











