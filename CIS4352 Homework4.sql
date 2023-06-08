-- Question 1
STUDENT TABLE
[StudentID, StudentName, StudentPhoneNo.]

CREATE TABLE Student(
StudentID INT NOT NULL,
StudentName NVARCHAR(100) NOT NULL,
StudentPhoneNo NVARCHAR(50) NOT NULL,
PRIMARY KEY (StudentID)
);
INSERT INTO Student
(StudentID, StudentName, StudentPhoneNo)
VALUES
(10021, 'John', '215-323-8763'),
(20035, 'Olivia', '245-346-0297');


COURSE TABLE
[CourseID, CourseName]

CREATE TABLE Courses(
CourseID INT NOT NULL,
CourseName NVARCHAR(100) NOT NULL,
PRIMARY KEY (CourseID)
);
INSERT INTO Courses
(CourseID, CourseName)
VALUES
(101, 'C Programming'),
(201, 'SQL');


STUDENT & COURSE COMBINED
[CourseID, StudentID, Semester, Grade]

CREATE TABLE StudentSchedule(
CourseID INT NOT NULL,
StudentID INT NOT NULL,
Semester NVARCHAR(75) NOT NULL,
Grade NVARCHAR(10) NOT NULL,
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
INSERT INTO StudentSchedule
(CourseID, StudentID, Semester, Grade)
VALUES 
('101', '10021', 'Fall2019', 'B'),
('101', '20035', 'Fall2020', 'A'),
('201', '20035', 'Spring2020', 'B');

-- Question 2
CREATE INDEX idx_lastname ON Person.Person (LastName);

-- Question 3
DROP INDEX Person.Person.idx_lastname;

-- Question 4
CREATE VIEW [Employees with Last Name Starts with 'M'] AS
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE PersonType = 'EM' AND LastName LIKE 'M%';

-- Question 5
DROP VIEW [Employees with Last Name Starts with 'M'];

-- Question 6
CREATE VIEW [Question 6] 
WITH SCHEMABINDING
AS
SELECT Person.BusinessEntityID, FirstName, MiddleName, LastName, AddressID
FROM Person.Person
INNER JOIN Person.BusinessEntityAddress
ON Person.BusinessEntityID = BusinessEntityAddress.BusinessEntityID;

-- Question 7
CREATE UNIQUE CLUSTERED INDEX Question7
ON [Question 6](BusinessEntityID, AddressID);

-- Question 8
USE Homework4
GO

CREATE TABLE Student(
StudentID INT NOT NULL,
StudentName NVARCHAR(100) NOT NULL,
StudentPhoneNo NVARCHAR(50) NOT NULL,
PRIMARY KEY (StudentID)
);
INSERT INTO Student
(StudentID, StudentName, StudentPhoneNo)
VALUES
(10021, 'John', '215-323-8763'),
(20035, 'Olivia', '245-346-0297');
GO

CREATE TABLE Courses(
CourseID INT NOT NULL,
CourseName NVARCHAR(100) NOT NULL,
PRIMARY KEY (CourseID)
);
INSERT INTO Courses
(CourseID, CourseName)
VALUES
(101, 'C Programming'),
(201, 'SQL');
GO

CREATE TABLE StudentSchedule(
CourseID INT NOT NULL,
StudentID INT NOT NULL,
Semester NVARCHAR(75) NOT NULL,
Grade NVARCHAR(10) NOT NULL,
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
INSERT INTO StudentSchedule
(CourseID, StudentID, Semester, Grade)
VALUES 
('101', '10021', 'Fall2019', 'B'),
('101', '20035', 'Fall2020', 'A'),
('201', '20035', 'Spring2020', 'B');
GO

USE AdventureWorks2019
GO

CREATE INDEX idx_lastname ON Person.Person (LastName);
GO
DROP INDEX Person.Person.idx_lastname;
GO

CREATE VIEW [Employees with Last Name Starts with 'M'] AS
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE PersonType = 'EM' AND LastName LIKE 'M%';
GO

DROP VIEW [Employees with Last Name Starts with 'M'];
GO

CREATE VIEW [Question 6] 
WITH SCHEMABINDING
AS
SELECT Person.BusinessEntityID, FirstName, MiddleName, LastName, AddressID
FROM Person.Person
INNER JOIN Person.BusinessEntityAddress
ON Person.BusinessEntityID = BusinessEntityAddress.BusinessEntityID;
GO

CREATE UNIQUE CLUSTERED INDEX Question7
ON [Question 6](BusinessEntityID, AddressID);
GO
