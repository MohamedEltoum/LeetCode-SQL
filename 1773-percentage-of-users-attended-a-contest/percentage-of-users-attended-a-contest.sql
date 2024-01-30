/* Write your T-SQL query statement below */
SELECT r.contest_id, ISNULL(ROUND(COUNT(r.user_id) * 100.0 / NULLIF((SELECT COUNT(user_id) FROM Users), 0), 2), 0) AS 'percentage'
FROM Users u JOIN Register r
ON u.user_id = r.user_id
GROUP BY r.contest_id
ORDER BY 2 DESC, r.contest_id ASC;