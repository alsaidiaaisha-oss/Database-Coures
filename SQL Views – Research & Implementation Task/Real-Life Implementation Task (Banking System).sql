create Database BankingSystem
use BankingSystem

CREATE TABLE Customer (
CustomerID INT PRIMARY KEY,
FullName NVARCHAR(100),
Email NVARCHAR(100),
Phone NVARCHAR(15),
SSN CHAR(9)
);
CREATE TABLE Account (
AccountID INT PRIMARY KEY,
CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
Balance DECIMAL(10, 2),
AccountType VARCHAR(50),
Status VARCHAR(20)
);

CREATE TABLE Transactions (
TransactionID INT PRIMARY KEY,
AccountID INT FOREIGN KEY REFERENCES Account(AccountID),
Amount DECIMAL(10, 2),
Type VARCHAR(10), -- Deposit, Withdraw
TransactionDate DATETIME
);
CREATE TABLE Loan (
LoanID INT PRIMARY KEY,
CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
LoanAmount DECIMAL(12, 2),
LoanType VARCHAR(50),
Status VARCHAR(20)
);
 insert into Customer(CustomerID,FullName,Email,phone,SSN)values     
(1, 'Aisha Al-Saidi','aa@gmail.com', '95123456','20010512' ),
(2, 'Omar Ali','om@gmail.com', '95678901','19990825'),
(3, 'Fatima Hassan','fa@gmail.com','95987654' ,'20001103');

select *from Customer

INSERT INTO Account (AccountID, CustomerID, Balance, AccountType, Status) VALUES
(1, 1, 1500.50, 'Savings', 'Active'),
(2, 1, 2500.00, 'Checking', 'Active'),
(3, 2, 3000.75, 'Savings', 'Inactive'),
(4, 3, 1200.00, 'Checking', 'Active');
select *from Account
INSERT INTO Transactions (TransactionID, AccountID, Amount, Type, TransactionDate) VALUES
(1, 1, 500.00, 'Deposit', '2025-12-01 10:30:00'),
(2, 1, 200.00, 'Withdraw', '2025-12-05 15:45:00'),
(3, 2, 1000.00, 'Deposit', '2025-12-03 09:20:00'),
(4, 3, 300.00, 'Withdraw', '2025-12-07 11:00:00'),
(5, 4, 400.00, 'Deposit', '2025-12-10 14:15:00');
select *from Transactions
INSERT INTO Loan (LoanID, CustomerID, LoanAmount, LoanType, Status) VALUES
(1, 1, 5000.00, 'Personal', 'Active'),
(2, 2, 15000.00, 'Mortgage', 'Approved'),
(3, 3, 8000.00, 'Car', 'Pending'),
(4, 1, 2000.00, 'Personal', 'Closed');
select *from Loan
-------------------------------------------------------------
create view CustomerService  as

select

 c.FullName AS CustomerName,
    c.Phone,
    a.Status AS AccountStatus
	from Customer c
	join Account a on c.CustomerID = a .CustomerID
	select * from CustomerService 
	------
	create view  FinanceDepartment 
	as 
	select 
     AccountID,
      Balance,
       AccountType
  from
    Account;
	select *from FinanceDepartment 
	------------------
	create view oanOfficerViewc as 
	select 
	  LoanID,
      CustomerID,   
      LoanAmount,
      LoanType,
       Status
	from
	Loan;
	select *from oanOfficerViewc
	select *from Loan
	-------- 
	
create view  TransactionSummaryView AS
select  
    AccountID,
    Amount,
    TransactionDate
from 
    Transactions
WHERE 
TransactionDate >= DATEADD(DAY, -30, GETDATE());

SELECT * FROM TransactionSummaryView;