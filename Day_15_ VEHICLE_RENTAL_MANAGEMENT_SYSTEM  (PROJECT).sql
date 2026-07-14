--Vehicle Rental Management System--


-- Create Table
CREATE TABLE Vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    vehicle_name VARCHAR(100),
    vehicle_type VARCHAR(50),
    brand VARCHAR(50),
    rent_per_day DECIMAL(8,2),
    available BOOLEAN
);

-- Insert Data
INSERT INTO Vehicles (vehicle_name, vehicle_type, brand, rent_per_day, available)
VALUES
('Swift','Car','Maruti',1800,TRUE),
('Creta','Car','Hyundai',2500,TRUE),
('Activa 6G','Scooter','Honda',600,FALSE),
('Royal Enfield','Bike','Royal Enfield',1200,TRUE),
('Splendor','Bike','Hero',700,TRUE),
('Innova','Car','Toyota',3500,FALSE),
('Jupiter','Scooter','TVS',650,TRUE),
('Pulsar 220','Bike','Bajaj',1100,TRUE);

-- View Data
SELECT * FROM Vehicles;

-- Available Vehicles
SELECT * FROM Vehicles
WHERE available = TRUE;

-- Car List
SELECT * FROM Vehicles
WHERE vehicle_type = 'Car';

-- Sort by Rent
SELECT * FROM Vehicles
ORDER BY rent_per_day DESC;

-- Average Rent by Vehicle Type
SELECT vehicle_type,
COUNT(*) AS total_vehicles,
AVG(rent_per_day) AS average_rent
FROM Vehicles
GROUP BY vehicle_type;

-- Highest Rent
SELECT MAX(rent_per_day) AS highest_rent
FROM Vehicles;

-- Lowest Rent
SELECT MIN(rent_per_day) AS lowest_rent
FROM Vehicles;

-- Update Availability
UPDATE Vehicles
SET available = FALSE
WHERE vehicle_id = 5;

-- Delete Record
DELETE FROM Vehicles
WHERE vehicle_id = 7;

-- Top 3 Expensive Vehicles
SELECT *
FROM Vehicles
ORDER BY rent_per_day DESC
LIMIT 3;

-- Description--

/* A PostgreSQL project for managing vehicle rental records. 
It includes table creation, data insertion, filtering, sorting,
grouping, aggregate functions, update, delete, and reporting queries. */