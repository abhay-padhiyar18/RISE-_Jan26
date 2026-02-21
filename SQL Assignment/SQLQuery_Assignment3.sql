--Assignment 03


Create Table Employee03
(EID INT,
EName VARCHAR(25),
EAge INT,
EDepartment VARCHAR(35),
ESalary Money,
ECity VARCHAR(25))

Select * from Employee03

Insert into Employee03 values
(1,'Ajay',25,'IT',25000,'Vadodara')


Insert into Employee03 values
(2,'Sanjay',28,'Marketing',20000,'Bharuch'),
(3,'Mahesh',30,'Cloud',28000,'Vadodara'),
(4,'Ramesh',26,'QA',22000,'Surat'),
(5,'Suresh',28,'QA',25000,'Bharuch')


--Q1 

Select EID,
EName,
ESalary,
(ESalary * 0.1) AS Bonus From Employee03

--Q2

Select EID,
EName,
ESalary,
(ESalary + 5000) As Flate_Rise From Employee03

--Q3 
SELECT 
    Ename,
    EAge + 2 AS ProjectedAge
FROM Employee03;


--Q4
Select EID,
EName,
ESalary,
(ESalary - 0.02) AS Professional_Tax From Employee03

SELECT 
    Ename,
    ESalary,
    ESalary * 0.02 AS MonthlyDeduction,
    ESalary - (ESalary * 0.02) AS Current_Salary
FROM Employee03;


--Comparison Operator
--Q6

Select * from Employee03
Where Eage = 25 

--Q7
Select * from Employee03 
Where ESalary > 20000 

--Q8
Select * from Employee03 
Where EDepartment <> 'Cloud'

--Q9.
Select * from Employee03
Where EAge <= 25

--Q10.

Select * from Employee03
Where ESalary <= 25000

--Logical Operator

--Q11.
Select * from Employee03
Where ESalary >= 25000 AND EDepartment ='IT'


--Q12.
Select * from Employee03
Where EDepartment = 'Marketing' OR EDepartment='QA'

--Q13.

Select * from Employee03
Where EAge >= 30 OR EDepartment='Full Stack'


--Q14.

Select * from Employee03
Where Eage = 28 AND ESalary =20000

--Q15.

Select * from Employee03
Where ESalary = 20000 OR EDepartment <> 'Admin'  

--Special Operator
--Q16.

Select * from Employee03 
Where EAge between 25 AND 28

--Q17.
Select * from Employee03
Where EDepartment like 'IT' 

--Q18.
Select * from Employee03
Where Ename like 'A%'


--Q19.
Select * from Employee03
where ESalary between 20000 AND  30000



--Q20.(Part -1)
SELECT EName, EDepartment
FROM Employee03
WHERE EDepartment IS NULL;



--Q20 (Part-2)

SELECT Ename, EDepartment
FROM Employee03
WHERE EDepartment NOT IN ('IT', 'Marketing');

--Q21.

Select * from Employee03
Where Ename like '%h'

--Q22.

Select * from Employee03
where EAge Not between 18 AND  28

