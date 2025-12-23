select *from account
select *from assist
select *from branch
select *from customer
select *from employee
select *from loans
select *from transactions
----------------------------------------------------------------
---Display branch ID, name, and the name of the employee who manages it.---
select
    b.branch_ID,
    b.address as Branch_Name,
    e.name as Manager_Name
FROM 
    branch b
JOIN 
   employee e ON b.branch_ID = e.Emp_ID;
   -----------------------------
---Display branch names and the accounts opened under each----
select 
    b.branch_ID,
    b.address  AS Branch_Name,
    e.name AS Manager_Name
FROM 
    branch b
LEFT JOIN 
   employee e 
   ON b.branch_ID = e.Emp_ID;
   ------------------------------------------
   -----Display full customer details along with their loans.-----
 SELECT 
    c.cust_ID,
    c.name as customer_name,
    c.address,
	c.phone_no,
	c.BD,

	l.amount as lona_type,
	l.issue_date,
	l.type,
	l.emp_ID,
	l.cust_ID
    
    
FROM 
    customer c
LEFT JOIN 
    loans l
	ON c.cust_ID = l.cust_ID;
	--------------------------------------------------------
	----Display account data where the type starts with "S" (e.g., "Savings"-----
	select
	a.account_ID,
	a.blanch,
	a.data_of_creation,
	a.saving,
	a.checking,
	a.cust_ID,

	c.cust_ID,
	c.name as CustomerName,
	c.address,
	c.phone_no,
	c.BD

	from 
	account a
	left join
	customer c 
	on c.cust_ID = a.cust_ID
	where a.saving like 'S%'
------------List customers with accounts having balances between 20,000 and 50,000.-------

select
	a.account_ID,
	a.blanch,
	a.data_of_creation,
	a.saving,
	a.checking,
	a.cust_ID,

	c.cust_ID,
	c.name as CustomerName,
	c.address,
	c.phone_no,
	c.BD

	from 
	account a
	 join
	customer c 
	on c.cust_ID = a.cust_ID
	where a.blanch between 20000 and 50000
	-------------------------------------
	---Retrieve customer names who borrowed more than 100,000 LE from 'Cairo Main Branch'.---
SELECT 
    c.name AS CustomerName
   
FROM
   customer c
JOIN loans l
    ON c.cust_ID = l.cust_ID
JOIN branch b
    ON l.cust_ID = b.branch_ID
	where l.amount >200
and  b.address = ' Muscat Downtown'
---------------------------
-----Find all customers assisted by employee "Amira Khaled".-----

select
    c.*

  from
    customer c
JOIN employee e
    ON c.cust_ID = e.emp_ID

WHERE e.name = 'Ahmed';

----------------------------
--------Display each customer’s name and the accounts they hold, sorted by account type.--------
select
c.name as customer_name,
a.account_ID,
	a.blanch,
	a.data_of_creation,
	a.saving as account_type,
	a.checking,
	a.cust_ID

	from customer c
	join account a 
	on c.cust_ID = a.cust_ID
	order by account_type;
	----------------------------------------------------

	---For each loan issued in Cairo, show loan ID, customer name, employee handling it, and branch name----
SELECT
    l.amount,
    c.name AS customer_name,
    e.name AS employee_name,
    b.address
FROM loans l
JOIN customer c
    ON l.cust_ID = c.cust_ID
JOIN employee e
    ON l.emp_ID = e.emp_ID
JOIN branch b
    ON l. amount = b.branch_ID
WHERE b.address = 'Salalah';
--------isplay all employees who manage any branch.-----
select  
    e.emp_ID,
    e.name
FROM employee e
JOIN branch b
    ON e.emp_ID = b.branch_ID;
	------Display all customers and their transactions, even if some customers have no transactions yet.----
select
    c.cust_ID,
    c.name,
    t.tran_ID,
    t.account_ID,
    t.amount,
	date
FROM customer c
LEFT JOIN transactions t
    ON c.cust_ID = t.account_ID

