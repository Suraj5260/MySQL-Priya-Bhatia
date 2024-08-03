SHOW DATABASES
USE techforallwithsuraj
SHOW TABLES

-- count the number of learners joined from different sources

SELECT Learner_SOJ, COUNT(*) as num_of_students
FROM Learners
GROUP BY Learner_SOJ

-- grouping via source and locaion

SELECT Learner_SOJ, location, COUNT(*) as num_of_students
FROM Learners
GROUP BY Learner_SOJ, location

 -- Corresponding to each course, how many students have entered
 
 SELECT SelectedCourse , COUNT(*) as students
 FROM Learners
 GROUP BY SelectedCourse
 
 -- Correspondiing  to indevidual source of joining, give me the maximum years of experience
 
 SELECT Learner_SOJ, MAX(Experience_Years) as exp_in_Yrs
 FROM Learners
 GROUP BY Learner_SOJ
 
 -- Correspondiing  to indevidual source of joining, give me the minimum years of experience
 
  SELECT Learner_SOJ,MIN(Experience_Years) as exp_in_Yrs
 FROM Learners
 GROUP BY Learner_SOJ
 
  -- Correspondiing  to indevidual source of joining, give me the AVG. years of experience
 
 SELECT Learner_SOJ,AVG(Experience_Years) as exp_in_Yrs
 FROM Learners
 GROUP BY Learner_SOJ
 
   -- Correspondiing  to indevidual source of joining, give me the SUM of years of experience
 
 SELECT Learner_SOJ,SUM(Experience_Years) as exp_in_Yrs
 FROM Learners
 GROUP BY Learner_SOJ 
 ORDER BY exp_in_Yrs DESC
 
 -- if the SOJ  >1
 -- if we are using group by we can't use where so use having for fieltering
 
 SELECT Learner_SOJ, COUNT(*) AS nums_of_students
 FROM Learners
 GROUP by Learner_SOJ
 HAVING nums_of_students >1
 
 -- inserting some more data
 
 INSERT INTO Learners (
    Learner_FirstName,
    Learner_LastName,
    Learner_Email,
    Learner_PhoneNumber,
    Learner_EnrollmentDate,
    SelectedCourse,
    Experience_Years,
    Learner_Company,
    Learner_SOJ,
    Batch_Start_Date,
    Location
) VALUES
('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', '2023-08-10', 3, 2, 'Infosys', 'Youtube', '2024-05-10', 'Bangalore');

 -- display the count of students join by linkedin
 
 SELECT Learner_SOJ, COUNT(*) as count
 FROM Learners
 GROUP BY Learner_SOJ
 HAVING Learner_SOJ = "Youtube"
 courses
 -- platforms where enrollments is >2
 
 SELECT Learner_SOJ , COUNT(*) as enrollments
 FROM Learners
 GROUP BY Learner_SOJ
 HAVING enrollments >2
 
 desc lEARNERS
 
 -- FOND THE COURSE TRHAT HAS excel in name
 
 SELECT *
 FROM Courses
 WHERE CourseName NOT LIKE "%Excel%"
 
 -- Display the details of learners who have exp <=2 and soj is Linkedin and location is newyork
 
 SELECT *
 FROM Learners
 WHERE Experience_Years >3 AND Learner_SOJ = "Linkedin" AND LOCATION LIKE "NEW%"
 
 -- Display the records of learners with exp between 1 and 3
 
SELECT * FROM Learners 
Where Experience_Years BETWEEN 1 AND 3

 -- ALTER Command
 DESC employee
 SELECT * FROM employee

 
 ALTER TABLE employee ADD COLUMN EID INT PRIMARY KEY AUTO_INCREMENT 
 ALTER TABLE employee MODIFY COLUMN FirstName VARCHAR(30)	NOT NULL
 ALTER TABLE employee DROP COLUMN jobPosition 
 ALTER TABLE employee
MODIFY COLUMN EID INT FIRST;

-- TRUNCATE in SQL
-- DELETE vs TRUNCATE ? => we can do DELETE one by one and also it can be undo but not TRUNCATE and it is also DDL

-- DATATYPES in SQL => DECIMAL
-- IMPLICIT TYPECASTING

INSERT INTO Courses( CourseName, Course_duration_months, CourseFee) VALUES ("Foundation of Machine Learning", 3.5, 4999); -- 3.5 was converted to 4

SELECT * from Courses

CREATE TABLE Course_Update(
CourseId INT AUTO_INCREMENT,
CourseName varchar(50) NOT NULL,
Course_duration_months DECIMAL(3,1) NOT NULL,
CourseFee INT NOT NULL,
Changed_At TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (CourseId)
)

DESC course_Update

INSERT INTO Course_Update( CourseName, Course_duration_months, CourseFee) VALUES ("The Complete Excel Course", 2.5, 1499);
INSERT INTO Course_Update( CourseName, Course_duration_months, CourseFee) VALUES ("DSA for interview", 2, 4999);
INSERT INTO Course_Update( CourseName, Course_duration_months, CourseFee) VALUES ("SQL Bootcamp", 1, 2999);
INSERT INTO Course_Update( CourseName, Course_duration_months, CourseFee) VALUES ("Foundation of Machine Learning", 3.5, 4999);
INSERT INTO Course_Update( CourseName, Course_duration_months, CourseFee) VALUES ("Statistics for DataScience", 3.5, 4999)

SELECT * from Course_Update

DROP TABLE Course_Update

ALTER TABLE Course_Update
ADD COLUMN Changed_At TIMESTAMP DEFAULT NOW()

-- Update the Course Fees of SQL BOOTCAMP to 3999

UPDATE Course_Update 
SET CourseFee = 4999
Where CourseId = 3

 