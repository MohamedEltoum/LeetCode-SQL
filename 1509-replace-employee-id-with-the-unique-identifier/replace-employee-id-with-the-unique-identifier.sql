/* Write your T-SQL query statement below */
SELECT U.unique_id, E.name
FROM Employees AS E FULL OUTER JOIN EmployeeUNI AS U
ON E.id = U.id
WHERE E.name IS NOT NULL;