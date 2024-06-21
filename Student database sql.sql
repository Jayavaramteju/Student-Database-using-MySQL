CREATE database teju;
use teju;

CREATE TABLE Students (StudentID INT PRIMARY KEY,StudentName VARCHAR(100) NOT NULL,Age INT,Address VARCHAR(255));

CREATE TABLE Courses (CourseID INT PRIMARY KEY,CourseName VARCHAR(100) NOT NULL,Credits INT);

CREATE TABLE Enrollment (EnrollmentID INT PRIMARY KEY,StudentID INT,CourseID INT,EnrollmentDate DATE,FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID));


INSERT INTO Students (StudentID, StudentName, Age, Address)
VALUES (1, 'Tejaswini', 24, 'Nandyal'),
       (2, 'Ganesh', 23, 'Kurnool'),
       (3, 'Poojitha', 22, 'Hyderabad'),
       (4, 'Navya', 21, 'Banglore');
desc students;
       

INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES (101, 'Introduction to SQL', 5),
       (102, 'Python', 4),
       (103, 'Web Developement', 3),
       (104, 'Amazon Web Services', 6);
desc Courses;

INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES (1, 1, 101, '2023-06-26'),
       (2, 2, 102, '2024-06-22'),
       (3, 3, 103, '2024-04-24'),
       (4, 4, 104, '2023-09-22');
desc Enrollment;

-- 1.Retrieve all students:
SELECT * FROM Students;
select * from Courses;
select * from Enrollment;

-- 2.Retrieve student details with a specific StudentID,course name:
SELECT * FROM Students WHERE StudentID = 1;
SELECT * FROM Courses WHERE courseName = "python";

-- 3.Retrieve students enrolled in a specific course:
SELECT s.StudentID, s.StudentName
FROM Students s
JOIN Enrollment e ON s.StudentID = e.StudentID
WHERE e.CourseID = 103;

-- 4.Count the number of courses each student is enrolled in:
SELECT s.StudentID, s.StudentName, COUNT(e.CourseID) AS CoursesEnrolled
FROM Students s
LEFT JOIN Enrollment e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.StudentName;

-- 5.Update student information:
UPDATE Students
SET Age = 22
WHERE StudentID = 1;

-- 6.Delete a student record:
DELETE FROM Students
WHERE StudentID = 2;

-- 7.Query to retrieve student information along with enrolled courses:
SELECT s.StudentID, s.StudentName, s.Age, s.Address, c.CourseID, c.CourseName
FROM Students s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;






