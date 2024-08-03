SHOW DATABASES
USE techforallwithsuraj
-- for each location what is the count of each employee and avg salary for each 
SELECT * FROM Employee

SELECT Location , COUNT(*) as total, AVG(Salary) as Avg_Salary
FROM employee
GROUP BY Location

-- just made a change in data
UPDATE employee
SET Location ="Chandrapur"
WHERE EID =4

-- for each location what is the count of each employee and avg salary for each 
-- but also add the name and last name 


SELECT FirstName, LastName, employee.Location, total, Avg_Salary
from employee 
JOIN  -- Inner JOIN
(SELECT Location , COUNT(*) as total, AVG(Salary) as Avg_Salary
FROM employee
GROUP BY Location) AS temp
ON employee.Location = temp.Location
ORDER BY total DESC -- ADDED BY URS TRUELY XD


-- optimise the above queries usimng window functions

SELECT FirstName, LastName, Location,
COUNT(Location) OVER (PARTITION BY LOCATION) AS Total, -- Over always comes with Partition BY
AVG(Salary) OVER (PARTITION BY Location) AS Avg_Salary
FROM employee

INSERT INTO employee( FirstName, LastName, Age, Salary, Location ) VALUES("Jeevan", "Hedge", 27, 200000, "Noida");
INSERT INTO employee( FirstName, LastName, Age, Salary, Location ) VALUES("Sidish", "Kumar",	25,	200000,	"Banglore")

 ALTER TABLE employee MODIFY COLUMN EID INT AUTO_INCREMENT
 DESC employee

-- SORT the employes for priority on bases of their salary 

-- Interview question Diff b/w ROW_NUMBER(), RANK() and DENSE_RANK()?
-- IF no duplicates then ROW_NUMBER(), RANK() and DENSE_RANK() will give same rank.
-- whenever we use ROW_NUMBER(), RANK() and DENSE_RANK() ORDER BY is compulsary, PARTETION BY is optional


-- ROW_NUMBER()	 it provides ranks but bu the law of first in first rank and so same scoiore no same rank.

SELECT FirstName, LastName, Salary,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS P_EMP
FROM employee

-- RANK() it gives same rank to same score but skips the next rank, eg-1,2,2,2,5,6,7.

SELECT FirstName, LastName, Salary,
RANK() OVER (ORDER BY Salary DESC) AS P_EMP
FROM employee

-- DENSE_RANK()	it gives rank by score and also doesnot skip the ranks las the above did.

SELECT FirstName, LastName, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS P_EMP
FROM employee


-- Give the recordds of the employ with 2nd highest salary

SELECT * FROM 
(SELECT FirstName, LastName, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS P_EMP
FROM employee) as temp
WHERE P_EMP = 8

-- Give me the first employee whose rank is 8

SELECT * FROM 
(SELECT FirstName, LastName, Salary,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS P_EMP
FROM employee) as temp
WHERE P_EMP = 8

-- Specify the details of highest salary people in each location

SELECT * FROM 
(SELECT FirstName, LastName, Salary,Location,
ROW_NUMBER() OVER (PARTITION BY Location ORDER BY Salary DESC) AS P_EMP
FROM employee) as temp
WHERE P_EMP = 1
