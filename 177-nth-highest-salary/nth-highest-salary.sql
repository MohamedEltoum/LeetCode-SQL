CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    /* Write your T-SQL query statement below. */
    
    -- DECLARE THE RETURN VARIABLE
    DECLARE @employee_salary AS INT;

    WITH Employee_Salary_Rank AS (
        SELECT *, DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
        FROM Employee
    ), Nth_Employee_Salary AS (
        SELECT salary 
        FROM Employee_Salary_Rank
        WHERE salary_Rank = @N
        UNION
        SELECT null
        FROM Employee
        WHERE NOT EXISTS (
            SELECT salary
            FROM Employee_Salary_Rank
            WHERE salary_Rank = @N
        )
    )

    SELECT @employee_salary = salary
    FROM Nth_Employee_Salary;

    RETURN @employee_salary;
END