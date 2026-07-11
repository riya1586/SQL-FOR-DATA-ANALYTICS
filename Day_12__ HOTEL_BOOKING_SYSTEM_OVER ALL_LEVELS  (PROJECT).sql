--🏨 HOTEL BOOKING SYSTEM (PROJECT)--

--TABLE 1: HOTEL--
CREATE TABLE Hotels (
    hotel_id INT PRIMARY KEY,
    hotel_name VARCHAR(100),
    city VARCHAR(50),
    rating DECIMAL(2,1)
);


--TABLE 2: ROOMS--
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    hotel_id INT,
    room_type VARCHAR(30),
    price_per_night DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);


--TABLE 3: CUSTOMERS--
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);


--TABLE 4: BOOKINGS 
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    booking_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);


--TABLE PYMENTS--
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);


--SAMPLE DATA (HOTELS)--
INSERT INTO Hotels VALUES
(1,'Taj Palace','Delhi',4.8),
(2,'Royal Stay','Lucknow',4.2),
(3,'Ocean View','Goa',4.6);


--SAMPLE DATA (ROOMS)--
INSERT INTO Rooms VALUES
(101,1,'Deluxe',5000,'Available'),
(102,1,'Suite',8000,'Booked'),
(201,2,'Standard',2500,'Available'),
(202,2,'Deluxe',4000,'Booked'),
(301,3,'Suite',9000,'Available');


--SAMPLE DATA (CUSTOMERS)--
INSERT INTO Customers VALUES
(1,'Riya Mishra','9876543210','riya@gmail.com'),
(2,'Rahul Singh','9876543211','rahul@gmail.com'),
(3,'Anjali Verma','9876543212','anjali@gmail.com');

 SELECT * FROM HOTELS;


--SAMPLE DATA (BOOKING)--
INSERT INTO Bookings VALUES
(1,1,102,'2026-07-01','2026-07-03','Confirmed'),
(2,2,202,'2026-07-05','2026-07-08','Cancelled'),
(3,3,301,'2026-07-10','2026-07-12','Confirmed');


--SAMPLE DATA (PYMENTS)--
INSERT INTO Payments VALUES
(1,1,16000,'2026-07-01','UPI'),
(2,2,12000,'2026-07-05','Card'),
(3,3,18000,'2026-07-10','Cash');



-- Level: 1--

-- 1: Show all hotels.
SELECT * FROM HOTELS;


-- 2: Show all available rooms.
SELECT * 
FROM Rooms
WHERE status = 'Available';


-- 3: Find rooms with price greater than ₹5000.
SELECT * 
FROM Bookings
WHERE booking_status = 'Confirmed';


-- 4: Show all confirmed bookings.
SELECT * 
FROM Bookings
WHERE booking_status = 'Confirmed';


-- 5: Display all customer
SELECT * 
FROM Customers;




-- Level: 2--
--HINT: USED BY Aggregate Functions (COUNT(), AVG(), MAX(), MIN()--

-- 1: Count total hotels.
SELECT COUNT(*) AS Total_Hotels
FROM Hotels;


-- 2: Count total available rooms.
SELECT COUNT(*) AS Available_Rooms
FROM Rooms
WHERE status = 'Available';


-- 3: Find the average room price.
SELECT AVG(price_per_night) AS Average_Room_Price
FROM Rooms;


-- 4: Find the highest room price.
SELECT MAX(price_per_night) AS Highest_Room_Price
FROM Rooms;


-- 5: Find the lowest room price.
SELECT MIN(price_per_night) AS Lowest_Room_Price
FROM Rooms;




-- Level: 3 
-- HINT:USE (GROUP BY)--

--1: Number of rooms in each hotel.
SELECT hotel_id, COUNT(*) AS Total_Rooms
FROM Rooms
GROUP BY hotel_id;


--2: Average room price in each hotel.
SELECT hotel_id, AVG(price_per_night) AS Average_Room_Price
FROM Rooms
GROUP BY hotel_id;


--3: Total payment received by payment method.
SELECT payment_method, SUM(amount) AS Total_Payment
FROM Payments
GROUP BY payment_method;


--4: Count bookings by booking status.
SELECT booking_status, COUNT(*) AS Total_Bookings
FROM Bookings
GROUP BY booking_status;


--5: Number of hotels in each city.
SELECT city, COUNT(*) AS Total_Hotels
FROM Hotels
GROUP BY city;




-- Level: 4 --

-- HINT:(JOIN)--

--1: Show customer name with booked room type.
SELECT c.customer_name, r.room_type
FROM Customers c
INNER JOIN Bookings b
ON c.customer_id = b.customer_id
INNER JOIN Rooms r
ON b.room_id = r.room_id;


--2: Show hotel name with room details.
SELECT h.hotel_name,
       r.room_id,
       r.room_type,
       r.price_per_night,
       r.status
FROM Hotels h
INNER JOIN Rooms r
ON h.hotel_id = r.hotel_id;


--3: Show booking details with customer name.
SELECT b.booking_id,
       c.customer_name,
       b.check_in,
       b.check_out,
       b.booking_status
FROM Bookings b
INNER JOIN Customers c
ON b.customer_id = c.customer_id;


--4: Show payment details with customer name.
SELECT c.customer_name,
       p.payment_id,
       p.amount,
       p.payment_date,
       p.payment_method
FROM Customers c
INNER JOIN Bookings b
ON c.customer_id = b.customer_id
INNER JOIN Payments p
ON b.booking_id = p.booking_id;


--5: Show hotel name, room type, and customer name.
SELECT h.hotel_name,
       r.room_type,
       c.customer_name
FROM Hotels h
INNER JOIN Rooms r
ON h.hotel_id = r.hotel_id
INNER JOIN Bookings b
ON r.room_id = b.room_id
INNER JOIN Customers c
ON b.customer_id = c.customer_id;




--Level: 5 

--HINT: (Advanced):  ISME JOIN, GROUP BY, ORDER BY, SUM(), COUNT(), AVG(), aur LEFT JOIN ka use hoga.--

--1: Most booked room type.
SELECT r.room_type, COUNT(*) AS total_bookings
FROM Rooms r
JOIN Bookings b
ON r.room_id = b.room_id
GROUP BY r.room_type
ORDER BY total_bookings DESC
LIMIT 1;


--2: Total revenue.
SELECT SUM(amount) AS total_revenue
FROM Payments;


--3: Customer booking history.
SELECT c.customer_name,
       b.booking_id,
       b.check_in,
       b.check_out,
       b.booking_status
FROM Customers c
JOIN Bookings b
ON c.customer_id = b.customer_id;


--4: Monthly bookings.
SELECT c.customer_name,
       COUNT(b.room_id) AS total_rooms
FROM Customers c
JOIN Bookings b
ON c.customer_id = b.customer_id
GROUP BY c.customer_name
HAVING COUNT(b.room_id) > 1;

--5: Cancelled bookings.
SELECT *
FROM Bookings
WHERE booking_status = 'Cancelled';


--6: Hotel earning report.
SELECT h.hotel_name,
       SUM(p.amount) AS total_earning
FROM Hotels h
JOIN Rooms r
ON h.hotel_id = r.hotel_id
JOIN Bookings b
ON r.room_id = b.room_id
JOIN Payments p
ON b.booking_id = p.booking_id
GROUP BY h.hotel_name;


--7: Top-paying customer.
SELECT c.customer_name,
       SUM(p.amount) AS total_paid
FROM Customers c
JOIN Bookings b
ON c.customer_id = b.customer_id
JOIN Payments p
ON b.booking_id = p.booking_id
GROUP BY c.customer_name
ORDER BY total_paid DESC
LIMIT 1;


--8: Hotel with highest average room price.
SELECT h.hotel_name,
       AVG(r.price_per_night) AS avg_price
FROM Hotels h
JOIN Rooms r
ON h.hotel_id = r.hotel_id
GROUP BY h.hotel_name
ORDER BY avg_price DESC
LIMIT 1;


--9: Rooms that have never been booked.
SELECT r.room_id,
       r.room_type
FROM Rooms r
LEFT JOIN Bookings b
ON r.room_id = b.room_id
WHERE b.booking_id IS NULL;


--10: Customers who booked more than one room.
SELECT c.customer_name,
       COUNT(b.room_id) AS total_rooms
FROM Customers c
JOIN Bookings b
ON c.customer_id = b.customer_id
GROUP BY c.customer_name
HAVING COUNT(b.room_id) > 1;