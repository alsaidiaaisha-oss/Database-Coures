select * from Booking
select * from Branches
select * from Customer
select * from Rooms
select * from Staff

----------------------------------------------------
---Display hotel ID, name, and the name of its manager.----
select
    b.Branch_ID,
	    b.Name,
    s.name AS manager_name
FROM Branches b
JOIN Staff s
    ON b.Branch_ID = s.Staff_ID;
	----------
---Display guest data along with the bookings they made.----
select
    c.Cust_ID,
    c.Name,
    b.booking_id,
    b.Booking_ID,
    b.Check_in,
	b.Check_out

FROM Customer c
JOIN Booking b
    ON c.Cust_ID = b.Cust_ID

	--------
------Display bookings for hotels in 'Hurghada' or 'Sharm El Sheikh'.---
select 
    b.Booking_ID,
    c.Name,
    br.Name,
    br.Location,
    r.Room_Number,
    r.type,
    b.check_in,
    b.check_out
FROM 
    Booking b
JOIN 
   Customer c ON b.Cust_ID = c.Cust_ID
JOIN 
    Branches br ON b.Booking_ID = br.branch_ID 
JOIN 
    Rooms r ON b.Booking_ID = r.Room_Number
WHERE 
    br.Location IN ('Muscat', 'Salalah')
-----------------------------------------------------
--Display all room records where room type starts with "S" (e.g., "Suite", "Single")-----
select
    r.Room_Number,
    r.type as room_type,
    br.Name,
    br.Location,
    b.booking_id,
    c.name as customerName,
    b.check_in,
    b.check_out
FROM 
    Rooms r
JOIN 
    Branches br ON r.branch_id = br.branch_id
LEFT JOIN 
    Booking b ON r.Branch_ID = b.Cust_ID
LEFT JOIN 
    Customer c ON b.Cust_ID = c.Cust_ID
WHERE 
    r.type LIKE 'S%'
ORDER BY 
    br.Location, r.room_number;
------------------------------------
---List guests who booked rooms priced between 1500 and 2500 LE-------

select
    c.Cust_ID,
    r.room_number,
    r.Type,
    r.Nightly_Rate,
    br.Name,
    br.Location,
    b.check_in,
    b.check_out
FROM 
    Booking b
JOIN 
    Customer c ON b.Cust_ID = c.Cust_ID
JOIN 
    Rooms r ON b.Booking_ID = r.Branch_ID
JOIN 
    Branches br ON b.Booking_ID = br.branch_id
WHERE 
    r.Nightly_Rate BETWEEN 1500 AND 2500
------------------------------------------------

----Retrieve guest names who have bookings marked as 'Confirmed' in hotel "Hilton Downtown"----
select
    c.Name
FROM 
    Booking b
JOIN 
    Customer c ON b.Cust_ID =c.Cust_ID
JOIN 
    Branches br ON b.Booking_ID = br.Branch_ID
---WHERE 
   --- b.status = 'Confirmed'
   --- AND br.branch_name = 'Hilton Downtown'
---------------------------------------------------------
---Find guests whose bookings were handled by staff member "Mona Ali"---

select
    c.Name
FROM 
    Booking b
JOIN 
    Customer c
	ON b.Cust_ID = c.Cust_ID
JOIN 
    Staff s 
	ON b.Booking_ID = s.Staff_ID
WHERE 
    s.Name = 'Ahmed Ali '
----------------------------------
----Display each guest’s name and the rooms they booked, ordered by room type------

   select
    c.Name AS Guest_Name,
    r.Room_Number,
    r.Type
FROM 
    Booking b
JOIN 
    Customer c ON b.Cust_ID = c.Cust_ID
JOIN 
    Rooms r ON b.Booking_ID = r.Room_Number


------------------
----For each hotel in 'Cairo', display hotel ID, name, manager name, and contact info----
select
    br.Branch_ID AS Hotel_ID,
  
    s.Name AS Manager_Name
  
FROM 
    Branches br
	join  
	Staff s ON br.Branch_ID = s.Staff_ID
WHERE 
   Location = 'Muscat'

---------------------------------------
----Display all staff members who hold 'Manager' positions.----
select 
    s.Staff_ID,
    s.Name,
    s.Job_Title as positions,
   
    br.Name AS Branch_Name,
    br.Location Branch_City
FROM 
    Staff s
JOIN 
    Branches br ON s.Staff_ID = br.Branch_ID
WHERE 
    s.Job_Title = 'Manager'
	------------------------------------------------
----Display all guests and their reviews, even if some guests haven't submitted any reviews.--------------

select
    c.Cust_ID,
    c.Name AS Guest_Name,
    r.Nightly_Rate
FROM 
    Customer c
LEFT JOIN 
    Rooms r ON c.Cust_ID = r.Branch_ID

