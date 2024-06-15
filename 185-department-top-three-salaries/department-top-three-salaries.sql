/* Write your T-SQL query statement below */
WITH Salaries_Rank AS (
    SELECT id, name, salary, departmentId, 
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY departmentId ASC, salary DESC) AS dense_rank
    FROM Employee
), Employee_Departments AS (
    SELECT d.name AS Department, s.name AS Employee, s.salary AS Salary
    FROM Salaries_Rank s
        JOIN Department d
        ON s.departmentId = d.id
    WHERE dense_rank = 1 OR dense_rank = 2 OR dense_rank = 3
)

SELECT * 
FROM Employee_Departments
ORDER BY Salary;