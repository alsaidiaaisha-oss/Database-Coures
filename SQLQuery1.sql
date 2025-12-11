create database compayDB
use compayDB
create table employee(employeeID int primary key,
Fname varchar(50) not null, 
Lname varchar(50) not null,
Dpertmant varchar(50),
Salary decimal(10,2)check(Salary>0),)




