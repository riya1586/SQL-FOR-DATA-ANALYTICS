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
