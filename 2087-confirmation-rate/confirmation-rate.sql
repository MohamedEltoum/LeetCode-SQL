/* Write your T-SQL query statement below */
SELECT s.user_id, ISNULL(ROUND(SUM(IIF(c.action = 'confirmed', 1, 0)) * 1.0 / NULLIF(COUNT(c.action), 0), 2), 0) confirmation_rate
FROM Signups s LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id;