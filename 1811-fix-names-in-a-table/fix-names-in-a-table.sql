/* Write your T-SQL query statement below */
SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), SUBSTRING(LOWER(name), 2, LEN(name) - 1)) AS name
FROM Users
ORDER BY user_id;