/* Write your T-SQL query statement below */
SELECT activity_date AS 'day', COUNT(DISTINCT user_id) AS 'active_users'
FROM Activity
WHERE activity_date BETWEEN DATEADD(day, -29, CONVERT(datetime, '2019-07-27', 21)) and '2019-07-27'
GROUP BY activity_date;