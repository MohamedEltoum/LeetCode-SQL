/* Write your T-SQL query statement below */
WITH Salary_Rank AS (
    SELECT *, DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
    FROM Employee
)

SELECT salary AS SecondHighestSalary
FROM Salary_Rank
WHERE dense_rank = 2
UNION
SELECT NULL
FROM Employee
    WHERE NOT EXISTS (
    SELECT salary
    FROM Salary_Rank
    WHERE dense_rank = 2
);