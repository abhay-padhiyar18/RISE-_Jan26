

Create Database Train_Reservation

Use Train_Reservation

--Train Table
CREATE TABLE Trains (
    train_id INT PRIMARY KEY,
    train_name VARCHAR(100) NOT NULL,
    source VARCHAR(50) NOT NULL,
    destination VARCHAR(50) NOT NULL,
    departure_time TIME NOT NULL,
    arrival_time TIME NOT NULL,
    distance_km INT NOT NULL CHECK (distance_km > 0)
);


-- Pessenger

CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age > 0),
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    city VARCHAR(50)
);


--

CREATE TABLE Reservations (
    res_id INT PRIMARY KEY,
    passenger_id INT NOT NULL,
    train_id INT NOT NULL,
    travel_date DATE NOT NULL,             
    class VARCHAR(10) NOT NULL CHECK (class IN ('Sleeper', 'AC1', 'AC2', 'AC3')),
    fare DECIMAL(10,2) NOT NULL CHECK (fare >= 0),
    status VARCHAR(15) NOT NULL  CHECK (status IN ('Confirmed', 'Waiting', 'Cancelled')),
    
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (train_id) REFERENCES Trains(train_id)
);


--Insert Data 
--Trains
INSERT INTO Trains VALUES
(101, 'Shatabdi Exp', 'Delhi', 'Bhopal', '06:00', '14:00', 700),
(102, 'Rajdhani Exp', 'Delhi', 'Mumbai', '16:00', '08:00', 1400),
(103, 'Duronto Exp', 'Mumbai', 'Chennai', '20:00', '10:00', 1300),
(104, 'Garib Rath', 'Kolkata', 'Delhi', '12:00', '06:00', 1500),
(105, 'Chennai Exp', 'Chennai', 'Delhi', '08:00', '22:00', 2200),
(106, 'Howrah Exp', 'Howrah', 'Mumbai', '10:00', '20:00', 1960),
(107, 'Nizamuddin Exp', 'Delhi', 'Hyderabad', '15:00', '05:00', 1675),
(108, 'Goa Exp', 'Mumbai', 'Goa', '07:00', '15:00', 589),
(109, 'Kashi Exp', 'Varanasi', 'Delhi', '05:30', '13:30', 820),
(110, 'Jammu Tawi Exp', 'Delhi', 'Jammu', '18:00', '07:00', 670),
(111, 'Karnataka Exp', 'Bangalore', 'Delhi', '21:00', '14:00', 2360),
(112, 'Kerala Exp', 'Trivandrum', 'Delhi', '11:00', '22:00', 3045),
(113, 'Punjab Mail', 'Mumbai', 'Firozpur', '19:00', '09:00', 1925),
(114, 'Tamil Nadu Exp', 'Chennai', 'Delhi', '06:30', '20:30', 2180),
(115, 'Andhra Exp', 'Hyderabad', 'Delhi', '06:00', '19:00', 1700),
(116, 'Odisha Sampark', 'Bhubaneswar', 'Delhi', '14:00', '08:00', 1725),
(117, 'Maharashtra Exp', 'Mumbai', 'Nagpur', '09:00', '18:00', 840),
(118, 'Saurashtra Exp', 'Rajkot', 'Mumbai', '06:00', '14:00', 730),
(119, 'Utkal Exp', 'Puri', 'Delhi', '20:00', '12:00', 1850),
(120, 'Konark Exp', 'Mumbai', 'Bhubaneswar', '22:00', '14:00', 1950),
(121, 'Kaveri Exp', 'Mysore', 'Chennai', '23:00', '07:00', 500),
(122, 'Malwa Exp', 'Indore', 'Delhi', '21:00', '08:00', 850),
(123, 'Netravati Exp', 'Mumbai', 'Mangalore', '11:00', '20:00', 720),
(124, 'Ganga Kaveri Exp', 'Chennai', 'Patna', '16:00', '08:00', 2000),
(125, 'Deccan Exp', 'Pune', 'Mumbai', '07:00', '12:00', 192),
(126, 'Shatabdi Kolkata', 'Kolkata', 'Patna', '05:00', '11:00', 535),
(127, 'Sealdah Exp', 'Sealdah', 'Delhi', '15:00', '09:00', 1460),
(128, 'Sundar Exp', 'Bangalore', 'Hyderabad', '18:00', '06:00', 650),
(129, 'Ajmer Exp', 'Ajmer', 'Delhi', '12:00', '21:00', 500);


--Passengers
INSERT INTO Passengers VALUES
(1, 'Ramesh', 45, 'M', 'Delhi'),
(2, 'Sita', 32, 'F', 'Mumbai'),
(3, 'Arjun', 28, 'M', 'Bhopal'),
(4, 'Priya', 19, 'F', 'Chennai'),
(5, 'Anil', 52, 'M', 'Kolkata'),
(6, 'Neha', 27, 'F', 'Delhi'),
(7, 'Vikram', 34, 'M', 'Mumbai'),
(8, 'Sunita', 40, 'F', 'Kolkata'),
(9, 'Rajesh', 50, 'M', 'Chennai'),
(10, 'Meena', 22, 'F', 'Bangalore'),
(11, 'Arvind', 29, 'M', 'Hyderabad'),
(12, 'Kiran', 31, 'M', 'Pune'),
(13, 'Lakshmi', 36, 'F', 'Delhi'),
(14, 'Deepak', 48, 'M', 'Patna'),
(15, 'Swati', 25, 'F', 'Jaipur'),
(16, 'Harish', 55, 'M', 'Varanasi'),
(17, 'Rohit', 19, 'M', 'Lucknow'),
(18, 'Sneha', 23, 'F', 'Ahmedabad'),
(19, 'Manoj', 60, 'M', 'Nagpur'),
(20, 'Kavita', 33, 'F', 'Bhopal'),
(21, 'Ajay', 42, 'M', 'Indore'),
(22, 'Ritu', 28, 'F', 'Mysore'),
(23, 'Pankaj', 37, 'M', 'Goa'),
(24, 'Divya', 30, 'F', 'Surat'),
(25, 'Suresh', 44, 'M', 'Ranchi'),
(26, 'Pooja', 26, 'F', 'Bhubaneswar'),
(27, 'Nitin', 32, 'M', 'Kanpur'),
(28, 'Shalini', 39, 'F', 'Chandigarh'),
(29, 'Gaurav', 21, 'M', 'Shimla'),
(30, 'Anita', 47, 'F', 'Trivandrum');


--Reservations
INSERT INTO Reservations VALUES
(201, 1, 101, '2025-09-01', 'Sleeper', 500, 'Confirmed'),
(202, 2, 102, '2025-09-05', 'AC2', 1800, 'Confirmed'),
(203, 3, 101, '2025-09-01', 'Sleeper', 500, 'Waiting'),
(204, 4, 103, '2025-09-07', 'AC3', 1200, 'Confirmed'),
(205, 5, 104, '2025-09-10', 'Sleeper', 600, 'Cancelled'),
(206, 6, 105, '2025-09-12', 'AC1', 3500, 'Confirmed'),
(207, 7, 106, '2025-09-13', 'AC2', 2200, 'Waiting'),
(208, 8, 107, '2025-09-14', 'Sleeper', 950, 'Confirmed'),
(209, 9, 108, '2025-09-15', 'AC3', 1200, 'Cancelled'),
(210, 10, 109, '2025-09-16', 'AC2', 1400, 'Confirmed'),
(211, 11, 110, '2025-09-17', 'Sleeper', 600, 'Confirmed'),
(212, 12, 111, '2025-09-18', 'AC1', 3800, 'Confirmed'),
(213, 13, 112, '2025-09-19', 'AC3', 2800, 'Waiting'),
(214, 14, 113, '2025-09-20', 'AC2', 2100, 'Confirmed'),
(215, 15, 114, '2025-09-21', 'Sleeper', 950, 'Confirmed'),
(216, 16, 115, '2025-09-22', 'AC2', 1650, 'Cancelled'),
(217, 17, 116, '2025-09-23', 'Sleeper', 800, 'Confirmed'),
(218, 18, 117, '2025-09-24', 'AC3', 1200, 'Confirmed'),
(219, 19, 118, '2025-09-25', 'AC1', 2500, 'Confirmed'),
(220, 20, 119, '2025-09-26', 'Sleeper', 1100, 'Waiting'),
(221, 21, 120, '2025-09-27', 'AC2', 1900, 'Confirmed'),
(222, 22, 121, '2025-09-28', 'AC3', 750, 'Confirmed'),
(223, 23, 122, '2025-09-29', 'Sleeper', 670, 'Cancelled'),
(224, 24, 123, '2025-09-30', 'AC2', 1100, 'Confirmed'),
(225, 25, 124, '2025-10-01', 'AC1', 3100, 'Confirmed'),
(226, 26, 125, '2025-10-02', 'Sleeper', 250, 'Waiting'),
(227, 27, 126, '2025-10-03', 'AC3', 900, 'Confirmed'),
(228, 28, 127, '2025-10-04', 'AC2', 1750, 'Confirmed'),
(229, 29, 128, '2025-10-05', 'Sleeper', 500, 'Confirmed'),
(230, 30, 129, '2025-10-06', 'AC2', 800, 'Cancelled');



---Questions
--01.List all trains running from Delhi as source station.

Select * 
FROM Trains
Where source='Delhi'

--02.Find all passengers who are above 40 years of age.

Select *
FROM passengers
Where  age > 40

--03.Get the total number of reservations made.

Select * 
FROM Reservations

--04.Count how many reservations are in 'Confirmed' status.
Select *
FROM reservations 
WHERE status ='Confirmed'

--05.Show theaverage fare paid for each train.

Select train_id,AVG(fare) 
FROM Reservations 
Group by Train_id

--06.List reservations ordered by fare in descending order.

SELECT * 
FROM Reservations 
ORDER BY fare DESC;


--07.Find passengers who booked AC classes (AC2, AC3).
Select DISTINCT p.name 
FROM Passengers p JOIN Reservations r ON p.passenger_id = r.passenger_id
where class IN ('AC2','AC3') 

--08.Get total revenue collected per train (only Confirmed reservations).

SELECT 
    t.train_id,
    t.train_name,
    SUM(r.fare) AS total_revenue
FROM Reservations r JOIN Trains t ON r.train_id = t.train_id
WHERE r.status = 'Confirmed'
GROUP BY t.train_id, t.train_name;

--09.Find the train with the maximum distance_km.

Select Top 1 * 
FROM Trains 
Order By distance_km DESC

--10.Show number of male and female passengers.
Select gender ,Count (*) 
From Passengers
Group By gender

--11.Get the passenger names who have booked tickets in Sleeper class.

SELECT DISTINCT p.name 
FROM Passengers p
JOIN Reservations r ON p.passenger_id = r.passenger_id
WHERE r.class = 'Sleeper';

--12.Find total number of reservations made from each city (JOIN with Passengers).
SELECT 
    p.city,
    COUNT(r.res_id) AS total_reservations
FROM Passengers p
JOIN Reservations r
    ON p.passenger_id = r.passenger_id
GROUP BY p.city;

--13.Show train name and total passengers booked for it, ordered by passenger count descending.
SELECT 
    t.train_name,
    COUNT(r.res_id) AS total_passengers
FROM Trains t
JOIN Reservations r 
    ON t.train_id = r.train_id
GROUP BY t.train_id, t.train_name
ORDER BY total_passengers DESC;

--14.Find the average age of passengers who booked 'Confirmed' tickets.

Select passenger_id,AVG(age) FROM Passengers Group by passenger_id

--15.Display travel_date and number of reservations made on that date.
SELECT 
    travel_date,
    COUNT(res_id) AS total_reservations
FROM Reservations
GROUP BY travel_date
ORDER BY travel_date;

--16.Show all reservations where fare is greater than 1000.
SELECT * 
FROM Reservations 
WHERE fare > 1000;

--17.List all passengers who live in Delhi or Mumbai.

SELECT *
FROM Passengers
WHERE city IN ('Delhi', 'Mumbai');

--18.Show all trains whose distance is more than 1200 km.

SELECT *
FROM Trains
WHERE distance_km > 1200;

--19.Find reservations which are not "Cancelled".
SELECT *
FROM Reservations
WHERE status <> 'Cancelled';

--20.Show the details of trains that have "Exp" in their name.
SELECT *
FROM Trains
WHERE train_name LIKE '%Exp%';


--21.List all passengers ordered by their age in descending order.
SELECT *
FROM Passengers
ORDER BY age DESC;

--22.Display reservations sorted by travel_date (earliest first).

SELECT * FROM Reservations
Order By travel_date ASC;

--23.Find all trains ordered by distance (longest route first).

SELECT *
FROM Trains
ORDER BY distance_km DESC;

--24.Show passengers ordered by name alphabetically.
SELECT *
FROM Passengers
ORDER BY name ASC;


--25.List reservations ordered by class and then by fare.
SELECT *
FROM Reservations
ORDER BY class ASC, fare ASC;

--26.Count how many passengers are from each city.

SELECT city, COUNT(*) AS total_passengers
FROM Passengers
GROUP BY city;

--27.Find the total fare collected from all Confirmed reservations.

Select SUM(fare) AS total_fare_collection
From Reservations
Where status='Confirmed';

--28.Show the minimum, maximum, and average age of passengers.

Select 
     MIN(age) As Minimum_Age,
     Max(age) As Maximaum_Age,
     AVG(age) AS Average_Age
From Passengers;


--29.Find the highest fare paid in Sleeper class.

Select MAX(fare) AS highest_sleeper_fare
From Reservations
WHERE class = 'Sleeper';

--30.Get the average fare per travel_date

Select 
    travel_date,
    AVG(fare) AS average_fare
From Reservations
Group By travel_date;

--31.Show each class and the total number of reservations in it.

Select  class ,COUNT(*) as total_reservations
From Reservations
Group BY class;


--32.Find trains that have more than 1 reservation.

SELECT train_id, COUNT(*) AS total_reservations
FROM Reservations
GROUP BY train_id
HAVING COUNT(*) > 1;

--33.List cities where more than 1 passenger lives.

Select  city ,Count(*) AS total_passengers
FROM Passengers
Group BY city
Having Count(*) >1;


--34.Show gender-wise average age of passengers.

SELECT gender, AVG(age) AS average_age
FROM Passengers
GROUP BY gender;


--35.Find passengers who booked more than 1 ticket.

Select passenger_id,COUNT(*) AS total_tickets
From Reservations
Group BY passenger_id
Having Count(*) >1;

--36.Show passenger name, train name, and fare for each reservation.

Select 
     p.name AS passenger_name,
     t.train_name,
     r.fare
From Reservations r
Join Passengers p ON r.passenger_id = p.passenger_id
Join Trains t ON r.train_id = t.train_id;

--37.List all passengers and the train name they booked (if any).

Select 
    p.name AS passenger_name,
    t.train_name
From Passengers p
LEFT JOIN Reservations r
    ON p.passenger_id= r.passenger_id
Left JOIN Trains t
    ON r.train_id = t.train_id;




--38.Show all trains and the number of passengers booked in each.
 
 Select 
    t.train_name,
    Count(r.passenger_id) AS total_passengers
From Trains t
Left JOIN Reservations r
    on t.train_id = r.train_id
Group by t.train_name;

--39.Find all passengers who booked Rajdhani Exp.
Select DISTINCT p.name
From Passengers P
Join Reservations r
        ON p.passenger_id = r.passenger_id
Join Trains t
       ON r.train_id = t.train_id
Where t.train_name = 'Rajdhani Exp';


--40.List passenger names with their travel_date and status.

Select 
 p.name As Passenger_name,
 r.travel_date,
 r.status
From Reservations r
Join Passengers p
on r.passenger_id =p.passenger_id;

--41.Find the top 2 highest fare reservations.
Select Top 2 * from Reservations
Order by fare DESC;


--42.Find the train with the lowest average fare.

SELECT TOP 1
    t.train_name,
    AVG(r.fare) AS avg_fare
FROM Reservations r
JOIN Trains t
    ON r.train_id = t.train_id
GROUP BY t.train_name
ORDER BY AVG(r.fare) ASC;


--43.Show the train(s) where total distance travelled by all passengers > 1000 km.--
SELECT t.train_name, SUM(t.distance_km) AS total_distance
FROM Reservations r
JOIN Trains t ON r.train_id = t.train_id
GROUP BY t.train_name
HAVING SUM(t.distance_km) > 1000;

--44.Find passengers whose reservation status is "Waiting".
Select DISTINCT p.name
From Passengers p
Join Reservations r ON p.passenger_id=r.passenger_id
Where r.status ='Waiting';

--45.Show the passenger(s) who paid the maximum fare overall.

Select p.name,r.fare
From Reservations r
Join Passengers p ON r.passenger_id = p.passenger_id
Where r.fare = (Select MAX(fare) from Reservations);

--46.Show all passengers whose age is between 20 and 40.
Select *
From Passengers
Where Age BETWEEN 20 AND 40;

--47.Find trains that start from Kolkata or Chennai.
Select *
From Trains
Where source IN ('kolkata','chennai');

--48.Show all reservations made after 2025-09-05.
Select *
From Reservations
Where travel_date > '2025-09-05'

--49.Display passengers whose name starts with 'A'.

Select * from
Passengers 
Where name LIKE 'A%';

--50.List passengers whose city is NOT Delhi.
Select * 
from Passengers 
where city <> 'Delhi'

--51.Show the 3 youngest passengers.

Select Top 3 * from Passengers Order By age ASC 

--52.Show the 2 longest-distance trains.
Select top 2 * from Trains Order by distance_km DESC 

--53.Display the 5 most expensive reservations (highest fare).
Select top 5 * from Reservations Order BY fare DESC 


--54.List trains in alphabetical order of train_name.

 select * from Trains Order By train_name ASC;

--55.Show passengers sorted by age (youngest first).

Select * from Passengers Order BY age ASC;

--56.Find the average fare of all reservations.
Select avg(fare) as Average_fare from Reservations;

--57.Count the total number of male passengers.
Select COunt (*)
From Passengers
Where gender = 'M';

--58.Show the maximum distance among all trains.

Select MAX (distance_km) AS Max_distance from trains;
--59.Find the total number of Sleeper class reservations.

Select count(*) From Reservations Where class = 'Sleeper'

--60.Find the total fare paid by passengers from Mumbai.

Select SUM(r.fare) AS total_fare 
From Reservations r
JOIN Passengers p ON r.passenger_id = p.passenger_id
Where p.city ='Mumbai';

--61.Count the number of reservations per status (Confirmed/Waiting/Cancelled).

Select status ,Count (*) AS total
From Reservations
Group by Status;
--62.Find the total number of passengers per gender.

Select gender ,COUNT(*)
From Passengers
group by gender;

--63.Show the average fare for each class.

Select class,AVG(fare) AS avg_fare
FROM Reservations
Group by class;

--64.Display the number of trains starting from each source city.

Select source,COUNT(*) AS total_trains
From Trains
group by source;

--65.Show total reservations grouped by travel_date.

Select travel_date ,Count(*)
From Reservations
Group BY travel_date;

--66.Show passenger name, city, and train_name they booked.

Select p.name,p.city,t.train_name
From Passengers p 
Join Reservations r ON p.passenger_id= r.passenger_id
Join Trains t ON r.train_id = t.train_id;

--67.List all reservations with passenger name and status.
Select p.name,r.status
From Reservations r
JOIN Passengers p ON r.passenger_id=p.passenger_id;
--68.Show train_name and number of confirmed passengers on it.

SELECT t.train_name, COUNT(*) AS total_confirmed
FROM Reservations r
JOIN Trains t ON r.train_id = t.train_id
WHERE r.status = 'Confirmed'
GROUP BY t.train_name;

--69.Display all passengers with train_name (if booked, else show NULL).
SELECT p.name, t.train_name
FROM Passengers p
LEFT JOIN Reservations r ON p.passenger_id = r.passenger_id
LEFT JOIN Trains t ON r.train_id = t.train_id;

--70.Find which passengers booked Garib Rath train.
SELECT DISTINCT p.name
FROM Passengers p
JOIN Reservations r ON p.passenger_id = r.passenger_id
JOIN Trains t ON r.train_id = t.train_id
WHERE t.train_name = 'Garib Rath';

--71.Show train_id and total fare collected, but only where fare > 1000.

Select train_id,SUM(fare) AS total_fare
From Reservations
Group By train_id
Having SUM (fare) > 1000;

--72.List source cities that have more than 1 train.

Select source ,COUNT(*)
From Trains
Group by source
Having Count (*) >1;

--72.Find passengers grouped by city where count > 1.

SELECT source, COUNT(*) 
FROM Trains
GROUP BY source
HAVING COUNT(*) > 1;


--73.Show classes that earned more than 2000 fare in total.

Select class,SUM(fare) AS total_fare
From Reservations
Group by class
Having SUM(fare) > 2000;
--74.List trains that have at least 2 passengers booked.

Select train_id ,Count(*)
From Reservations
Group By train_id
Having Count (*) >=2;


--75.Find the passenger(s) with the highest age.
Select *
from passengers
where age = (Select MAX(age) From Passengers);

--76.Show the train(s) with the shortest distance.

Select * from Trains
Where distance_km = (Select MIN (distance_km) FROM Trains);
--77.Find the reservation(s) with the lowest fare.
Select * from Reservations
Where fare =(Select Min(fare) From Reservations);


--78.List passengers who paid above the average fare.
Select DISTINCT p.name
From Passengers p
Join Reservations r ON p.passenger_id=r.passenger_id
Where r.fare > (Select AVG(fare) From Reservations);
--79.Find trains whose distance is above the average train distance.
Select * 
from Trains
Where distance_km >(Select AVG(distance_km) From Trains);

--80.Show all reservations in September 2025.
Select * from Reservations
Where travel_date BETWEEN '2025-09-01' And '2025-09-30';

--81.Find the earliest travel_date booked.
Select MIN(travel_date)
From Reservations;

--82.Find the latest travel_date booked.

Select MAX(travel_date) From Reservations

--83.Count how many reservations are made per day.

Select travel_date,COUNT(*)
From Reservations
Group by travel_date

--84.List passengers who booked tickets on the same date.
Select travel_date,COUNT(*)
From Reservations 
Group by travel_date
Having Count(*) > 1;

--85.Show passenger name, train_name, and distance travelled.
SELECT p.name, t.train_name, t.distance_km
FROM Reservations r
JOIN Passengers p ON r.passenger_id = p.passenger_id
JOIN Trains t ON r.train_id = t.train_id;

--86.Find the city that contributed the highest number of passengers.

Select top 1 city ,COunt(*) AS Total
From Passengers 
Group By city
Order by total DESC
--87.Display each train and its average fare (confirmed only).

SELECT t.train_name, AVG(r.fare) AS avg_fare
FROM Reservations r
JOIN Trains t ON r.train_id = t.train_id
WHERE r.status = 'Confirmed'
GROUP BY t.train_name;

--88.Show passengers who booked tickets in more than one class.
SELECT p.name
FROM Reservations r
JOIN Passengers p ON r.passenger_id = p.passenger_id
GROUP BY p.name
HAVING COUNT(DISTINCT r.class) > 1;


--89.Find train_name with maximum number of reservations.
SELECT top 1 t.train_name, COUNT(*) AS total_reservations
FROM Reservations r
JOIN Trains t ON r.train_id = t.train_id
GROUP BY t.train_name
ORDER BY total_reservations DESC

