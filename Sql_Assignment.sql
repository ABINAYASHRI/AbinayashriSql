-- -------------------STUDENT INFORMATION SYSTEM--------------------------------------
-- -----------------------------------------------------------------------------------
-- ------------------TASK_1:"Database Design:" ---------------------------------------

-- Q1. Create the database named "SISDB"
CREATE DATABASE SISDB;
USE SISDB;

-- Q2. Define the schema for the Students, Courses, Enrollments, Teacher, and Payments tables with appropriate data types, constraints, and relationships.*/ 
-- Q4. Create appropriate Primary Key and Foreign Key constraints for referential integrity.

-- TABLE Students
CREATE TABLE Students(
student_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
date_of_birth DATE DEFAULT NULL,
email VARCHAR(50),
phone_number VARCHAR(15)
);

-- TABLE Teacher
CREATE TABLE Teacher(
teacher_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50)
);

-- TABLE Courses
CREATE TABLE Courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(50),
credits INT,
teacher_id INT,
FOREIGN KEY (teacher_id) references Teacher(teacher_id)
);

-- TABLE Enrollments
CREATE TABLE Enrollments(
 enrollment_id INT PRIMARY KEY,
 student_id INT,
 FOREIGN KEY (student_id) references Students(student_id),
 course_id INT,
 FOREIGN KEY (course_id) references Courses(course_id),
 enrollment_date DATE DEFAULT NULL
);

-- TABLE Payments
CREATE TABLE Payments(
payment_id INT PRIMARY KEY,
student_id INT,
FOREIGN KEY (student_id) references Students(student_id),
amount INT,
payment_date DATE DEFAULT NULL
);

-- Q5. Insert at least 10 sample records into each of the following tables.
INSERT INTO Students(student_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
(4001,'Abi', 'Arul', '2002-12-24', 'abi@email.com', '9876543210'),
(4002,'Bala', 'Murugan', '2000-10-04', 'bala@email.com', '8765432109'),
(4003,'Cathy', 'Carol', '2001-02-03', 'cathy@email.com', '7654321098'),
(4004,'David', 'Das', '2003-05-11', 'david@email.com', '6543210987'),
(4005,'Ezhil', 'Arasan', '2002-11-30', 'ezhil@email.com', '9966775544'),
(4006,'Fathima', 'Banu', '2002-08-22', 'fathima@email.com', '8877665522'),
(4007,'Gayathri', 'Nayar', '2000-07-07', 'gayu@email.com', '9922113388'),
(4008,'Harish', 'Kumar', '2001-04-05', 'hari@email.com', '7733885511'),
(4009,'Isha', 'Kapoor', '2001-01-20', 'isha@email.com', '8844559900'),
(4010,'Janaki', 'Raman', '2002-03-14', 'janu@email.com', '9966554422');

INSERT INTO Teacher (teacher_id, first_name, last_name, email) VALUES
(200,'Ramesh','Babu', 'ram@email.com'),
(201,'Elakiya','Vel','elakiya@email.com'),
(202,'Anand','Das','anand@email.com'),
(203,'Santha','Kumar','santha@email.com'),
(204,'Sudha','Chandru','sudha@email.com'),
(205,'Siva','Prakash','siva@email.com'),
(206,'Vimal','Raja', 'vimal@email.com'),
(207,'John','Williams','john@email.com'),
(208, 'Dayana','Joel','dyana@email.com'),
(209,'Ravi','Kumar','ravi@email.com');

INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
(01,'English', 3,201),
(02,'Maths',4,202),
(03,'Physics',4,203),
(04,'Chemistry',3,204),
(05,'EVS',2,205),
(06,'OOPS',4,206),
(07,'CN',3,207),
(08,'TOC',4,208),
(09,'DBMS',4,209),
(10,'OS',3,200);

INSERT INTO Enrollments(enrollment_id, student_id,course_id, enrollment_date) VALUES
(1,4001,01,'2020-01-22'),
(2,4002,02,'2020-02-11'),
(3,4003,03,'2021-03-12'),
(4,4004,04,'2021-04-09'),
(5,4005,05,'2022-05-04'),
(6,4006,06,'2022-06-11'),
(7,4007,07,'2023-07-04'),
(8,4008,08,'2023-08-14'),
(9,4009,09,'2022-09-03'),
(10,4010,10,'2022-10-23');

INSERT INTO Payments (payment_id, student_id, amount, payment_date) VALUES 
(1001, 4001, 5000, '2023-12-07'),
(1002, 4002, 3000, '2023-12-07'),
(1003, 4003, 7000, '2023-12-07'),
(1004, 4004, 2000, '2023-12-07'),
(1005, 4005, 9000, '2023-12-08'),
(1006, 4006, 1000, '2023-12-08'),
(1007, 4007, 10000, '2023-12-08'),
(1008, 4008, 4000, '2023-12-08'),
(1009, 4009, 6000, '2023-12-07'),
(1010, 4010, 8000, '2023-12-08');

-- -----------------------------------------------------------------------------------
-- ------------------ TASK_2:"Select, Where, Between, AND, LIKE:" ---------------------------------------

-- Q1. Write an SQL query to insert a new student into the "Students" table

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
(4011,'John','Doe','1995-08-15','john.doe@example.com','1234567890');

/*-- Q2. Write an SQL query to enroll a student in a course. Choose an existing student and course and 
insert a record into the "Enrollments" table with the enrollment date.*/

INSERT INTO Enrollments(enrollment_id, student_id,course_id, enrollment_date) VALUES
(11,4002,08,'2023-12-12');

/*-- Q3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and 
modify their email address. */

UPDATE Teacher SET email = 'ramesh@email.com' WHERE teacher_id = 200;

/*-- Q4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select 
an enrollment record based on the student and course.  */

DELETE FROM Enrollments WHERE student_id = 4002 AND enrollment_date = '2020-02-11';

/*-- Q5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and 
teacher from the respective tables. */

UPDATE Courses SET teacher_id = 208 WHERE course_id = 06;

/*-- Q6. Delete a specific student from the "Students" table and remove all their enrollment records 
from the "Enrollments" table. Be sure to maintain referential integrity. */


DELETE FROM Enrollments WHERE student_id = 4008;
DELETE FROM Payments WHERE student_id = 4008;
DELETE FROM Students WHERE student_id = 4008;

/*-- Q7. Update the payment amount for a specific payment record in the "Payments" table. Choose any 
payment record and modify the payment amount. */
-- (payment_id, student_id, amount, payment_date)
UPDATE Payments SET payment_id = 1011, payment_date = '2023-12-08', amount = 6666 WHERE student_id = 4010 and amount BETWEEN 1000 AND 10000;

-- -----------------------------------------------------------------------------------
-- ------------------ TASK_3:"Aggregate functions, Having, Order By, GroupBy and Joins: " ---------------------------------------
------------------------------------------------------------------------------------------

/*-- Q1. Write an SQL query to calculate the total payments made by a specific student. You will need to 
join the "Payments" table with the "Students" table based on the student's ID. */

SELECT S.student_id, Concat(S.first_name,' ', S.last_name) AS Student_Name, count(S.student_id) as total_count, Sum(P.amount) as Total_payment from Students as S join Payments as P 
ON S.student_id = P.student_id
WHERE S.student_id = 4002
GROUP BY S.student_id;

/*-- Q2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each 
course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.*/

SELECT course_name, count(student_id) AS Students_Enrolled FROM Courses C join Enrollments E
ON C.course_id = E.course_id
GROUP BY C.course_id;

/*-- Q3. Write an SQL query to find the names of students who have not enrolled in any course. Use a 
LEFT JOIN between the "Students" table and the "Enrollments" table to identify students 
without enrollments.*/ 

SELECT Concat(S.first_name,' ', S.last_name) AS Student_Name, E.enrollment_Date, E.enrollment_id
FROM Students S LEFT JOIN Enrollments E 
ON S.student_id = E.student_id
WHERE E.enrollment_id IS NULL;

/*-- Q4. Write an SQL query to retrieve the first name, last name of students, and the names of the 
courses they are enrolled in. Use JOIN operations between the "Students" table and the 
"Enrollments" and "Courses" tables.  */

SELECT S.first_name, S.last_name, C.course_name AS Course_Enrolled JOIN 
Students S JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C
ON E.course_id = C.course_id;

/*-- Q5. Create a query to list the names of teachers and the courses they are assigned to. Join the 
"Teacher" table with the "Courses" table. */

SELECT CONCAT(T.first_name,' ',T.last_name) AS Teacher_Name, C.course_name AS Assigned_to
JOIN Teacher T JOIN
Courses C ON T.teacher_id = C.teacher_id;

/*-- Q6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the 
"Students" table with the "Enrollments" and "Courses" tables.  */

SELECT CONCAT(S.first_name,' ',S.last_name) AS Student_Name, E.enrollment_Date, C.course_name
FROM Students S JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id;

/*-- Q7. Find the names of students who have not made any payments. Use a LEFT JOIN between the 
"Students" table and the "Payments" table and filter for students with NULL payment records.*/

SELECT CONCAT(S.first_name,' ',S.last_name) AS Students_with_No_Payments, P.amount FROM Students
LEFT JOIN Payments P ON S.student_id = P.student_id
WHERE P.amount IS NULL; 

/*-- Q8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN 
between the "Courses" table and the "Enrollments" table and filter for courses with NULL 
enrollment records. */

SELECT C.course_name FROM Courses C LEFT JOIN Enrollments E
ON C.course_id = E.course_id
WHERE E.enrollment_id IS NULL;

/*-- Q9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" 
table to find students with multiple enrollment records. */

SELECT E1.student_id AS Student_ID
FROM Enrollments E1
JOIN Enrollments E2 ON E1.student_id = E2.student_id AND E1.enrollment_id <> E2.enrollment_id
GROUP BY E1.student_id
HAVING COUNT(DISTINCT E1.enrollment_id) > 1;

/*-- Q10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" 
table and the "Courses" table and filter for teachers with NULL course assignments. */

SELECT CONCAT(T.first_name,' ',T.last_name) AS Teacher_Unassigned FROM Teacher T
LEFT JOIN Courses C ON T.teacher_id = C.teacher_id
WHERE C.course_id IS NULL;

-- -----------------------------------------------------------------------------------
-- ------------------ TASK_4:" Subquery and its type: " ---------------------------------------
------------------------------------------------------------------------------------------

/*--Q1. Write an SQL query to calculate the average number of students enrolled in each course. Use 
aggregate functions and subqueries to achieve this. */

SELECT AVG(StudCount) FROM (
    SELECT course_id, COUNT(DISTINCT student_id) AS StudCount
    FROM Enrollments
    GROUP BY course_id
) AS Squery

/*--Q2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum 
payment amount and then retrieve the student(s) associated with that amount. */

SELECT student_id, amount FROM Payments
WHERE amount = (SELECT MAX(amount) FROM Payments);

/*--Q3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the 
course(s) with the maximum enrollment count. */

SELECT course_id, enrollment_id FROM Enrollments WHERE course_id = (
    SELECT course_id FROM Enrollments
    GROUP BY course_id
    ORDER BY COUNT(course_id) DESC
    LIMIT 1
);

/*--Q4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum 
payments for each teacher's courses*/

SELECT student_id, total_payments FROM (
    SELECT student_id, SUM(amount) AS total_payments
    FROM Payments
    GROUP BY student_id
) AS Squery;

/**-- Q5. Identify students who are enrolled in all available courses. Use subqueries to compare a 
student's enrollments with the total number of courses. */

SELECT student_id FROM Enrollments
GROUP BY student_id
HAVING COUNT(DISTINCT course_id) = (SELECT COUNT(DISTINCT course_id) FROM Courses);

/*-- Q6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to 
find teachers with no course assignments. */

SELECT teacher_id, first_name FROM Teacher
WHERE teacher_id NOT IN (SELECT teacher_id from courses)

/*-- Q7. Calculate the average age of all students. Use subqueries to calculate the age of each student 
based on their date of birth. */

SELECT avg(StudentAge) FROM (SELECT student_id,first_name,date_of_birth,year(curdate())-year(date_of_birth) AS StudentAge FROM students)AS Squery ;

/*-- Q8. Identify courses with no enrollments. Use subqueries to find courses without enrollment 
records. */

SELECT course_id,course_name FROM Courses
WHERE course_id NOT In (SELECT course_id FROM Enrollments);

/*-- Q9. Calculate the total payments made by each student for each course they are enrolled in. Use 
subqueries and aggregate functions to sum payments. */

SELECT student_id, total_payment 
FROM (SELECT student_id,sum(amount) AS total_payment FROM Payments 
        group by student_id
        )AS Squery ;

/*-- Q10. Identify students who have made more than one payment. Use subqueries and aggregate 
functions to count payments per student and filter for those with counts greater than one.*/

SELECT student_id FROM (SELECT student_id from payments 
GROUP BY student_id
HAVING COUNT(student_id) >1) AS Squery;

/*-- Q11. Write an SQL query to calculate the total payments made by each student. Join the "Students" 
table with the "Payments" table and use GROUP BY to calculate the sum of payments for each 
student.*/

SELECT S.student_id, Sum(P.amount) AS Total_Payments FROM Students S JOIN Payments P
ON S.student_id = P.student_id
GROUP BY P.student_id;

/*-- Q12. Retrieve a list of course names along with the count of students enrolled in each course. Use 
JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to 
count enrollments. */

SELECT C.course_name, Count(E.student_id) FROM Courses C 
JOIN Enrollments E On C.course_id = E.course_id
GROUP BY C.course_id;

/*-- Q13.  Calculate the average payment amount made by students. Use JOIN operations between the 
"Students" table and the "Payments" table and GROUP BY to calculate the average.*/

SELECT AVG(Total) FROM (
    SELECT SUM(P.amount) AS Total from Payments P JOIN Students S 
    ON P.student_id = S.student_id
    GROUP BY P.student_id) AS Squery;

-------------------------------------------------------------------------------------------------------------------------------------	