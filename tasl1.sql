create database compayDB
use compayDB
create table employee(
 SSN  INT PRIMARY KEY identity(1,1),
Fname varchar(50) not null, 
Lname varchar(50) not null,
  BD  DATE,
 SuperID INT,
 Dnum INT,
Salary decimal(10,2)check(Salary>0),
 CONSTRAINT FK_Emp_Dept FOREIGN KEY (Dnum)
   REFERENCES Department(Dnum),
    CONSTRAINT FK_Emp_Super FOREIGN KEY (SuperID)
        REFERENCES Employee(SSN));


CREATE TABLE Department (
    Dnum       INT PRIMARY KEY,
    Dname      VARCHAR(50),
    MgrSSN     INT,
    HireDate   DATE
);

CREATE TABLE Location (
    Dnum INT,
    Loc  VARCHAR(50),
    PRIMARY KEY (Dnum, Loc),
    CONSTRAINT FK_Location_Dept FOREIGN KEY (Dnum)
        REFERENCES Department(Dnum)
);

CREATE TABLE Project (
    Pnum   INT PRIMARY KEY,
    Pname  VARCHAR(50),
    City   VARCHAR(50),
    Loc    VARCHAR(50),
    Dnum   INT,
    CONSTRAINT FK_Project_Dept FOREIGN KEY (Dnum)
        REFERENCES Department(Dnum)
);

CREATE TABLE Dependent (
    SSN      INT,
    DepName  VARCHAR(50),
    GN       VARCHAR(10),
    BD       DATE,
    PRIMARY KEY (SSN, DepName),
    CONSTRAINT FK_Dependent_Employee FOREIGN KEY (SSN)
        REFERENCES Employee(SSN)
);
CREATE TABLE Works_on (
    SSN   INT,
    Pnum  INT,
    Hours DECIMAL(5,2),
    PRIMARY KEY (SSN, Pnum),
    CONSTRAINT FK_Work_Emp FOREIGN KEY (SSN)
        REFERENCES Employee(SSN),
    CONSTRAINT FK_Work_Project FOREIGN KEY (Pnum)
        REFERENCES Project(Pnum)
);



create table employees(
 SSN  INT PRIMARY KEY identity(1,1),
Fname varchar(50) not null, 
Lname varchar(50) not null,
  BD  DATE,
 SuperID INT,
Salary decimal(10,2)check(Salary>0),
)

insert into employees(Fname,Lname,BD,SuperID,Salary)values
('Fatam','saif','10/11/2025',1,325.00),
('Aaisha','Ali','9/2/2025',2,400.00),
('Huda','nasear','12/7/2025',2,600.00),
('Alaa','ahmed','1/3/2025',4,600.00);


CREATE TABLE Department(
    Dnum       INT PRIMARY KEY,
    Dname      VARCHAR(50),
    MgrSSN     INT,
    HireDate   DATE

);
insert into Department(Dnum,Dname,HireDate)values
(1,'aLi','9/2/2025'),
(2,'ahmed','1/1/2025'),
(3,'naser','4/6/2025'),
(4,'Huda','8/5/2025');


CREATE TABLE Location (
    Dnum INT,
    Loc  VARCHAR(50),
    PRIMARY KEY (Dnum, Loc),
    CONSTRAINT FK_Location_Dept FOREIGN KEY (Dnum)
        REFERENCES Department(Dnum)
);
insert into Location(Dnum,Loc)values
(1,'ibri'),
(2,'naziw'),
(3,'khabourah'),
(4,'Saham');


CREATE TABLE Dependent (
    SSN      INT,
    DepName  VARCHAR(50),
    GN       VARCHAR(10),
    BD       DATE,
    PRIMARY KEY (SSN, DepName),
 
);
insert into Dependent(SSN,DepName,GN,BD)values
(1,'ali','male','9/2/2025'),
(2,'ahmed','male','1/1/2025'),
(3,'naser','male','4/6/2025'),
(4,'Huda','femal','8/5/2025');






drop table Works_on

select*from Dependent