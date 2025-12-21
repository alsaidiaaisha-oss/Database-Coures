----Display the department ID, department name, manager ID, and the full name of the manager----
select* from Departments
select* from Dependent
select* from Employee
select* from Project
select* from Works_for

select  d.Dname ,d.Dnum,d.Mgrssn,

 e.Fname + ' ' + e.Lname as ManagerFullName 
from departments d inner join Employee e
on d.Mgrssn = e.SSN;

---Display the names of departments and the names of the projects they control.---
select d.Dname as DepartmentsName,
       p.Pname as ProjctName
	from Departments d inner join Project p
	on d.Dnum = p.Dnum;
-------Display full data of all dependents, along with the full name of the employee they depend on-----
select d.ESSN,d.Dependent_name,d.Sex,d.Bdate,
e.Fname + '' + e.Lname as EmployeeFullname
from Dependent d inner join Employee e
on d.ESSN =e.SSN;
-----Display the project ID, name, and location of all projects located in Cairo or Alex-----
select p.Pnumber, P.Pname, p.Plocation,d.Dname
    from Project p inner join Departments d
	on p.Dnum= d.Dnum
	
	where p.City in('Cairo', 'Alex');
	-----Display all project data where the project name starts with the letter 'A'---
	select p.*
	from Project p
	inner join Departments d
	on p.Dnum = d.Dnum
	where  p.Pname like 'A%'
-----Display the IDs and names of employees in department 30 with a salary between 1000 and 2000 LE---
select  e.SSN as employeeID
from Employee e
inner join Departments d
 on  e.Dno = d.Dnum
where d.Dnum = 30
and e.Salary between 1000  and 2000;
--------Retrieve the names of employees in department 10 who work ≥ 10 hours/week on the "AL Rabwah" project------
select 
e.Fname+ ' '+ e.Lname as EmployeeName
from Employee e inner join Works_for w
on e.SSN = w.ESSN
inner join Project p
on w.Pno = Pnumber
inner join Departments d
on e.Dno = d.Dnum
where d.Dnum =10
and p.Pname ='AL Rabwah'
and w.Hours>= 10;
-------Find the names of employees who are directly supervised by "Kamel Mohamed---
select e.Fname+' '+ e.Lname as EmployeeName
 from Employee e
 inner join Employee s
  on e.Superssn= s.SSN
  where s.Fname= 'Kamel'
  and s.Lname= 'Mohamed';
  ----Retrieve the names of employees and the names of the projects they work on, sorted by project name----
  select 
  e.Fname+'  '+ e.Lname as EmployeeName,
  p.Pname as ProjectName
  from Employee e
  inner join Works_for w
  on e.SSN = w.ESSn
  inner join Project p
  on w.Pno =p.Pnumber
  order by p. Pname;
 ---For each project located in Cairo, display the project number, controlling department name, manager's last name, address, and birthdate---
 select 
    p.Pnumber as ProjecNumber,
	d.Dname as DepartmentName,
	e.Lname as ManagerLastName,
	e.Address,
	e.Bdate
	  from Project p
	  inner join Departments d
	  on p.Dnum= d.Dnum
	  inner join Employee e
	  on d.MGRSSN= e.SSN
	  where p.City= 'Cairo';
	------Display all data of managers in the company----
	select distinct e.*
	from  Employee e
	inner join  Departments d 
	on e.SSN  = d.MGRSSN
	-----Display all employees and their dependents, even if some employees have no dependents---
	select 
	e.SSN,
	e.Fname +' '+ e.Lname as EmployeeName ,
	D.Dependent_name,
	d.Sex,
	d.Bdate 
	from Employee e
	Left join Dependent d 
	on e.SSN= d.ESSN;