/* Write your T-SQL query statement below */
WITH Emp_Primary_Department AS (
    SELECT DISTINCT employee_id, department_id
    FROM Employee
    WHERE primary_flag = 'Y'
),
Emp_NonPrimary_Department AS (
    SELECT employee_id, COUNT(employee_id) nonprimary_employee_department
    FROM Employee
    WHERE primary_flag = 'N'
    GROUP BY employee_id
    HAVING COUNT(employee_id) = 1
)

SELECT employee_id, department_id
FROM Employee
WHERE employee_id NOT IN (SELECT employee_id FROM Emp_Primary_Department)
        AND employee_id IN (SELECT employee_id FROM EMP_NonPrimary_Department)
GROUP BY employee_id, department_id
UNION
SELECT employee_id, department_id
FROM Emp_Primary_Department;