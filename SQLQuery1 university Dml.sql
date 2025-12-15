create database University
use University;

create table Faculty(
 F_id int primary key identity(1,1),
 name varchar(20) not null ,
 mobile_no int,
 Salary int,
 );

 create table Student(
 S_id int primary key,
 Fname varchar(20) not null,
 Lname varchar(20) not null,
 phone_no int not null,
 DOB date,
 F_id int,
  foreign key(F_id) references Faculty(F_id)
 );

 create table Hotel(
 hotel_id int primary key,
 loc varchar(20),
  Pin_code int,
  No_of_seate int,
  S_id int,
   foreign key(S_id) references Student(S_id)
  );

  create table Coures(
   coures_id int,
   coures_name varchar(20),
   Duration varchar(20),
   S_id int,
     foreign key(S_id) references Student(S_id)

   );

  create table subj (
  subje_id int ,
  subj_name varchar(20)
  );

  create table Exams(
  exam_code int,
  D_date date,
  Room varchar (20),
     S_id int ,
	     foreign key(S_id) references Student(S_id)
);


  create  table departnent(
  D_id int primary key ,
  D_name varchar(20),
   F_id int,
      foreign key(F_id) references Faculty(F_id)

  );

  create table Student_subj(
   subje_id int,
   S_id int,
   Primary key (subje_id,S_id),
   Foreign key (subje_id) references subj(subje_id),
   Foreign key (S_id) references Student(S_id)

  );
  -------------------------------------------------------------------
  ALTER TABLE subj
ADD CONSTRAINT PK_subj PRIMARY KEY (subje_id);-------------- how to add primay key in subj table
ALTER TABLE subj
ALTER COLUMN subje_id INT NOT NULL;
SELECT *
FROM subj
WHERE subje_id IS NULL;
UPDATE subj
SET subje_id = 1
WHERE subje_id IS NULL;
select *from subj



  --DML--
  select * from Student_subj
  -------------------------------------
  insert into Faculty (name,mobile_no,Salary)values
('Shahad',99999999,2000),
('Omar',123456987,3000),
('fatam',23265495,234),
('Moza',16785426,5000);


----------------------------

  insert into Student(S_id,Fname,Lname,phone_no,DOB)values
(1,'Shahad','ahmed', 9598795,'2-4-2025'),
(2,'Omar','Ali', 9561234,'7-8-2025'),
(3,'fatam','nasear', 9564123,'9-9-2025'),
(4,'Moza','ahmed', 1-3-2025,'3-5-2025');

--------------------------------------------------------

 insert into Hotel(hotel_id,loc,Pin_code,No_of_seate,S_id)values
(1, 'Muscat', '100', 120, 1),
(2, 'Salalah', '211', 80, 2),
(3, 'Nizwa', '611', 60, 3);

-------------------------------------------------

insert into Coures(coures_id,coures_name,Duration,S_id)values 
(1, 'Database Systems', 4, 1),
(2, 'Web Development', 3, 2),
(3, 'Operating Systems', 5, 3);
-----------------------------------------------------------------
insert into subj(subje_id,subj_name)values
(1, 'Mathematics'),
(2, 'Database'),
(3, 'Networking'),
(4, 'Operating Systems');
-----------------------------------------------------

insert into Exams(exam_code,D_date,Room,S_id) values

(101, '2025-06-15', 'Room A', 1),
(102, '2025-06-20', 'Room B', 2),
(103, '2025-06-25', 'Room C', 3);
----------------------------------------------------
insert into departnent(D_id,D_name)values
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Business Administration');

ALTER TABLE departnent
ALTER COLUMN D_name VARCHAR(50);
----------------------------------------------------
insert into Student_subj(subje_id,S_id)values
(1, 1),
(2, 1),
(1, 2),
(3, 3);