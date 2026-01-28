-- Part1 : 1NF 

CREATE TABLE Raw_data(
  Student_ID VARCHAR(10) PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100),
  Major VARCHAR(50),
  MajorHead VARCHAR(50),
  CourseID VARCHAR(100),
  CourseTitle VARCHAR(100),
  Credits INT,
  Grade VARCHAR(5),
  Building VARCHAR(50),
  Room INT
);

INSERT INTO raw_data 
VALUES
    ('S101' , 'Alice' , 'alice@uni.edu' , 'CS' , 'Dr.Smith' , 'CS301' , 'Linear Algebra', 4, 'A' , 'Math Wing' , 201 ),
    ('S101' , 'Alice' , 'alice@uni.edu' , 'CS' , 'Dr.Smith' , 'MATH201' , 'Linear Algebra', 3, 'B' , 'Math Wing' , 101 ),
    ('S102'  , 'Bob' , 'bob@uni.edu' , 'CS' , 'Dr.Smith' , 'CS301' , 'Algorithms' , 4, 'C', 'Science', 205),
    ('S103', 'Carol', 'carol@uni.edu', 'Physics', 'Dr.Lee', 'PHYS101' , 'Mechanics' , 4 , 'A' , 'Science', 301 ),
    ('S103', 'Carol', 'carol@uni.edu', 'Physics', 'Dr.Lee', 'PHYS101' , 'Mechanics' , 4 , 'A' , 'Science', 301 );

-- PART2 : 2NF 

CREATE TABLE Student (
    StudentID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100)
);
INSERT INTO Student (StudentID, Name, Email) VALUES
    ('S101', 'Alice', 'alice@uni.edu'),
    ('S102', 'Bob', 'bob@uni.edu'),
    ('S103', 'Carol', 'carol@uni.edu');


CREATE TABLE Course (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseTitle VARCHAR(50),
    Credits INT,
    Building VARCHAR(50),
    Room INT
);
INSERT INTO Course (CourseID, CourseTitle, Credits, Building, Room) VALUES
    ('CS301', 'Algorithms', 4, 'Science', 205),
    ('MATH201', 'Linear Algebra', 3, 'Math Wing', 101),
    ('PHYS101', 'Mechanics', 4, 'Science', 301);


CREATE TABLE Enrollment (
    StudentID VARCHAR(10),
    CourseID VARCHAR(10),
    Grade CHAR(1),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
INSERT INTO Enrollment (StudentID, CourseID, Grade) VALUES
('S101', 'CS301', 'A'),
('S101', 'MATH201', 'B'),
('S102', 'CS301', 'C'),
('S103', 'PHYS101', 'A'),
('S103', 'MATH201', 'A');

--Part3 :  3NF

CREATE TABLE Students (
    StudentID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Major VARCHAR(50)
);
INSERT INTO Students VALUES
('S101', 'Alice', 'alice@uni.edu', 'CS'),
('S102', 'Bob', 'bob@uni.edu', 'CS'),
('S103', 'Carol', 'carol@uni.edu', 'Physics');

CREATE TABLE Courses (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseTitle VARCHAR(50),
    Credits INT,
    Building VARCHAR(50),
    Room INT
);
INSERT INTO Courses VALUES
('CS301', 'Algorithms', 4, 'Science', 205),
('MATH201', 'Linear Algebra', 3, 'Math Wing', 101),
('PHYS101', 'Mechanics', 4, 'Science', 301);

CREATE TABLE Enrollment (
    StudentID VARCHAR(10),
    CourseID VARCHAR(10),
    Grade CHAR(1),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT INTO Enrollment VALUES
('S101', 'CS301', 'A'),
('S101', 'MATH201', 'B'),
('S102', 'CS301', 'C'),
('S103', 'PHYS101', 'A'),
('S103', 'MATH201', 'A');

CREATE TABLE Majors (
    Major VARCHAR(50) PRIMARY KEY,
    MajorHead VARCHAR(50)
);
INSERT INTO Majors VALUES
('CS', 'Dr. Smith'),
('Physics', 'Dr. Lee');

-- PART4 : JOIN all the different tables : Student , Majors , Enrollments, Courses

SELECT
s.StudentID,
s.Name,
s.Email,
s.Major,
m.Advisor,
c.CourseID,
c.CourseTitle,
c.Credits,
e.Grade,
c.Building,
c.Room
FROM Students s
JOIN Majors m ON s.Major = m.Major
JOIN Enrollments e ON s.StudentID = e.
StudentID
JOIN Courses c ON e.CourseID = c.CourseID;




