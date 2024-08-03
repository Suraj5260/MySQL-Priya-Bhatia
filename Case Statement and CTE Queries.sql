SHOW DATABASES
USE techforallwithsuraj


-- course id, coursename, enroolmentr count
SELECT * FROM course_update

-- CASE Staement in SQL
--  Create a new column as "CourseFeeStatus"
 /*
	CourseFee > 3999 -> Expensice course
	CourseFee > 1499 -> Moderate course
    ELSE -> Cheap Course
 */
 
 UPDATE course_update
 SET CourseFee = 3999
 WHERE CourseId = 4

SELECT CourseId, CourseName, CourseFee,
	CASE
		WHEN CourseFee > 3999 THEN 'Expensive Couse'
        WHEN CourseFee > 1499 THEN 'Moderate Couse'
        ELSE 'Cheap Course'
	END AS CourseFeeTags
FROM course_update

-- CASE Expressions in SQL
-- CourseType: Premium Course, Plus Course, Classic Course

SELECT CourseId, CourseName, CourseFee,
	CASE CourseFee
		WHEN 4999 THEN 'Premium Course'
        WHEN 3999 THEN 'Plus Course'
        ELSE 'Classic Course'
	END AS CourseType
FROM course_update

-- Create a new table "Orders" in the techforallwithsuraj data base
-- OrderID -> PRIMARY KEY [Auto_Increment]
-- Order_Date
-- Order_Student_ID
-- ORDER_Status -> Complte, Pending, Closed

CREATE TABLE Orders(
Order_ID INT AUTO_INCREMENT,
Order_Date TIMESTAMP NOT NULL,
Order_learner_ID INT NOT NULL,
OrderStatus VARCHAR(30) NOT NULL ,
PRIMARY KEY(Order_ID),
FOREIGN KEY(Order_learner_ID) REFERENCES learners(LearnerID)
)

SHOW TABLES
DESC Orders
DROP TABLE Orders

INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-21',1,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12',6,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-02-22',3,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-15',4,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12',5,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-16',7,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-13',8,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-14',9,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-22',1,'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12',5,'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-25',1,'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-11',7,'CLOSED');

SELECT * FROM Orders

-- Total orders per student

SELECT Order_Learner_Id  , COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Order_Learner_Id

-- Order_Learner_Id  , LearnerFirstName,Total_Orders

SELECT  temp.Order_Learner_Id ,Learner_FirstName, Learner_LastName ,temp.Total_Orders
FROM learners
JOIN
(SELECT Order_Learner_Id  , COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Order_Learner_Id) AS temp
ON learners.learnerID = Order_Learner_Id

-- Order_Learner_Id  , LearnerFirstName,Total_Orders, Avg_Orders

SELECT  temp.Order_Learner_Id ,Learner_FirstName, Learner_LastName ,temp.Total_Orders, AVG(SUM(temp.Total_Orders)) OVER() AS Avg_Orders
FROM 
learners
JOIN
(SELECT Order_Learner_Id  , COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Order_Learner_Id) AS temp
ON learners.learnerID = Order_Learner_Id
GROUP BY temp.Order_Learner_Id

-- Display the premium users of techforallwithsuraj
-- use the concept of cte
-- condition -> total_orders > avg_orders
-- akash mishra, akhil george, nagasai sreedhar


