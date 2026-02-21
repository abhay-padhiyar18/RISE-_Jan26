--Assignment 02

--Q.1
Create table Employee02
(EID Int Identity(101,1),
EName varchar(50),
EAge Int,
ESalary Int,
EDepartment varchar(50))

Select * from Employee02

Insert into Employee02 values ('Suresh Patel',28,55000,'IT')

--Q2. 

Insert Into Employee02 (EName,Eage)values ('Mahesh Patel',32)

--Q3 

INSERT INTO Employee02 ( EName,Eage,Esalary)
VALUES
('Amit',35, 35000),
('Neha',28, 30000),
('Rahul',25, 28000);


--Q4.
INSERT INTO Employee02(EName)
VALUES ('Jayesh Patel');

--Q5.
Insert into Employee02 values  ('Shubham Rai',35,55000,'HR')


---Update Operations 

--Q6.
UPDATE Employee02 SET Edepartment = 'Marketing' WHERE Edepartment IS NULL;

--Q7. 

Alter Table Employee02 Add City varchar(50);
UPDATE Employee02 SET City = 'Vadodara' WHERE City IS NULL;

Update Employee02 SET EDepartment = 'Tech' Where City = 'Vadodara'


--Q8. 
Update Employee02 Set ESalary = 75000 Where EID IN (101,103)

--Q9.

Update Employee02 Set EDepartment = 'Management' Where Eage = 28

--Q10.

Update Employee02 Set ESalary = 80000 Where Ename ='Suresh Patel'



--DELETE Operation

--Q11. 

Delete From Employee02 Where EID =105;

--Q 12.

Delete from Employee02 Where EDepartment = 'Management'

--Q13.
Delete from Employee02 Where Eage = 32

--Q14.
Delete from Employee02 Where ESalary is Null

--Q15.

TRUNCATE TABLE employees;
