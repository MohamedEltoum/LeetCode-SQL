/* Write your T-SQL query statement below */

SELECT request_at AS Day, ROUND(SUM(CASE WHEN status <> 'completed' THEN 1 ELSE 0 END)*1.00/COUNT(*), 2) AS 'Cancellation Rate'
FROM Trips
WHERE client_id NOT IN (
    SELECT users_id
    FROM Users
    WHERE banned = 'Yes'
    ) 
    AND driver_id NOT IN (
    SELECT users_id
    FROM Users
    WHERE banned = 'Yes'
    ) 
    AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at;

--Following solution was my first try, however the result required should show records of cancellation if they exist in trips
--This requires one query with aggregate function to show records or not (If there are no cancelled trips there should be no result)

-- WITH User_Trip AS (
--     SELECT t.status, t.request_at
--     FROM Trips t 
--         JOIN Users u 
--         ON t.client_id = u.users_id
--     WHERE u.banned = 'No' AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
-- ), Cancelled_Trips AS (
--     SELECT request_at, COUNT(request_at) AS cancelled_count
--     FROM User_Trip
--     WHERE status <> 'completed'
--     GROUP BY request_at
-- ), Total_Trips AS (
--     SELECT request_at, COUNT(request_at) AS total_count
--     FROM User_Trip
--     GROUP BY request_at
-- )

-- SELECT t.request_at AS 'Day', ISNULL(ROUND(c.cancelled_count * 1.00 / t.total_count, 2), 0) AS 'Cancellation Rate'
-- FROM Total_Trips t
--     JOIN Cancelled_Trips c
--     ON t.request_at = c.request_at

