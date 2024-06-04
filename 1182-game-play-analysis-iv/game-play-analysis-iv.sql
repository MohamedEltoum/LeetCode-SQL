/* Write your T-SQL query statement below */
WITH FirstLogin AS (
    SELECT player_id, MIN(event_date) AS firstLogin
    FROM Activity
    GROUP BY player_id
)

SELECT (ROUND((SELECT COUNT(DISTINCT A.player_id) * 1.00
FROM Activity A
INNER JOIN
FirstLogin F
ON A.player_id = F.player_id
WHERE DATEADD(day, 1, F.firstLogin) = A.event_date) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2)) AS 'fraction'