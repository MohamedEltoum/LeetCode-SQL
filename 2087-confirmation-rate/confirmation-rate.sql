/* Write your T-SQL query statement below */
SELECT s.user_id, ISNULL(ROUND(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) * 1.0 / NULLIF(COUNT(c.action), 0), 2), 0) confirmation_rate
FROM Signups s LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id;