/* Write your T-SQL query statement below */
WITH Min_Identifiers AS (
    SELECT MIN(id) AS id, email
    FROM Person
    GROUP BY email
)

DELETE FROM Person 
WHERE id NOT IN (SELECT id FROM Min_Identifiers);