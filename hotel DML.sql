create database hotel
use hotel;


CREATE TABLE Branches (
    Branch_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Location VARCHAR(100)
);

CREATE TABLE Rooms (
    Room_Number INT PRIMARY KEY,
    Type VARCHAR(30),
    Nightly_Rate DECIMAL(10,2),
    Branch_ID INT,
    FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID)
);
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Job_Title VARCHAR(50),
    Salary DECIMAL(10,2)
)
CREATE TABLE Customer (
    Cust_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Staff_ID INT,
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);
CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY,
    Check_in DATE,
    Check_out DATE,
    Cust_ID INT,
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID)
);

----DMl----
select * from Booking


insert into Branches(Branch_ID,Name,Location) values
(1, 'Main Branch', 'Muscat'),
(2, 'Salalah Branch', 'Salalah'),
(3, 'Nizwa Branch', 'Nizwa');
---------------------------------------------------
insert into Rooms(Room_Number,Type,Nightly_Rate,Branch_ID)values
(101, 'Single', 45.00, 1),
(102, 'Double', 70.00, 1),
(201, 'Suite', 120.00, 2);
-----------------------------------------------------
insert into Staff(Staff_ID,Name,Job_Title,Salary)values 
(1, 'Ahmed Ali', 'Manager', 1200),
(2, 'Fatima Hassan', 'Receptionist', 600),
(3, 'Omar Saleh', 'Housekeeping', 500);
----------------------------------------------------------------
insert into Customer(Cust_ID,Name,Phone,Email,Staff_ID)values 
(1, 'Aisha Al-Saidi', '95123456', 'aisha@gmail.com', 1),
(2, 'Omar Ali', '95678901', 'omar@gmail.com', 2),
(3, 'Fatima Hassan', '95987654', 'fatima@gmail.com', 1);
--------------------------------------------------------------------------
insert into Booking(Booking_ID,Check_in,Check_out,Cust_ID)values 
(1, '2025-07-01', '2025-07-05', 1),
(2, '2025-07-10', '2025-07-12', 2),
(3, '2025-08-01', '2025-08-03', 3);