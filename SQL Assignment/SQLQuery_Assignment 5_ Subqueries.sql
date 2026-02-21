
---SubQuery---

CREATE TABLE Products (
    ProductId INT PRIMARY KEY,
    ProductName VARCHAR(25),
    Price MONEY CHECK (Price > 0),
    AvilableUnit INT CHECK (AvilableUnit > 0),
    SalesUnit INT,
    City VARCHAR(25)
);

Select * from Products


INSERT INTO Products VALUES
(1, 'Laptop', 55000, 15, 5, 'Ahmedabad'),
(2, 'Smartphone', 25000, 40, 18, 'Vadodara'),
(3, 'Tablet', 18000, 25, 10, 'Surat'),
(4, 'Smart TV', 42000, 12, 6, 'Rajkot'),
(5, 'Bluetooth Speaker', 3500, 60, 25, 'Ahmedabad'),
(6, 'Wireless Mouse', 1200, 80, 30, 'Vadodara'),
(7, 'Keyboard', 1500, 70, 28, 'Surat'),
(8, 'Power Bank', 2200, 50, 20, 'Rajkot'),
(9, 'Printer',4500, 40 ,15, 'Vadodara'),
(10, 'AC' ,45000,50,25,'Surat');


--Q1. Find all products that have a Quantity greater than the average quantity of all products.

Select * from Products 
where AvilableUnit
>(Select AVG(AvilableUnit)
  from Products)

--Q2.Display the ProductName of products sold in the same city as 'Laptop'.

Select ProductName 
From Products 
Where City = (
      Select City 
      From Products 
      Where ProductName ='Laptop');

 

--Q3.Find the details of the products with the maximum Quantity

Select  * from Products Where AvilableUnit = 
(Select MAX (AvilableUnit)
From Products);

--Q4 List products whose salesUnit is higher than the salesUnit of ProductID 5

Select * from Products where SalesUnit >
(Select SalesUnit From Products Where ProductId = 5);


-- Q5 Find products that have a lower Quantity than the minimum Quantity found in
'Vadodara'.

SELECT * FROM Products
WHERE AvilableUnit < (SELECT MIN(AvilableUnit) 
FROM Products WHERE City = 'Vadodara');


--Q6.Display products whose salesUnit is greater than the average salesUnit of products
in 'Mumbai'

Select *  FROM Products
Where SalesUnit > (SELECT Avg(SalesUnit) From Products Where City = 'Mumbai');


--Q7a . Find the produdct name with the lowest SalesUnit
Select * From Products Where SalesUnit > (Select MIN(SalesUnit) From Products)

--Q7b. Find the product name with the salesUnit

Select ProductName ,SalesUnit From Products;

--Order by Highest Sales
Select ProductName,SalesUnit 
From Products Order BY SalesUnit DESC


--Q8. List all products sold in cities that have more than 50 total Quantity across all their products.

Select * From Products
Where City IN (SELECT City From Products Group BY City Having SUM (AvilableUnit) > 50);

--Q9. Show products whose Quantity is exactly equal to the salesUnit of 'Smartphone'.

  Select * From Products 
  Where AvilableUnit =(SELECT SUM(SalesUnit) FROM Products Where ProductName = 'Smartphone');

--Q10. Find the city which has the product with the highest salesUnit
  
  
  Select City From Products
  Where SalesUnit= (Select Max(SalesUnit) From Products)


  ---Using (IN, ALL, ANY & Correlated)


--Q11. Find all products sold in cities where at least one product has a Quantity of zero.

Select * from Products 
Where City IN (Select City From Products Where AvilableUnit = 0);


--Q12. List products whose salesUnit is greater than the salesUnit of all products in 'Surat'.


Select * From Products
Where SalesUnit > ALL  (Select SalesUnit From Products Where City = 'Surat');



--Q13. Find products that belong to cities where the average salesUnit is greater than 10.

Select * FROM Products 
   Where City IN( Select City From Products Group By City Having AVG(SalesUnit) >10);


--Q14.Display products that have a Quantity greater than any product's Quantity in 'Pune'.

Select * FROM Products
Where AvilableUnit > ANY (Select AvilableUnit From Products Where City = 'Pune');


--Q15.Find all products whose ProductName is the same as any product sold in 'Ahmedabad'

Select * FROM Products
Where ProductName = ANY (Select ProductName From Products Where City ='Ahmedabad');


--Q16.Select products where the Quantity is greater than the average Quantity of their own city.

Select * from Products p1 
where AvilableUnit >(Select AVG(AvilableUnit) From Products p2 Where p2.city = p1.city) 


--Q17. Find cities where the total salesUnit is higher than the total salesUnit of 'Vadodara'.

Select City From Products 
Group by City  Having SUM(SalesUnit) > (Select SUM(SalesUnit) From Products Where City = 'Vadodara')


--Q18. List products that are sold in the city that has the maximum variety (count) of products.
Select * from Products  
Where City = 
(Select Top 1 City from Products Group BY City Order By Count (*) DESC) 

--Q19.Find the second highest Quantity from the Product table using a subquery.

Select MAX(AvilableUnit) AS SecondHighestQty
From Products
Where AvilableUnit < (Select MAX(AvilableUnit) From Products );

--Q20. Display the ProductName and a calculated column showing the difference between its Quantity and the global average Quantity.

SELECT 
    ProductName,
    AvilableUnit,
    AvilableUnit - (SELECT AVG(AvilableUnit) FROM Products) AS AvilableUnitDifference
FROM Products;
