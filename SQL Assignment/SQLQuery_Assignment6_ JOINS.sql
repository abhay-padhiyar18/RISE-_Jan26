
-----------SQL Joins Assignment---------------
--==========================================
--Create Tables For Those Question

--Employee Table:-
Create table Employee
(EID int,
Ename varchar(25),
MID int,
DID INT)

--Insert Data

INSERT INTO Employee values
(1,'Riya',102,20),
(2,'Amit',101,10),
(3,'Sneha',103,30),
(4,'Karan',101,10),
(5,'Rahul',NULL,20);

Select * from Employee
Drop table Employee

--Manager Table
Create table Manager
(MID INT,
Mname VARCHAR(25))
INSERT INTO Manager VALUES
(101,'Mr. Sharma'),
(102,'Ms. Patel'),
(103,'Mr. Khan');

--Project Table
Create table Project
(PID INT,
Pname Varchar(25),
EID INT)

INSERT INTO Project VALUES
(1001,'Website',1),
(1002,'App',2),
(1003,'Billing',3),
(1004,'Audit',4);

--Department Table:-
Create table Department
(DID INT,
Dname Varchar(25))
INSERT INTO Department VALUES
(10,'IT'),
(20,'HR'),
(30,'Finance');


Select * from Employee
Select * from Manager
Select * from Project
Select * from Department

--------------------------------------------------------------------------
--1). Display each employee's name and their corresponding department name
Select E.Ename,D.Dname from Employee E
Join Department D -- Inner Join
On E.DID = D.DID

--2). List all projects along with the name of the employee assigned to them.
Select P.Pname,E.Ename from Project P
Join Employee E -- Inner Join
On P.EID = E.EID

--3). Show the names of employees and the names of their managers.
Select E.Ename,M.Mname from Employee E
Join Manager M -- Inner Join
On E.MID = M.MID

--4). Display the Project ID and the Department ID for every project.

Select P.PID,D.DID from Project P
join Employee E -- Inner Join
On P.EID = E.EID
Join Department D --Inner Join
On E.DID = D.DID

--5). List employees who work in the 'IT' department.
Select E.Ename,D.Dname from Employee E 
Join Department D -- inner join
On E.DID = D.DID
where D.Dname = 'IT'

--6).Display employee names and their manager names for all employees in department 10.
Select E.Ename,M.Mname from Manager M
join  Employee E --Inner Join
On M.MID = E.MID
Where E.DID = 10

--7). Show all projects handled by ‘Suresh’.
Select P.Pname,E.Ename from Project P
join Employee E -- Inner Join
On P.EID = E.EID
Where E.Ename = 'Suresh'

--8). Find the department name associated with Project ID 101.

Select D.Dname from Department D
join Employee E -- Inner Join
On D.DID = E.DID
Join Project P --Inner Join
On E.EID = P.EID
Where P.PID = 101

--9). List all employees whose manager's name is 'Suresh'.
Select M.Mname from Employee E
join Manager M -- Inner Join
On E.MID = M.MID
Where M.Mname = 'Suresh'

--10). Display the count of employees in each department name.
Select D.Dname, Count(E.EID) from Department D
Left join Employee E --Left Join
On D.DID = E.DID
Group by D.Dname

--11). List all departments and the employees working in them (including departments with no employees).
Select D.Dname, E.Ename from Department D
Left join Employee E --Left Join
On D.DID = E.DID

--12). Display all employees and the projects they are assigned to (including those with no projects).
Select E.Ename, P.Pname from Employee E
Left join Project P --Left Join
On E.EID = P.EID

--13). Show the names of employees, their department names, and their manager names in one result.
Select E.Ename, D.Dname, M.Mname from Employee E
Join Department D -- Inner Join
On D.DID = E.DID
join Manager M -- Inner Join
On M.MID = E.MID

--14).Find all projects and the department name they belong to.
Select P.Pname,D.Dname from Project P
join Employee E -- Inner Join
On P.EID = E.EID
Join Department D --Inner Join
On E.DID = D.DID

--15). List all managers and the names of employees reporting to them (including managers with no reporters).
Select E.Ename, M.Mname from Manager M
Left Join Employee E -- Left Join
On E.MID = M.MID

--16). Find employees who are NOT assigned to any project.
SELECT E.Ename FROM Employee E
LEFT JOIN Project P -- Left Join 
ON E.EID = P.EID
WHERE P.EID IS NULL;

--17). Display the names of all employees and the names of projects, but only for those in the ‘IT’ department.
SELECT E.Ename, P.Pname FROM Employee E
JOIN Department D --Inner Join
ON E.DID = D.DID
JOIN Project P --Inner Join
ON E.EID = P.EID
WHERE D.Dname = 'IT';

--18). Show the names of managers who are managing employees in the 'Finance' department.
SELECT DISTINCT M.Mname FROM Manager M
JOIN Employee E --Inner Join
ON M.MID = E.MID
JOIN Department D --Inner Join
ON E.DID = D.DID
WHERE D.Dname = 'Finance';

--19). Display Department Name, Employee Name, and Project Name for all matches.
SELECT D.Dname, E.Ename, P.Pname FROM Department D
JOIN Employee E --Inner Join
ON D.DID = E.DID
JOIN Project P --Inner Join
ON E.EID = P.EID;

--20). List all projects and the manager's name responsible for the employee assigned to that project.
SELECT P.Pname,M.Mname FROM Project P
JOIN Employee E --Inner Join
ON P.EID = E.EID
JOIN Manager M --Inner Join
ON E.MID = M.MID;
