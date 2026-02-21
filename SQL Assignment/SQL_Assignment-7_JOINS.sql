Create Database Ass7
Use Ass7

-- SQL Joins 

CREATE TABLE departments 
(dept_id INT PRIMARY KEY,
 dept_name VARCHAR(50),
 manager_name VARCHAR(50))
 INSERT INTO departments VALUES
(1, 'Development', 'Suresh'),
(2, 'QA', 'Ramesh'),
(3, 'HR', 'Suresh'),
(4, 'Support', 'Anita');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
)
INSERT INTO employees VALUES
(101, 'Amit', 60000, 1),
(102, 'Neha', 55000, 2),
(103, 'Rahul', 70000, 1),
(104, 'Priya', 45000, 3),
(105, 'Kiran', 50000, NULL),
(106, 'Sneha', 48000, 2);

--------------------------------------------------------
--Queries:-

--1. List all employees and their department names
SELECT e.emp_name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id

--2. List all employees and their department names, including employees who are not assigned to any department
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id

--3. List all departments and the number of employees in each department
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name

--4. Find the employee with the highest salary
SELECT emp_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees)

--5. List all employees who work in the QA department
SELECT e.emp_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'QA'

--6. List all departments managed by 'Suresh'
SELECT dept_name
FROM departments
WHERE manager_name = 'Suresh'

--7. List all employees who work in departments managed by 'Suresh'
SELECT e.emp_name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.manager_name = 'Suresh'

----------------------------------------------------------------------
--Fitrst we creat tables which we need for execute that querey

Create schema Person;
CREATE TABLE Person.Person
(BusinessEntityID INT PRIMARY KEY,
 FirstName VARCHAR(50),
 LastName VARCHAR(50))
 INSERT INTO Person.Person VALUES
(1,'Amit','Shah'),
(2,'Neha','Patel'),
(3,'Rohit','Mehta')

CREATE TABLE Person.Password
(BusinessEntityID INT PRIMARY KEY,
 PasswordHash VARCHAR(200))
INSERT INTO Person.Password VALUES
(1,'HASH123'),
(2,'HASH456'),
(3,'HASH789');

CREATE TABLE Person.EmailAddress
(EmailID INT PRIMARY KEY,
 BusinessEntityID INT,
 EmailAddress VARCHAR(100))
INSERT INTO Person.EmailAddress VALUES
(101,1,'amit@gmail.com'),
(102,2,'neha@yahoo.com'),
(103,3,'rohit@outlook.com');

CREATE SCHEMA HumanResources;
CREATE TABLE HumanResources.Employee
(BusinessEntityID INT PRIMARY KEY,
 NationalIDNumber VARCHAR(20),
 JobTitle VARCHAR(50))
INSERT INTO HumanResources.Employee VALUES
(1,'IND1001','Manager'),
(2,'IND1002','Developer'),
(3,'IND1003','Accountant');

CREATE TABLE HumanResources.EmployeeDepartmentHistory
(HistoryID INT PRIMARY KEY,
 BusinessEntityID INT,
 DepartmentID INT,
 StartDate DATE,
 EndDate DATE)
INSERT INTO HumanResources.EmployeeDepartmentHistory VALUES
(1,1,10,'2020-01-01','2021-01-01'),
(2,1,20,'2021-01-02',NULL),
(3,2,30,'2019-05-01',NULL),
(4,3,40,'2022-03-01',NULL);

CREATE TABLE Author
(AuthorID INT PRIMARY KEY,
 AuthorName VARCHAR(50))
INSERT INTO Author VALUES
(1,'Chetan Bhagat'),
(2,'J.K. Rowling'),
(3,'R.K. Narayan');

CREATE TABLE Publisher
(PublisherID INT PRIMARY KEY,
 PublisherName VARCHAR(50))
INSERT INTO Publisher VALUES
(1,'Penguin'),
(2,'HarperCollins');

CREATE TABLE Book
(BookID INT PRIMARY KEY,
 Title VARCHAR(100),
 ISBN VARCHAR(20),
 PublisherID INT)
INSERT INTO Book VALUES
(101,'Half Girlfriend','ISBN111',1),
(102,'Harry Potter','ISBN222',2),
(103,'Malgudi Days','ISBN333',1);

CREATE TABLE BookAuthor
(BookID INT,
 AuthorID INT)
INSERT INTO BookAuthor VALUES
(101,1),
(102,2),
(103,3);

Select * from Person.Person
Select * from Person.Password
Select * from Person.EmailAddress
Select * from HumanResources.Employee
Select * from HumanResources.EmployeeDepartmentHistory
Select * from Author
Select * from Publisher
Select * from Book
Select * from BookAuthor

----------------------------------------------------------------------
--Inner Join
--Queries

--1). Using the Person.Person and Person.Password tables, INNER JOIN the two tables using the BusinessEntityID column and return the FirstName and LastName columns from Person.Person and then PasswordHash column from Person.Password 
SELECT p.FirstName, p.LastName, pw.PasswordHash
FROM Person.Person p
INNER JOIN Person.Password pw
ON p.BusinessEntityID = pw.BusinessEntityID


--2). Join the HumanResources.Employee and the HumanResources.EmployeeDepartmentHistory tables together via an INNER JOIN using the BusinessEntityID column.Return the BusinessEntityID, NationalIDNumber and JobTitle columns from HumanResources.Employee and the DepartmentID, StartDate, and EndDate columns from HumanResources.EmployeeDepartmentHistory.Notice the number of rows returned.Why is the row count what it is? 
SELECT e.BusinessEntityID,e.NationalIDNumber,e.JobTitle,edh.DepartmentID,edh.StartDate,edh.EndDate
FROM HumanResources.Employee e
INNER JOIN HumanResources.EmployeeDepartmentHistory edh
ON e.BusinessEntityID = edh.BusinessEntityID

--3). Expand upon the query used in question 1.Using the existing query, add another INNER JOIN to the Person.EmailAddress table and include the EmailAddress column in your select statement. 
SELECT p.FirstName,p.LastName,pw.PasswordHash,ea.EmailAddress
FROM Person.Person p
INNER JOIN Person.Password pw
ON p.BusinessEntityID = pw.BusinessEntityID
INNER JOIN Person.EmailAddress ea
ON p.BusinessEntityID = ea.BusinessEntityID

--4). Using the Book, BookAuthor and Author tables, join them together so that you return the Title and ISBN columns from Book and the AuthorName column from Author.(Hint: You must start with the BookAuthor table in your FROM clause even though we will not be returning any columns from this table)
SELECT b.Title, b.ISBN, a.AuthorName
FROM BookAuthor ba
INNER JOIN Book b
ON ba.BookID = b.BookID
INNER JOIN Author a
ON ba.AuthorID = a.AuthorID

--5). Using the query from example 4, add another INNER JOIN that joins the Publisher table with your query.Return the PublisherName column from this table.So, you should return the Title and ISBN columns from Book, the AuthorName column from Author, and the PublisherName column from Publisher.(Hint: this will require three separate INNER JOINs). 
SELECT b.Title,b.ISBN,a.AuthorName,p.PublisherName
FROM BookAuthor ba
INNER JOIN Book b
ON ba.BookID = b.BookID
INNER JOIN Author a
ON ba.AuthorID = a.AuthorID
INNER JOIN Publisher p
ON b.PublisherID = p.PublisherID
----------------------------------------------------------------------------------------------------------------