create database correctcampany
use correctcampany
create table Employee(
Fname varchar(50) not null, 
Lname varchar(50) not null,
SSN  INT PRIMARY KEY identity(1,1),
BD  DATE,
Gender varchar(20) not null,
Supper_ssn int,
 foreign key(Supper_ssn) references Employee(ssn)
)
create table Department(
Dname varchar(50) not null,
Dnumber int primary key identity(1,1),
Mgr_ssn int,
Hire_data Date not null,
foreign key(Mgr_ssn) references Employee(ssn)
);
create table Project(
Pname varchar(20) not null,
Pnumber int primary key identity(1,1),
Plocation varchar(100) not null,
Dnumber int,
foreign key(Dnumber) references Department(Dnumber)
);
 create table Dept_location(
 Dnumber int,
 Dlocation varchar(100),
 foreign key (Dnumber),primary key (Dnumber,Dlocation)
 );
 create table Works_on(
 Essn int,
 Pno int,
 Hrs int not null,
 foreign key (Essn) references Employee(ssn),
 foreign key (Pno) references Project(Pnumber),
 primary key (Essn,Pno)
 );

create table EmployeeDependent(
Essn int,
Dependent_name varchar(50) not null,
Gender bit default 0,
BDate date,
foreign key(Essn) references Employee(ssn),
primary key(Essn,Dependent_name)
);

select *from Department

insert into Employee(Fname,Lname,BD,Gender,Supper_ssn)values
('Shahad','ahmed', '10-11-2025','male',1),
('Omar','Ali', '9-2-2025','male',2),
('fatam','nasear', '12-7-2025','female',3),
('Moza','ahmed', '1-3-2025','female',4);

insert into Department(Dname,Hire_data)values
('IT','9/2/2025'),
('HR','1/1/2025'),
('Finance','3/6/2025'),
('Marcketing','3/5/2025');

