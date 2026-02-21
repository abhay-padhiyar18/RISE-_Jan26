
--Assignment 4

--SQL WHERE Queries

CREATE TABLE Emp_details (
    EID INT PRIMARY KEY,
    EName VARCHAR(50),
    EAge INT,
    ESalary INT,
    EDepartment VARCHAR(20),
    ECity VARCHAR(30)
);


INSERT INTO Emp_details VALUES
(101, 'Suresh', 25, 30000, 'QA', 'New York'),
(102, 'Ramesh', 28, 45000, 'DA', 'London'),
(103, 'Anita', 22, 18000, 'FS', 'Mumbai'),
(104, 'Amit', 30, 60000, 'DE', 'New York'),
(105, 'Rita', 24, 0, NULL, 'Delhi'),
(106, 'Ajay', 21, 15000, 'QA', 'Pune'),
(107, 'Neha', 26, 52000, NULL, 'Bangalore'),
(108, 'Aruna', 29, 48000, 'FS', 'Chennai');


Select * from Emp_details


--Q1.Return the Name column from Emp_details where the Name column is equal to "Suresh"
   
SELECT Ename FROM Emp_details WHERE Ename = 'Suresh';

--Q2.Find the top 100 rows from Emp_details where the Salary is not equal to 0.

SELECT ESalary FROM Emp_details WHERE ESalary <> 0;

--Q3.Return all rows and columns from Emp_details where the employee’s Name starts with a letter less than “D”.

SELECT * FROM Emp_details WHERE EName < 'D';

--Q4. Return all rows and columns from Employeedetails where the City column is equal to "New York".

SELECT * FROM Emp_details WHERE ECity = 'New York';

--Q5.Return the Name column from Employeedetails where the Name is equal to "Ramesh". Give the column alias "Employee Name

SELECT Ename AS Employee_Name FROM Emp_details WHERE Ename='Ramesh' ;

--Q6. Using the Employeedetails table, find all employees with a Department equal to "QA" or all employees who have an Age greater than 23 and a Salary less than 50000.
 
SELECT * FROM Emp_details WHERE EDepartment ='QA' OR (EAge > 23 And ESalary < 50000);

 --Q7. Find all employees from Employeedetails who have a Department in the list of: "DA", "FS", and "DE". Complete this query twice – once using the IN operator in the WHERE clause and a second time using multiple OR operators

 --Method 1 (In)

SELECT * FROM Emp_details WHERE EDepartment IN  ('DA','FS','DE');

 --Method 2 (OR)

SELECT * FROM Emp_details WHERE EDepartment = 'DA' 
                              OR EDepartment='FS' 
                              OR EDepartment= 'DE'


--Q8.Find all employees from Employeedetails whose Name starts with the letter “A”.

SELECT * FROM Emp_details WHERE EName like 'A%';

--Q9.Find all employees from Employeedetails whose Name ends with the letter “a”.


 SELECT * FROM Emp_details Where EName like '%a';

--Q10. Return all columns from the Employeedetails table for all employees who have a Department. That is, return all rows where the Department column does not contain a NULL value.

 SELECT * FROM Emp_details WHERE EDepartment IS NOT NULL;

--Q 11.Return the EID and Salary columns from Employeedetails for all employees who have a Department and whose Salary exceeds 20,000.
 
 SELECT EID,Esalary FROM Emp_details WHERE EDepartment Is NOT NULL AND ESalary > 20000;

