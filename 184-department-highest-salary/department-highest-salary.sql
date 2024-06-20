/* Write your T-SQL query statement below */
WITH Employee_Salary_Rank AS (
    SELECT *, RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS salary_rank
    FROM Employee
)

SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee_Salary_Rank e
    JOIN Department d
    ON e.departmentId = d.id
WHERE e.salary_rank = 1;