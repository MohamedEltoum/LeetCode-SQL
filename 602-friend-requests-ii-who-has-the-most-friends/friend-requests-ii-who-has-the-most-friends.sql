/* Write your T-SQL query statement below */
WITH Requester_Count AS (
    SELECT requester_id, COUNT(requester_id) AS requester_count
    FROM RequestAccepted
    GROUP BY requester_id
), Accept_Count AS (
    SELECT accepter_id, COUNT(accepter_id) AS accepter_count
    FROM RequestAccepted
    GROUP BY accepter_id
), Friends_Total AS (
    SELECT requester_id AS id, requester_count AS count
    FROM Requester_Count
    UNION ALL
    SELECT accepter_id AS id, accepter_count AS count
    FROM Accept_Count
), Friends_Total_Sum AS (
    SELECT id, SUM(count) AS num
    FROM Friends_Total
    GROUP BY id    
)

SELECT id, num
FROM Friends_Total_Sum
WHERE num IN (SELECT MAX(num) FROM Friends_Total_Sum)
ORDER BY id;