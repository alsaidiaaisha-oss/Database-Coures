create Database OnlineLearning
  use  OnlineLearning

  CREATE TABLE Instructors (
InstructorID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
JoinDate DATE
);

CREATE TABLE Categories (
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(50));

CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
Title VARCHAR(100),
InstructorID INT,
CategoryID INT,
Price DECIMAL(6,2),
PublishDate DATE,
FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID),
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Students (
StudentID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
JoinDate DATE
);

CREATE TABLE Enrollments (
EnrollmentID INT PRIMARY KEY,
StudentID INT,
CourseID INT,
EnrollDate DATE,
CompletionPercent INT,
Rating INT CHECK (Rating BETWEEN 1 AND 5),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Instructors VALUES
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'),
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21');

INSERT INTO Categories VALUES
(1, 'Web Development'),
(2, 'Data Science'),
(3, 'Business');

INSERT INTO Courses VALUES
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'),
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'),
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'),
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01');

INSERT INTO Students VALUES
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'),
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'),
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10');

INSERT INTO Enrollments VALUES
(1, 201, 101, '2023-04-10', 100, 5),
(2, 202, 102, '2023-04-15', 80, 4),
(3, 203, 101, '2023-04-20', 90, 4),
(4, 201, 102, '2023-04-22', 50, 3),
(5, 202, 103, '2023-04-25', 70, 4),
(6, 203, 104, '2023-04-28', 30, 2),
(7, 201, 104, '2023-05-01', 60, 3);
---Display all courses with prices.-----
SELECT Title , Price
FROM Courses;
---Display all students with join dates----
select *from Students
SELECT FullName, joinDate
FROM Students;
---Show all enrollments with completion percent and rating. 
select *from Enrollments; 
select enrollmentID, completionPercent ,rating
from Enrollments;
---Count instructors who joined in 2023---
select count(JoinDate)
from instructors;
---Count students who joined in April 2023.----
select * from instructors
SELECT COUNT(*) AS StudentCount
FROM Students
WHERE YEAR(JoinDate) = 2023 AND MONTH(JoinDate) = 4;
----Part 2: Beginner Aggregation----
---Count total number of students---
select * from Students
select count(*) as totalStudents
 from Students
 --Count total number of enrollments.--
 select * from enrollments

 select count(*) as totalenrollments
 from enrollments
 ---Find average rating per course----
 select * from Courses
 select Avg(Rating)
 from   enrollments
 ----Count courses per instructor--
  select * from courses
    select * from Instructors
select count(CourseID),InstructorID 
  from Courses
  group by InstructorID 
  ---Count courses per category.----
  select * from courses
  select  CategoryID , count(CourseID)as CourseCount
  from Courses
  group by CategoryID
  ----Count students enrolled in each course---
  select *from Enrollments
   select  StudentID , count(CourseID)as StudentCount
  from Enrollments
  group by StudentID
  ----Find average course price per category. ----
  select *from Courses;

 SELECT CategoryID, AVG(Price) AS AvgPrice
FROM Courses
GROUP BY CategoryID;
----Find maximum course price.-----
select max(Price) as CoursePrice
from Courses
----Find min, max, and average rating per course-----
 select *from Enrollments
 select max(Rating) as MaxRating,min(Rating)MinRating,
 Avg(Rating)as AVGRating
 from Enrollments
 ---. Count how many students gave rating = 5.---
 select count(*) as StudentGaveRating
 from Enrollments
 where Rating=5
 -------Part 3: Extended Beginner Practice ---
 --- Count enrollments per month.----
select count(*) as EnrollmentCount, year(EnrollDate) as year , Month(EnrollDate) as month 
from Enrollments
group by year(EnrollDate), MONTH(EnrollDate)
---- Find average course price overall.-----
 select *from Courses
 select AVG(Price) as AvgPricecoures
 from Courses

 -- Count students per join month.---
 SELECT MONTH(JoinDate) AS Month, COUNT(*) AS StudentCount
FROM Students
GROUP BY  MONTH(JoinDate)
---- Count ratings per value (1–5).--
 select count(*) as Value , Rating
 from Enrollments
 group by Rating
having  Rating in ( 1,5)
--- Find courses that never received rating = 5. -------

select * from Enrollments
SELECT CourseID
FROM Enrollments
GROUP BY CourseID
HAVING MAX(Rating) < 5;
-----Count courses priced above 30----

select * from Courses
SELECT COUNT(*) AS CourseCount
FROM Courses
WHERE Price > 30;
---- Find average completion percentage-----

SELECT AVG(Price) AS AvgCompletion
FROM Courses;
-----. Find course with lowest average rating-----
SELECT CourseID, AVG(Rating) AS AvgRating
FROM Enrollments
GROUP BY CourseID
HAVING MIN(Rating) < 1;
 ---Course title + instructor name + enrollments---

select*from Courses
select*from Instructors
select*from enrollments

SELECT 
    c.Title,
    i.FullName,
    COUNT(e.CourseID) AS TotalEnrollments
FROM Courses c
JOIN Instructors i
    ON c.InstructorID = i.InstructorID
LEFT JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.Title, i.FullName;
----Category name + total courses + average price.----
SELECT 
    cat.CategoryName,
    COUNT(c.CourseID) AS TotalCourses,   -- Aggregation: count of courses
    AVG(c.Price) AS AvgPrice             -- Aggregation: average price
FROM Categories cat
JOIN Courses c                          -- JOIN: connect categories to courses
    ON cat.CategoryID = c.CategoryID
GROUP BY cat.CategoryName;              -- Group by to aggregate per category
--- Instructor name + average course rating. ----
SELECT 
    i.FullName,
    AVG(e.Rating) AS AvgRating
FROM Instructors i
JOIN Courses c
    ON i.InstructorID = c.InstructorID
LEFT JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY i.FullName;
----Student name + total courses enrolled. -----
select * from Students
SELECT 
    s.FullName,
    COUNT(e.CourseID) AS TotalEnrollments
FROM Students s
LEFT JOIN Enrollments e
    ON s.StudentID = e.StudentID
GROUP BY s.FullName;
----Category name + total enrollments.----
    
SELECT 
    cat.CategoryName,
    COUNT(e.CourseID) AS TotalEnrollments
FROM Categories cat
JOIN Courses c
    ON cat.CategoryID = c.CategoryID
LEFT JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY cat.CategoryName;
---Instructor name + total revenue.----

SELECT 
    i.FullName,
    SUM(c.Price) AS TotalRevenue
FROM Instructors i
JOIN Courses c
    ON i.InstructorID = c.InstructorID
JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY i.FullName;
---Course title + % of students completed 100%---
---------Part 5: HAVING Practice---
----Courses with more than 2 enrollments. -----

SELECT CourseID, COUNT(*) AS TotalEnrollments
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(*) > 2;
----nstructors with average rating above 4.----
select * from Enrollments
SELECT EnrollmentID, AVG(Rating) AS AvgRating
FROM Enrollments
GROUP BY EnrollmentID
HAVING AVG(Rating) > 4;
----Courses with average completion below 60%----
SELECT CourseID, AVG(CompletionPercent) AS AvgCompletion
FROM Enrollments
GROUP BY CourseID
HAVING AVG(CompletionPercent) < 60;
----Categories with more than 1 course.----
SELECT CategoryID, COUNT(*) AS TotalCourses
FROM Courses
GROUP BY CategoryID
HAVING COUNT(*) > 1;
---Students enrolled in at least 2 courses----
SELECT StudentID, COUNT(*) AS TotalCourses
FROM Enrollments
GROUP BY StudentID
HAVING COUNT(*) >= 2;
----Best performing course.----
----Part 6: Analytical Thinking-----
select *from Courses
select *from Enrollments
SELECT  c.Title, AVG(e.Rating) AS AvgRating
FROM Courses c
JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.Title
----- Instructor to promote. ---
SELECT 
    i.FullName, 
    AVG(e.Rating) AS AvgRating
FROM Instructors i
JOIN Courses c 
    ON i.InstructorID = c.InstructorID
JOIN Enrollments e 
    ON c.CourseID = e.CourseID
GROUP BY i.FullName
ORDER BY AvgRating DESC;

select *from Enrollments
select *from Instructors
----Highest revenue category.----
SELECT 
    cat.CategoryName,
    SUM(c.Price) AS Revenue
FROM Categories cat
JOIN Courses c
    ON cat.CategoryID = c.CategoryID
JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY cat.CategoryName
ORDER BY Revenue DESC
---Do expensive courses have better ratings-----

SELECT 
    Title,
    Price,
    AVG(Rating) AS AvgRating
FROM Enrollments e
JOIN Courses c
    ON e.CourseID = c.CourseID
GROUP BY Title, Price
ORDER BY Price DESC;
-----Do cheaper courses have higher completion?---

SELECT 
    Title,
    Price,
    AVG(CompletionPercent) AS AvgCompletion
FROM Enrollments e
JOIN Courses c
    ON e.CourseID = c.CourseID
GROUP BY Title, Price
ORDER BY Price ASC;
----Top 3 courses by revenue.----
SELECT 
    c.Title,
    SUM(c.Price) AS Revenue
FROM Courses c
JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.Title
ORDER BY Revenue DESC
----Instructor with most enrollments---










