CREATE DATABASE AirlineSystem
USE AirlineSystem;

CREATE TABLE Airport (
    Airport_Code VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50)
);

CREATE TABLE Flight (
    Flight_ID INT PRIMARY KEY,
    Airline VARCHAR(50),
    Weekday VARCHAR(20),
    Restrictions VARCHAR(100)
);
CREATE TABLE Flight_Leg (
    Leg_No INT,
    Flight_ID INT,
    Scheduled_Dep_Time TIME,
    Scheduled_Arr_Time TIME,
    Departure_Airport VARCHAR(10),
    Arrival_Airport VARCHAR(10),
    PRIMARY KEY (Flight_ID, Leg_No),
    FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID),
    FOREIGN KEY (Departure_Airport) REFERENCES Airport(Airport_Code),
    FOREIGN KEY (Arrival_Airport) REFERENCES Airport(Airport_Code)
);
CREATE TABLE Airplane_Type (
    Type_Name VARCHAR(50) PRIMARY KEY,
    Company VARCHAR(50),
    Max_Seats INT
);
CREATE TABLE Airplane (
    Airplane_ID INT PRIMARY KEY,
    Total_Number_Of_Seats INT,
    Type_Name VARCHAR(50),
    FOREIGN KEY (Type_Name) REFERENCES Airplane_Type(Type_Name)
);

CREATE TABLE Flight_Leg (
    Flight_ID INT,
    Leg_No INT,
    Scheduled_Dep_Time TIME,
    Scheduled_Arr_Time TIME,
    Departure_Airport VARCHAR(10),
    Arrival_Airport VARCHAR(10),
    PRIMARY KEY (Flight_ID, Leg_No)
);


CREATE TABLE Seat (
    Seat_No VARCHAR(5),
    Flight_ID INT,
    Leg_No INT,
    Date DATE,
    PRIMARY KEY (Seat_No, Flight_ID, Leg_No, Date),
    FOREIGN KEY (Flight_ID, Leg_No, Date)
        REFERENCES Leg_Instance(Flight_ID, Leg_No, Date)
);
SELECT * 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'Leg_Instance';

CREATE TABLE Leg_Instance (
    Flight_ID INT,
    Leg_No INT,
    Date DATE,
    Available_Seats INT,
    Airplane_ID INT,
    Departure_Time TIME,
    Arrival_Time TIME,
    PRIMARY KEY (Flight_ID, Leg_No, Date)
);
CREATE TABLE Seat (
    Seat_No VARCHAR(5),
    Flight_ID INT,
    Leg_No INT,
    Date DATE,
    PRIMARY KEY (Seat_No, Flight_ID, Leg_No, Date),
    FOREIGN KEY (Flight_ID, Leg_No, Date)
        REFERENCES Leg_Instance(Flight_ID, Leg_No, Date)
);



ALTER TABLE Leg_Instance
ADD CONSTRAINT FK_LegInstance_FlightLeg
FOREIGN KEY (Flight_ID, Leg_No)
REFERENCES Flight_Leg(Flight_ID, Leg_No);

ALTER TABLE Leg_Instance
ADD CONSTRAINT FK_LegInstance_Airplane
FOREIGN KEY (Airplane_ID)
REFERENCES Airplane(Airplane_ID);


CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Phone VARCHAR(20)
);
CREATE TABLE Reservation (
    Customer_ID INT,
    Flight_ID INT,
    Leg_No INT,
    Date DATE,
    Seat_No VARCHAR(5),
    PRIMARY KEY (Customer_ID, Flight_ID, Leg_No, Date),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Seat_No, Flight_ID, Leg_No, Date)
        REFERENCES Seat(Seat_No, Flight_ID, Leg_No, Date)
);
CREATE TABLE Fare (
    Fare_Code VARCHAR(10) PRIMARY KEY,
    Flight_ID INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID)
);

-------------------------------------------------------
INSERT INTO Airport (Airport_Code, Name, City, State)
VALUES
('MCT', 'Muscat Intl', 'Muscat', 'Oman'),
('DXB', 'Dubai Intl', 'Dubai', 'UAE'),
('DOH', 'Hamad Intl', 'Doha', 'Qatar');

INSERT INTO Flight (Flight_ID, Airline, Weekday, Restrictions)
VALUES
(1001, 'Oman Air', 'Sunday', 'None'),
(1002, 'Emirates', 'Monday', 'No pets');


INSERT INTO Flight_Leg (Flight_ID, Leg_No, Scheduled_Dep_Time, Scheduled_Arr_Time,Departure_Airport, Arrival_Airport
)
VALUES
(1001, 1, '08:00', '09:30', 'MCT', 'DXB'),
(1001, 2, '10:30', '11:45', 'DXB', 'DOH'),
(1002, 1, '07:00', '08:15', 'DXB', 'MCT');


INSERT INTO Airplane_Type (Type_Name, Company, Max_Seats)
VALUES
('A320', 'Airbus', 180),
('B737', 'Boeing', 160);

INSERT INTO Airplane (Airplane_ID, Total_Number_Of_Seats, Type_Name)
VALUES
(1, 180, 'A320'),
(2, 160, 'B737');

INSERT INTO Leg_Instance (Flight_ID, Leg_No, Date, Available_Seats,Airplane_ID, Departure_Time, Arrival_Time
)
VALUES
(1001, 1, '2025-01-10', 150, 1, '08:05', '09:35'),
(1001, 2, '2025-01-10', 140, 1, '10:35', '11:50'),
(1002, 1, '2025-01-11', 130, 2, '07:05', '08:20');


INSERT INTO Seat (Seat_No, Flight_ID, Leg_No, Date)
VALUES
('1A', 1001, 1, '2025-01-10'),
('1B', 1001, 1, '2025-01-10'),
('2A', 1002, 1, '2025-01-11');

INSERT INTO Customer (Customer_ID, Name, Phone)
VALUES
(1, 'Aisha Al-Saidi', '95123456'),
(2, 'Omar Ali', '95678901');

INSERT INTO Reservation ( Customer_ID, Flight_ID, Leg_No, Date, Seat_No
)
VALUES
(1, 1001, 1, '2025-01-10', '1A'),
(2, 1002, 1, '2025-01-11', '2A');


INSERT INTO Fare (Fare_Code, Flight_ID, Amount)
VALUES
('F100', 1001, 120.00),
('F200', 1002, 150.00);


-------DQL-----------
---Display all flight leg records.--

SELECT * FROM Flight_Leg;
-----Display each flight leg ID, scheduled departure time, and arrival time---
SELECT Flight_ID, Leg_No,Scheduled_Dep_Time, Scheduled_Arr_Time
FROM Flight_Leg;
-----Display each airplane’s ID, type, and seat capacity----
SELECT
    A.Airplane_ID,
    A.Type_Name AS Airplane_Type,
    AT.Max_Seats AS Seat_Capacity
FROM Airplane A
JOIN Airplane_Type AT
    ON A.Type_Name = AT.Type_Name;
	------------Display each flight leg’s ID and available seats as AvailableSeats----
SELECT Flight_ID, Leg_No, Available_Seats AS AvailableSeats
FROM Leg_Instance;
--------List flight leg IDs with available seats greater than 100.----
SELECT
    Flight_ID,
    Leg_No
FROM Leg_Instance
WHERE Available_Seats > 100;
----List airplane IDs with seat capacity above 300-----

SELECT
    A.Airplane_ID
FROM Airplane A
JOIN Airplane_Type AT
    ON A.Type_Name = AT.Type_Name
WHERE AT.Max_Seats > 300;

SELECT
    A.Airplane_ID,
    AT.Max_Seats AS Seat_Capacity
FROM Airplane A
JOIN Airplane_Type AT
    ON A.Type_Name = AT.Type_Name
WHERE AT.Max_Seats > 300;

--------Display airport codes and names where city = 'Cairo'-----
SELECT
    Airport_Code,
    Name
FROM Airport
WHERE City = 'Cairo';

----Display flight legs scheduled on 2025-06-10---

SELECT
    Flight_ID,
    Leg_No,
    Date,
    Departure_Time,
    Arrival_Time
FROM Leg_Instance
WHERE Date = '2025-06-10';

-----------Display flight legs ordered by departure time.----
SELECT
    Flight_ID,
    Leg_No,
    Date,
    Departure_Time,
    Arrival_Time
FROM Leg_Instance
ORDER BY Departure_Time;
------------- Display the maximum, minimum, and average available seats----
SELECT
    MAX(Available_Seats) AS Max_Available_Seats,
    MIN(Available_Seats) AS Min_Available_Seats,
    AVG(Available_Seats) AS Avg_Available_Seats
FROM Leg_Instance;
-----Display total number of flight legs.----
SELECT COUNT(*) AS Total_Flight_Legs
FROM Flight_Leg;

------Display airplanes whose type contains 'Boeing'-----
SELECT
    A.Airplane_ID,
    AT.Type_Name,
    AT.Company
FROM Airplane A
JOIN Airplane_Type AT
    ON A.Type_Name = AT.Type_Name
WHERE AT.Company LIKE '%Boeing%';
-----DML----
---Insert a new flight leg departing from 'CAI' to 'DXB' on 2025-06-10---

INSERT INTO Flight_Leg ( Flight_ID,Leg_No,Scheduled_Dep_Time, Scheduled_Arr_Time,Departure_Airport,Arrival_Airport
)
VALUES
(2001, 1, '09:00', '14:00', 'CAI', 'DXB');

INSERT INTO Leg_Instance (Flight_ID, Leg_No,Date,Available_Seats,Airplane_ID, Departure_Time,Arrival_Time
)
VALUES
(2001, 1, '2025-06-10', 180, 1, '09:10', '14:10');

----- Insert a customer with NULL contact number----

INSERT INTO Customer (Customer_ID, Name, Phone)
VALUES
(3, 'Sara Ahmed', NULL);

------ Reduce available seats of your inserted flight leg by 5----
UPDATE Leg_Instance
SET Available_Seats = Available_Seats - 5
WHERE Flight_ID = 2001
  AND Leg_No = 1
  AND Date = '2025-06-10';

  ------------------ Increase available seats by 10 for all domestic flights----


  -----Update airplane seat capacity by +20 where capacity < 150.---UPDATE Airplane_Type
UPDATE Airplane_Type
SET Max_Seats = Max_Seats + 20
WHERE Max_Seats < 150;

--- Delete canceled flight legs-----

DELETE FROM Leg_Instance
WHERE Available_Seats = 0;


