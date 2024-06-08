/* Write your T-SQL query statement below */
WITH Before_After_Numbers AS (
    SELECT LAG(id, 1, 0) OVER (ORDER BY id) AS previous_id, 
    id, 
    LEAD(id, 1, 0) OVER (ORDER BY id) AS after_id,
    LAG(num, 1, 0) OVER (ORDER BY id) AS previous, 
    num, 
    LEAD(num, 1, 0) OVER (ORDER BY id) AS after
    FROM Logs
)


SELECT DISTINCT num AS ConsecutiveNums
FROM Before_After_Numbers
WHERE Before_After_Numbers.[previous] = num AND num = Before_After_Numbers.[after] AND previous_id + 1 = id AND id + 1 = after_id;
