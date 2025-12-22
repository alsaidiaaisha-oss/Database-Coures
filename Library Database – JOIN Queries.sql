select * from book
select * from library
select * from loan
select * from member
select * from payment
select * from review
select * from staff
--------------------------------------------------------------------
--Display library ID, name, and the name of the manager.-----
SELECT 
    l.library_id,
    l.name AS Library_Name,
    s.fullname AS Manager_Name
FROM Library l
JOIN Staff s
    ON l.library_id = s.libraryid
WHERE s.position = 'Librarian';
----Display library names and the books available in each one.---
select 
    l.name  AS Library_Name,
    b.title AS Book_Title
from Library l
join  Book b
    on l.library_id = b.libraryid
where  b.is_available = 1;
---Display all member data along with their loan history.-----
select
    m.memberid,
    m.fullname,
    m.emaill,
    m.phoneno,
    m.startdate,
    l.loanid,
    l.loandate,
    l.duedate,
    l.returndate,
    l.status,
    l.bookid
from Member m
left  join Loan l
    on m.memberid = l.memberid;
------Display all books located in 'Zamalek' or 'Downtown'------
select 
    b.bookid,
    b.title,
    l.location
from Book b
join Library l
    on b.libraryid = l.library_id
where l.location IN ('Zamalek', 'Downtown');
-----------------------------------------------------------------
--Display all books whose titles start with 'T'------

SELECT *
FROM Book
WHERE Title LIKE 'T%';
-------------------------------
-----List members who borrowed books priced between 100 and 300 LE----
select distinct  m.MemberID, m.FullName
from Loan l
join Member m ON l.MemberID = m.MemberID
join Book b on l.BookID = b.BookID
WHERE b.Price BETWEEN 100 AND 300;

----------Retrieve members who borrowed and returned books titled 'The Alchemist'---
SELECT DISTINCT m.MemberID, m.FullName
FROM Loan l
JOIN Member m ON l.MemberID = m.MemberID
JOIN Book b ON l.BookID = b.BookID
WHERE b.Title = 'The Alchemist'
  AND l.ReturnDate IS NOT NULL;
  ----------
 ------ Find all members assisted by librarian "Sarah Fathy"-----
SELECT DISTINCT m.MemberID, m.FullName
FROM Member m
JOIN Loan l ON m.MemberID = l.MemberID
JOIN Staff s ON l.StaffID = s.StaffID
WHERE s.FullName = 'Sarah Fathy';
----------------------------------------------
---Display each member’s name and the books they borrowed, ordered by book title----
SELECT 
    m.fullname AS MemberName,
    b.Title AS BookTitle
FROM 
    Member m
JOIN 
    Loan l ON m.MemberID = l.MemberID
JOIN 
    Book b ON l.BookID = b.BookID
ORDER BY 
    b.Title;
	-----For each book located in 'Cairo Branch', show title, library name, manager, and shelf info-----
SELECT 
    b.Title AS BookTitle,
    l.Name AS LibraryName,
    l.name AS ManagerName,
    b.shelflocation
FROM 
    Book b
JOIN 
    Library l ON b.LibraryID = l.library_id
WHERE 
    l.Name = 'Cairo Branch';

	--------------------------------------
	----Display all staff members who manage libraries.---


SELECT 
    s.StaffID,
    s.fullname AS StaffName,
    s.position
FROM 
    Staff s
JOIN 
    Library l ON s.StaffID = l.library_id;
	----Display all members and their reviews, even if some didn’t submit any review yet----
SELECT 
    m.MemberID,
    m.fullname AS MemberName,
    r.ReviewID,
    r.BookID,
    r.Rating,
    r.Comments
FROM 
    Member m
LEFT JOIN 
    Review r ON m.MemberID = r.MemberID
ORDER BY 
    m.fullname;
