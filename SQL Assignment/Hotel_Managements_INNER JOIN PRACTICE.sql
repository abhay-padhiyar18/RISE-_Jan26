Create Database Hotel_Managment

Use Hotel_Managment

CREATE TABLE hotel
( hotel_no CHAR(4) NOT NULL,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL);

INSERT INTO hotel VALUES 
('H111', 'Grosvenor Hotel', 'London'),
('H112', 'Laxura Hotel', 'Godhra'),
('H113', 'Sarvottam Hotel', 'Halol'),
('H114', 'Dilight Hotel', 'USA'),
('H115', 'Golden Palace Hotel', 'Mumbai')


CREATE TABLE room
( room_no VARCHAR(4) NOT NULL,
hotel_no CHAR(4) NOT NULL,
type CHAR(1) NOT NULL,
price DECIMAL(5,2) NOT NULL);

INSERT INTO room VALUES 
('1', 'H111', 'S', 80.00),
('2', 'H112', 'F', 100.00),
('3', 'H113', 'D', 70.00),
('4', 'H114', 'S', 70.00),
('5', 'H115', 'F', 100.00)

CREATE TABLE booking
(hotel_no CHAR(4) NOT NULL,
guest_no CHAR(4) NOT NULL,
date_from DATETIME NOT NULL,
date_to DATETIME NULL,
room_no CHAR(4) NOT NULL)

INSERT INTO booking VALUES
('H120', 'G120', '2025-05-04', '2025-06-04', '7'),
('H121', 'G121', '2025-08-10', '2025-09-10', '8'),
('H111', 'G111', '1999-01-01', '1999-01-02', '1'),
('H112', 'G112', '1999-02-01', '1999-01-03', '2'),
('H113', 'G113', '1999-03-01', '1999-01-04', '3'),
('H117', 'G114', '1999-04-01', '1999-01-05', '4'),
('H118', 'G115', '1999-05-01', '1999-01-06', '5')

CREATE TABLE guest
( guest_no CHAR(4) NOT NULL,
name VARCHAR(20) NOT NULL,
address VARCHAR(50) NOT NULL)

INSERT INTO guest VALUES 
('G111', 'John', 'London'),
('G112', 'Vraj', 'Godhra'),
('G113', 'Smith', 'Ahemdabad'),
('G118', 'Suresh', 'Surat'),
('G119', 'Harsh', 'USA')

select * from hotel
select * from room
select * from booking
select * from guest

UPDATE room SET price = price*1.05;

-- Create a separate table with the same
--structure as the Booking table to hold archive records.

create table booking_old
(hotel_no char(4) not null,
guest_no char(4) not null,
date_from DATETIME NOT NULL,
date_to DATETIME NULL,
room_no varchar(20) not null)

INSERT INTO booking_old
SELECT * FROM booking
WHERE date_to < '2000-01-01'

select * from booking_old

----------

delete from booking
where date_to < '2000-01-01'

select * from booking
                     
------------------Simple Queries---------------------
 
 --1. List full details of all hotels.
 Select * from hotel

--2. List full details of all hotels in London.
Select * from hotel
Where address ='London'

--3. List the names and addresses of all guests in London, alphabetically ordered by name.
Select name,address from guest
where address = 'london'
Order BY name

--4. List all double or family rooms with a price below £40.00 per night, in ascending order of price.

Select  * from room
where (type='D' AND price < 40.00) or (type='F' AND price < 40.00)
order by price

--5. List the bookings for which no date_to has been specified.
SELECT *
FROM Booking
WHERE date_to IS NULL;



---Aggregate Function
-----------------------------------------

--1.How many hotels are there?
SELECT COUNT(*) AS total_hotels FROM Hotel;

--2.List full details of all hotels in London.
Select * From Hotel 
Where address ='London';

--3.What is the total revenue per night from all double rooms?
Select SUM(price) As Total_Revenue_per_Night 
from room
Where type ='D';

--4.How many different guests have made bookings for August?

select * from booking
where month(date_from) = '8'



-----Subqueries and Joins
--1. List the price and type of all rooms at the Grosvenor Hotel.
SELECT r.price, r.type
FROM Hotel h
JOIN Room r ON h.hotel_no = r.hotel_no
WHERE h.name = 'Grosvenor Hotel';


--2. List all guests currently staying at the Grosvenor Hotel.
Select * from guest 
where guest_no IN
(Select guest_no From booking 
Where hotel_no = 
(Select hotel_no from Hotel 
Where name = 'Grosvenor Hotel') AND date_to Is NULL);

--3. List the details of all rooms at the Grosvenor Hotel, including the name of the guest staying in the room, if the room is occupied.
select h.name,g.name,r.room_no from hotel h join room r
on h.hotel_no = r.room_no
join guest g
on h.name = g.name
where h.name = 'Grosvenor Hotel'

--4. What is the total income from bookings for the Grosvenor Hotel today?
select sum(price)as total_income from hotel h
join room r
on h.hotel_no=r.hotel_no
join booking b
on r.hotel_no=b.hotel_no
where h.name='Grosvenor hotel' AND b.date_from='2025-05-04'


--5. List the rooms that are currently unoccupied at the Grosvenor Hotel.
select * from room r
join booking b
on r.hotel_no=b.hotel_no
join hotel h
on b.hotel_no=h.hotel_no
where h.name='grosvenor hotel' AND b.guest_no is NULL

--6. What is the lost income from unoccupied rooms at the Grosvenor Hotel?
select sum(r.price)as lost_income from room r
join booking b
on r.hotel_no=b.hotel_no
join hotel h
on b.hotel_no=h.hotel_no
where h.name='grosvenor hotel' AND b.guest_no is NULL



----Grouping
---------------------------------

--1. List the number of rooms in each hotel.

Select hotel_no, COUNT (*) AS total_rooms
From Room
Group By hotel_no;

--2. List the number of rooms in each hotel in London.

Select h.name,COUNT(r.room_no) AS total_rooms
From hotel h
Join Room r ON h.hotel_no = r.hotel_no
Where h.address LIKE '%London%'
Group By h.name;

--3. What is the average number of bookings for each hotel in August?
Select hotel_no AVG(total_booking) AS avg_booking
From ( 
      Select hotel_no, COUNT(*) AS total_bookings
      From Booking
      Where MONTH(date_from) = 8
      Group BY hotel_no
      )As august_booking Group by hotel_no;

--4. What is the most commonly booked room type for each hotel in London?
select r.type,h.name, count(r.type) from room r join booking b
on r.hotel_no = b.hotel_no
join hotel h
on b.hotel_no = h.hotel_no
where h.address = 'london'
group by h.name,r.type

--5. What is the lost income from unoccupied rooms at each hotel today?
select h.name,sum(r.price) from room r
join booking b
on r.room_no=b.room_no
join hotel h
on b.hotel_no=h.hotel_no
where (b.guest_no not in (b.room_no)) AND (b.date_from= GETDATE())
group by h.name


---