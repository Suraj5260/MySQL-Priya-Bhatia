SHOW DATABASES 
CREATE DATABASE IF NOT EXISTS techforallwithsuraj
USE techforallwithsuraj
SELECT DATABASE()

CREATE TABLE employee(
	EID	INT AUTO_INCREMENT,
    FirstName	VARCHAR(50)	NOT NULL,
    LastName	VARCHAR(50)	NOT NULL,
	Age	INT	NOT NULL,
	Salary	INT	NOT NULL,
    Location	VARCHAR(50)	NOT NULL,
    PRIMARY KEY(EID)
)

DESC employee

SHOW TABLES

INSERT INTO employee( FirstName, LastName, Age, Salary, Location ) VALUES("Suraj", "Telrandhe",	22,	300000,	"Chandrapur")

Select * FROM employee

SELECT Firstname FROM employee WHERE Salary > 470000
 -- The order of process is FROM=>WHERE=>SELECT 
 
 -- Update
 UPDATE employee SET Lastname = "Bhatt"
 WHERE Firstname = "Jane"

-- Delete
DELETE FROM employe Where EID = 4



