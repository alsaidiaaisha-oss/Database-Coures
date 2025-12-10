create database hotel
use hotel



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



