create database branch
use branch
CREATE TABLE Branch (
    Branch_id INT PRIMARY KEY,
    Phone_no VARCHAR(15),
    Address VARCHAR(100)
);
CREATE TABLE Employee (
    Employee_id INT PRIMARY KEY,
    Name VARCHAR(50),
    Position VARCHAR(50),
    Branch_id INT,
    FOREIGN KEY (Branch_id) REFERENCES Branch(Branch_id)
)
CREATE TABLE Customer (
    Cust_id INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(100),
    Phone_no VARCHAR(15),
    BD DATE
)
CREATE TABLE Employee_Customer (
    Cust_id INT,
    Emp_id INT,
    Action_type VARCHAR(50),
    PRIMARY KEY (Cust_id, Emp_id),
    FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id),
    FOREIGN KEY (Emp_id) REFERENCES Employee(Employee_id)
)

CREATE TABLE Transactions (
    Transactions_id INT PRIMARY KEY,
    Acco_id INT,
    Date DATE,
    Amount DECIMAL(10,2),
  )
