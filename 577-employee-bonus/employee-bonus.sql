/* Write your T-SQL query statement below */
SELECT E.NAME, B.bonus
FROM Employee AS E LEFT JOIN BONUS AS B
ON E.EMPID = B.EMPID
WHERE B.bonus < 1000 OR B.bonus IS NULL;