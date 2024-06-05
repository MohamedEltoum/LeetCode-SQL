/* Write your T-SQL query statement below */
WITH Students_Class AS (
    SELECT class, COUNT(class) AS class_count
    FROM Courses
    GROUP BY class
)

SELECT class
FROM Students_Class
WHERE class_count >= 5;
