/* Write your T-SQL query statement below */
WITH Daily_Sum AS (
    SELECT visited_on, SUM(amount) AS daily_sum
    FROM Customer
    GROUP BY visited_on
), Consecutive_Days_Sum AS (
    SELECT a.visited_on, SUM(b.daily_sum) AS amount, 
            ROUND(AVG(b.daily_sum*1.00), 2) AS average_amount
    FROM Daily_Sum a
        JOIN Daily_Sum b
        ON DATEDIFF(day, a.visited_on, b.visited_on) BETWEEN -6 AND 0
    GROUP BY a.visited_on
    HAVING COUNT(b.visited_on) = 7
)
SELECT * 
FROM Consecutive_Days_Sum 
ORDER BY visited_on;