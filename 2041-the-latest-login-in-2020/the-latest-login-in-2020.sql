/* Write your T-SQL query statement below */
SELECT user_id, MAX(time_stamp) AS last_stamp
FROM lOGINS
WHERE time_stamp LIKE '%2020%'
GROUP BY user_id;