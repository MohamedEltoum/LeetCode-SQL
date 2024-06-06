/* Write your T-SQL query statement below */
WITH Employees_Managers AS (
    SELECT m.employee_id, m.name, e.age
    FROM Employees m
    JOIN Employees e ON e.reports_to = m.employee_id
)

SELECT employee_id, name, COUNT(employee_id) AS reports_count, ROUND(AVG(1.00 * age), 0) AS average_age
FROM Employees_Managers
GROUP BY employee_id, name
ORDER BY employee_id ASC;