select * from Student
select * from Coures
select * from departnent
select * from Exams
select * from Faculty
select * from Hotel
select * from Student_subj
select * from subj
--Display the department ID, name, and the full name of the faculty managing it.----SELECT 
  select 
  d.D_id   AS Department_ID,
    d.D_name AS Department_Name,
    f.name   AS Faculty_Manager
FROM departnent d
LEFT JOIN Faculty f
    ON d.F_id = f.F_id;
-----Display each program's name and the name of the department offering it.----

alter table coures
add D_id int;

ALTER TABLE Coures
ADD CONSTRAINT FK_Coures_Department
FOREIGN KEY (D_id)
REFERENCES departnent(D_id);

UPDATE Coures SET D_id = 1 WHERE coures_id = 1;
UPDATE Coures SET D_id = 2 WHERE coures_id = 2;
UPDATE Coures SET D_id = 1 WHERE coures_id = 3;

SELECT 
    c.coures_name AS Program_Name,
    d.D_name      AS Department_Name
FROM Coures c
JOIN departnent d
    ON c.D_id = d.D_id;

------Display the full student data and the full name of their faculty advisor----
select 
s.S_id,
s.Fname,
s.Lname,
s.phone_no,
s.DOB,
f. name as faculty_advisor 
 from Student s
 left join Faculty f
 on s.F_id = f.F_id;
 ---Display class IDs, course titles, and room locations for classes in buildings 'A' or 'B'----

 select 
 e.exam_code as Class_ID,
 c.coures_name as Course_titles,
e.Room as Room_locations
from Exams e
left join student s 
 on e.S_id = s.S_id
 join Coures c
 on s.S_id = c.S_id
 where e.Room in ('Room A', 'Room B');
 -----Display full data about courses whose titles start with "I" (e.g., "Introduction to...")---
SELECT *
FROM dbo.Coures
WHERE coures_name LIKE 'I%';
SELECT c.*
FROM dbo.Coures c
JOIN dbo.departnent d
    ON c.D_id = d.D_id
WHERE c.coures_name LIKE 'I%';
------Display names of students in program ID 3 whose GPA is between 2.5 and 3.5----
-----Retrieve student names in the Engineering program who earned grades ≥ 90 in the "Database" course----
select
 s.Fname,
 s.Lname
 from Student s
 join Coures c
 on s.S_id = c.S_Id
 join departnent d
 on c.D_id = d.D_id
 join Exams g 
 on s.S_id = g.S_id
 where d.D_name = ' Engineering'
 and c.coures_name ='Database'
 and g.mark >=90;
 ----------------------------------------------------------
 ---
 ---Find names of students who are advised by "Dr. Ahmed Hassan"---
select
    s.Fname,
    s.Lname
from Student s
join Faculty f
    on s.F_id = f.F_id
where f.name = 'Dr. Ahmed Hassan';
-----------------------
----
---Retrieve each student's name and the titles of courses they are enrolled in, ordered by course title-----
select s.Fname, s.Lname, c.coures_name
from Student s
join Coures c ON s.S_id = c.S_id
ORDER BY c.coures_name;
--For each class in Building 'Main', retrieve class ID, course name, department name, and faculty name teaching the class.----
select e.exam_code, c.coures_name, d.D_name, f.name
from Exams e
join Student s ON e.S_id = s.S_id
Join Coures c ON s.S_id = c.S_id
Join departnent d ON c.D_id = d.D_id
Join Faculty f ON d.F_id = f.F_id
WHERE e.Room = 'Main';

-----Display all faculty members who manage any department----

select distinct  f.name
from Faculty f
Join departnent d
ON f.F_id = d.F_id;


--Display all students and their advisors' names, even if some students don’t have advisors yet-----
select  s.Fname, s.Lname, f.name
from Student s
left join Faculty f
on s.F_id = f.F_id;

