SHOW DATABASES
USE techforallwithsuraj
SHOW TABLES
SELECT * FROM employee

-- Create a table by the name of courses having fields - CourseId, CourseName, Course_duration_months, CourseFee

CREATE TABLE Courses(
CourseId INT AUTO_INCREMENT,
CourseName varchar(50) NOT NULL,
Course_duration_months INT NOT NULL,
CourseFee INT NOT NULL,
PRIMARY KEY (CourseId)
)

DESC Courses

-- Insert the course details inside the table named Courses

INSERT INTO Courses( CourseName, Course_duration_months, CourseFee) VALUES ("The Complete Excel Course", 3, 1499);
INSERT INTO Courses( CourseName, Course_duration_months, CourseFee) VALUES ("DSA for interview", 2, 4999);
INSERT INTO Courses( CourseName, Course_duration_months, CourseFee) VALUES ("SQL Bootcamp", 1, 2999)

SELECT * FROM Courses

CREATE TABLE Learners(
LearnerID INT AUTO_INCREMENT,
Learner_FirstName	VARCHAR(50) NOT NULL,
Learner_LastName	VARCHAR(50) NOT NULL,
Learner_Email	VARCHAR(50) ,
Learner_PhoneNumber	VARCHAR(10) NOT NULL,
Learner_EnrollmentDate	TIMESTAMP NOT NULL,
SelectedCourse	INT NOT NULL,
Experience_Years INT NOT NULL,
Learner_Company	VARCHAR(50) ,
Learner_SOJ	VARCHAR(50) NOT NULL,
Batch_Start_Date	TIMESTAMP NOT NULL,
Location	VARCHAR(50) NOT NULL,
PRIMARY KEY(LearnerID),
UNIQUE KEY(Learner_Email),
FOREIGN KEY(selectedCourse)	REFERENCES Courses(CourseId)
)

DROP TABLE Learners

DESC Learners

-- Insert data in Learners table

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
('John', 'Doe', 'john.doe@example.com', '1234567890', '2023-01-15', 1, 5, 'TechCorp', 'Linkedin', '2024-02-29', 'New York'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '2023-03-10', 2, 2, 'Innovate Ltd.', 'Intermediate', '2024-01-16', 'Los Angeles'),
('Robert', 'Brown', 'robert.brown@example.com', '1122334455', '2023-05-05', 3, 3, 'DevSolutions', 'Advanced', '2024-03-25', 'San Francisco'),
('Emily', 'Davis', 'emily.davis@example.com', '5566778899', '2023-07-20', 1, 1, 'WebWorks', 'Beginner', '2024-02-29', 'Chicago'),
('Michael', 'Johnson', 'michael.johnson@example.com', '6677889900', '2023-09-25', 2, 4, 'Techie Inc.', 'Intermediate', '2024-01-16', 'Houston'),
('Sarah', 'Lee', 'sarah.lee@example.com', '4455667788', '2023-11-30', 3, 6, 'FutureTech', 'Advanced', '2024-03-25', 'Boston');

SELECT * FROM Learners

-- Data Analysis [employee, Learners, Courses]

-- Give me the record of the employuee who is getting the highest salary

SELECT * FROM employee -- * the order of Execsion is FROM-> SELECT-> ORDER BY ->LIMIT
ORDER BY Salary DESC -- use ORDER BY to arrange in order by , DESC for decending order
LIMIT 1

-- give me the report of employee getting highest salary and age is >30

SELECT * FROM employee	-- * the order of Execsion is FROM-> WHERE-> SELECT-> ORDER BY ->LIMIT
WHERE Age > 30
ORDER BY Salary DESC
LIMIT 1

-- Display the number of enrollment on the website 

SELECT COUNT(*) FROM Learners

-- display the number of enrollment for people in course 3

SELECT COUNT(*) AS num_of_learners_SQL
FROM Learners
WHERE SelectedCourse = 3

-- count the number of students enrolled in month of jan

SELECT COUNT(*) FROM Learners
WHERE Learner_EnrollmentDate LIKE '%-01-%'

-- update thee experience of id 4 to 2 and company name to Amazon

UPDATE Learners
SET Experience_Years=2 , Learner_Company = "Amazon"
WHERE LearnerID = 4

SELECT * FROM learners

-- count the number of companies - it giver all the companies
-- DISTINCT gives us the unique one only

SELECT COUNT( DISTINCT Learner_Company) AS uniq_Companies 
FROM Learners

