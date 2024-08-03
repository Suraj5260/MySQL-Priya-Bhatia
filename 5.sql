SHOW DATABASES
USE techforallwithsuraj

SELECT * FROM learners;


-- 1. Which courses have the highest enrollment rates?

SELECT SelectedCourse, COUNT(SelectedCourse) as enrolled
FROM learners
GROUP BY SelectedCourse 
ORDER BY enrolled DESC 
LIMIT 1

-- Query1 -> Better Optimised  as it firstly filters the results and then does the joining so less JOIN operations are required.
-- also give course name
SELECT temp.SelectedCourse, CourseName, temp.enrolled
FROM course_update
JOIN
(SELECT SelectedCourse, COUNT(SelectedCourse) as enrolled
FROM learners
GROUP BY SelectedCourse 
ORDER BY enrolled DESC 
LIMIT 1
) as temp
ON temp.SelectedCourse = CourseId

-- Query 2 -> Lots of joins and then agian a lot off operation so not an optimised solution.ddddddd
SELECT CourseId, CourseName, COUNT(*) as  Enrollments
FROM learners
JOIN  course_update
ON learners.SelectedCourse = course_update.CourseId
GROUP BY SelectedCourse
ORDER BY Enrollments DESC
LIMIT 1


 -- 2. How many learners are enrolled in each course?
 
SELECT SelectedCourse, COUNT(SelectedCourse) as counted
FROM Learners
GROUP BY SelectedCourse
    
--  3. What is the total revenue generated from the course fees?



--  4. Which locations contribute the most to course revenue?
--  5. Which course contributes the most to the learner's enrollment?
--  6. Rank learners based on their enrollment date within each course.
--  7. Compare each employee’s salary with the average salary in their location. 


-- Display the premium users of techforallwithpriya
-- use the concept of cte
-- condition -> total_orders > avg_orders
-- akash mishra, akhil george, nagasai sreedhar
