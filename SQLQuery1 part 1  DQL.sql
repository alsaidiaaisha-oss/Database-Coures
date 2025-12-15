--DQL--
--Display all employee data----
select * from Employee;
--Display employee first name, last name, salary, and department number--
select Fname,Lname,Salary,Dno from Employee
--Display each employee’s full name and their annual commission (10% of annual salary) as ANNUAL_COMM.--
select Fname + ' ' + Lname as full_name ,
Salary * 12 * 0.10 as annual_comm from employee;
--Display employee ID and name for employees earning more than 1000 LE monthly--
select SSN as employee_ID, 
Fname + ' ' + Lname as employee_name from Employee 
where Salary > 1000;
--Display employee ID and name for employees earning more than 10000 LE annually--
select SSN as employee_ID, 
Fname + ' ' + Lname as employee_name from Employee 
where Salary > 10000;
--Display names and salaries of all female employees--
select Fname +' '+ Lname as employee_name, Salary from Employee where Sex ='f';
--Display employees whose salary is between 2000 and 5000--
select *from Employee where Salary between 2000 and 5000;
--Display employee names ordered by salary descending--
select Fname+ ' ' + Lname as employee_name from Employee 
order by Salary desc;
--Display the maximum, minimum, and average salary--
select  
Max(Salary)as Max_Salary,
Min(salary)as Min_Salary,
AVG(salary)as AVG_Salary
from employee;
-- Display the total number of employees--
select COunt(*) as total_employees from Employee;
--Display employees whose first name starts with 'A'
select * from Employee      
where Fname like 'A%';
-- Display employees who have no supervisor--
select * from Employee
where  Superssn is NULL;

-- Display employees hired after 2020--
no answer 


---DML--
-- Insert your personal data into the employee table (Department = 30, SSN = 102672, Superssn = 112233, Salary = 3000).--

insert into Employee (SSN,Salary,Superssn,Dno)values
 (102672,3000,112233,30);
 --. Insert another employee (your friend) in department 30 with SSN = 102660, leaving salary and supervisor number NULL--

 insert into Employee(Fname,Lname,SSN,Dno) values
 ('Moza','Saif',102660,30);
 --Update your salary by 20%--
 update Employee 
 set Salary = Salary * 1.20
 where SSN = 112233;
 --Increase salaries by 5% for all employees in department 30--
 update Employee
 set Salary = Salary  *1.05
 where Dno = 30;
 --Set commission to NULL for employees earning less than 2000.--
 --update Employee
 set Commission = NULL
 where Salary <2000;--
 -- Delete employees with NULL salary--
 delete from Employee
 where Salary is NULL; 