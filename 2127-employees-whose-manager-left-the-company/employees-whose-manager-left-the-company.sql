/* Write your T-SQL query statement below */
WITH Managers AS (
    SELECT m.employee_id
    FROM Employees e
    JOIN Employees m
    ON e.manager_id = m.employee_id
)

SELECT employee_id
FROM Employees
WHERE manager_id NOT IN (SELECT * FROM Managers) 
    AND salary < 30000 
    AND manager_id IS NOT NULL
ORDER BY employee_id;