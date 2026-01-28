# Task3_support_1
Normalization of a Table

## Overview

**Normalization:**
Normalization is the process of organizing data into database where there is no data redundancy and data is stored cleanly and logically.

**Types of Normalization**

 **1NF [First Normal Form]**
Each field should have only one value

**2NF[Second Normal Form]**
Must be in 1NF and there should be no partial dependency(non key attribute should only depend upon primary key)

**3NF[Third Normal Form]**
Must be in 2NF and there should be no transitive dependency(a non key attribute should not be defined using another non key attribute)

## Database Schema

### Unnormalized Form

```
raw_data(StudentID , Name, Email, Major, MajorHead, CourseID, CourseTitle, Credits, Grade, Building, Room)
```

### First Normal Form(1NF)

The table is already in 1NF . So let us make it in 2NF and 3NF
```
+------------+-------+---------------+---------+-----------+----------+----------------+---------+-------+-----------+------+
| Student_ID | Name  | Email         | Major   | MajorHead | CourseID | CourseTitle    | Credits | Grade | Building  | Room |
+------------+-------+---------------+---------+-----------+----------+----------------+---------+-------+-----------+------+
| S101       | Alice | alice@uni.edu | CS      | Dr.Smith  | CS301    | Algorithms     |       4 | A     | Science   |  205 |
| S101       | Alice | alice@uni.edu | CS      | Dr.Smith  | MATH201  | Linear Algebra |       3 | B     | Math Wing |  101 |
| S102       | Bob   | bob@uni.edu   | CS      | Dr.Smith  | CS301    | Algorithms     |       4 | C     | Science   |  205 |
| S103       | Carol | carol@uni.edu | Physics | Dr.Lee    | PHYS101  | Mechanics      |       4 | A     | Science   |  301 |
| S103       | Carol | carol@uni.edu | Physics | Dr.Lee    | PHYS101  | Mechanics      |       4 | A     | Science   |  301 |
+------------+-------+---------------+---------+-----------+----------+----------------+---------+-------+-----------+------+

```

### Second Normal Form (2NF)

- Student --> (StudentID , Name , Email)
- Course --> (CourseID, CourseTitle, Credits, Building, Room)
- Enrollment --> (StudentID, CourseID, Grade,)

### Third Normal Form(3NF)

- Student --> (StudentID, Name, Email, Major)
- Major --> (Major, MajorHead)
- Course --> (CourseID, CourseTitle, Credits, Building, Room)
- Enrollment --> (StudentID, CourseID, Grade)

> **Note: All the commands are in "commands.sql" section** 

## Individual Table Output

- Student
```
+-----------+-------+---------------+---------+
| StudentID | Name  | Email         | Major   |
+-----------+-------+---------------+---------+
| S101      | Alice | alice@uni.edu | CS      |
| S102      | Bob   | bob@uni.edu   | CS      |
| S103      | Carol | carol@uni.edu | Physics |
+-----------+-------+---------------+---------+
```
- Major
```
  +---------+-----------+
| Major   | Advisor   |
+---------+-----------+
| CS      | Dr. Smith |
| Physics | Dr. Lee   |
+---------+-----------+
```
- Course
```
  +----------+----------------+---------+-----------+------+
| CourseID | CourseTitle    | Credits | Building  | Room |
+----------+----------------+---------+-----------+------+
| CS301    | Algorithms     |       4 | Science   | 205  |
| MATH201  | Linear Algebra |       3 | Math Wing | 101  |
| PHYS101  | Mechanics      |       4 | Science   | 301  |
+----------+----------------+---------+-----------+------+
```
- Enrollment
```
+-----------+----------+-------+
| StudentID | CourseID | Grade |
+-----------+----------+-------+
| S101      | CS301    | A     |
| S101      | MATH201  | B     |
| S102      | CS301    | C     |
| S103      | PHYS101  | A     |
+-----------+----------+-------+ 
```
