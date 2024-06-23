/* Write your T-SQL query statement below */
WITH Consecutive_Visits AS (
    SELECT *, SUM(CASE WHEN id = previous_id + 1 THEN 0 ELSE 1 END) OVER (ORDER BY id) AS island_id
    FROM 
        (SELECT *, LAG(id, 1) OVER (ORDER BY id) AS previous_id
        FROM Stadium
        WHERE people >= 100) previous

), Consecutive_Visits_Count AS (
    SELECT island_id, COUNT(island_id) AS island_count
    FROM Consecutive_Visits
    GROUP BY island_id
    HAVING COUNT(island_id) > 2
)

SELECT id, visit_date, people
FROM Consecutive_Visits
WHERE island_id IN (
    SELECT island_id
    FROM Consecutive_Visits_Count
)
ORDER BY visit_date