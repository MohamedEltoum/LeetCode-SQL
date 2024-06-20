/* Write your T-SQL query statement below */
WITH Email_Count AS (
    SELECT email, COUNT(email) AS email_count
    FROM Person
    GROUP BY email
    HAVING COUNT(email) > 1
)
SELECT email AS Email
FROM Email_Count;