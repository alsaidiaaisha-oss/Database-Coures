create database banksystem
use banksystem
select * from branch
create table branch (
  branch_ID int primary key,
  phone_NO varchar(50),
  address varchar(100)
  ); 

create table employee(
    Emp_ID int primary key,
	name varchar(50),
	position varchar(50),
	branch_ID int ,
	foreign key (branch_ID) references branch(branch_ID)
);

create table customer (
   cust_ID int primary key,
   name varchar(20),
   address varchar(30),
   phone_no varchar(20),
   BD date
   );


create table account (
        account_ID int primary key,
		blanch int,
		data_of_creation date,
		saving decimal(10,2),
		checking decimal(10,2),
		cust_ID int,
		foreign key (cust_ID) references customer(cust_ID)
		);




create table loans(
         amount decimal(10,2),
		 issue_date date,
		 type varchar(30),
		 emp_ID int,
		 cust_ID int,
		 foreign key (emp_ID) references employee(emp_ID),
		 foreign key(cust_ID) references customer(cust_ID)
);

create table transactions (
                 tran_ID int ,
				 account_ID int ,
				 date date,
				 amount decimal(10,2),
				 primary key ( tran_ID,account_ID),
				 foreign key (account_ID) references account(account_ID)
);





create table  assist (
      cust_ID int,
	  emp_ID int,
	  action_type varchar(50),
	  primary key(Cust_ID, emp_ID),
	  foreign key (cust_ID) references customer( cust_ID),
	  foreign key (Emp_ID) references employee(Emp_ID)
	  );


-----DML-----
select * from  assist
insert into branch(branch_ID,phone_NO,address)values 
 (1, '24567890', 'Muscat'),
(2, '23456789', 'Salalah'),
(3, '25678901', 'Nizwa');

 insert into employee(Emp_ID,name,position,branch_ID)values     
 (1, 'Ahmed Ali', 'Manager', 1),
(2, 'Fatima Hassan', 'Clerk', 1),
(3, 'Omar Saleh', 'Teller', 2);


 insert into customer(cust_ID,name,address,phone_no,BD)values     
(1, 'Aisha Al-Saidi', 'Muscat', '95123456', '2001-05-12'),
(2, 'Omar Ali', 'Salalah', '95678901', '1999-08-25'),
(3, 'Fatima Hassan', 'Nizwa', '95987654', '2000-11-03');

 insert into account(account_ID,blanch ,data_of_creation,saving, checking, cust_ID)values 
 (201, 3000.00, '2024-01-20', 2000.00, 1000.00, 1),
(202, 2500.00, '2024-02-15', 1500.00, 1000.00, 2),
(203, 1800.00, '2024-03-10', 1200.00, 600.00, 3);


insert into loans(amount,issue_date ,type,emp_ID, cust_ID)values 
(5000.00, '2024-03-01', 'Personal', 1, 1),
(10000.00, '2024-03-10', 'Car', 2, 2),
(15000.00, '2024-04-05', 'Home', 3, 3);

insert into  transactions(tran_ID,account_ID,date ,amount)values 
(1, 201, '2024-03-15', 500.00),
(2, 202, '2024-03-18', 700.00),
(3, 203, '2024-03-20', 300.00);


insert into   assist(cust_ID, emp_ID,action_type)values 
(1, 1, 'Account Opening'),
(2, 2, 'Loan Processing'),
(3, 3, 'Customer Support');


------------------------------------------------------------------------------------------------
---- Bank Database – DQL & DML Tasks---
---Display all customer records---
SELECT * FROM Customer;
----Display customer full name, phone, and membership start date.----
select name ,phone_no from customer
--Display each loan ID, amount, and type.----
SELECT amount,type FROM Loans;
----Display account number and annual interest (5% of balance) as AnnualInterest.----
SELECT account_ID AS Account_Number, blanch * 0.05 AS AnnualInterest FROM Account;
----List customers with loan amounts greater than 100000 LE.-----
SELECT  c.Cust_ID,c.Name,
    l.Amount AS Loan_Amount
FROM Customer c
JOIN Loans l
    ON c.Cust_ID = l.Cust_ID
WHERE l.Amount > 100000;
----List accounts with balances above 20000----
SELECT account_ID, blanch FROM account
  
	  WHERE blanch > 20000;
-----------Display accounts opened in 2023------------
SELECT  account_ID, blanch,data_of_creation
FROM Account

WHERE YEAR(data_of_creation) = 2023;
-----------Display accounts ordered by balance descending-----------
SELECT  account_ID, blanch
FROM Account
ORDER BY blanch DESC;
--------------------Display the maximum, minimum, and average account balance---
SELECT
    MAX(blanch) AS Max_Balance,
    MIN(blanch) AS Min_Balance,
    AVG(blanch) AS Avg_Balance
FROM account;
-------Display total number of customers.---
SELECT COUNT(*) AS Total_Customers
FROM customer;

---------Display customers with NULL phone numbers----
SELECT 
    Cust_ID,
    Name,
    phone_No
FROM customer
WHERE phone_no is NULL;
------------DML---------------
--Insert yourself as a new customer and open an account with balance 10000---
INSERT INTO account (account_ID,blanch,data_of_creation,saving,checking,cust_ID)
VALUES
(301, 10000.00, '2025-01-01', 10000.00, 0.00, 10);
-----
SELECT account_ID FROM account;
INSERT INTO account (
    account_ID,
    blanch,
    data_of_creation,
    saving,
    checking,
    cust_ID
)
VALUES
(401, 10000.00, '2025-01-01', 10000.00, 0.00, 10);
SELECT * FROM Customer WHERE Cust_ID = 10;
INSERT INTO Customer (Cust_ID, Name, Address, Phone_No, BD)
VALUES
(10, 'Aaisha Al-Saidi', 'Muscat', '99998888', '2002-06-15');

INSERT INTO account (
    account_ID,
    blanch,
    data_of_creation,
    Saving,
    Checking,
    Cust_ID
)
VALUES
(401, 10000.00, '2025-01-01', 10000.00, 0.00, 10);
SELECT * FROM account
--------------------------------------------
----Insert another customer with NULL phone and address-----
insert into customer(cust_ID,name,address,phone_no,BD)values 
(11, 'Mohammed Ali', NULL, NULL, '2000-09-18');
--- Increase your account balance by 20%----
UPDATE account
SET blanch = blanch * 1.20
WHERE cust_ID = 10;
----------- Increase balance by 5% for accounts with balance less than 5000.---
UPDATE account
SET blanch = blanch * 1.05
WHERE blanch < 5000;
----------Update phone number to 'Not Provided' where phone is NULL-------
UPDATE customer
SET phone_no = 'Not Provided'
WHERE phone_no is NULL;
----Delete closed accounts.------
DELETE FROM account
WHERE blanch  is NULL;
