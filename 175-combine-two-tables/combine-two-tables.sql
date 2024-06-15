/* Write your T-SQL query statement below */
WITH Person_With_Address AS (
    SELECT *
    FROM Person
    WHERE personId IN (SELECT personId
                        FROM Address)
)
SELECT p.firstName, p.lastName, a.city, a.state
FROM Address a JOIN Person p ON a.personId = p.personId
UNION
SELECT firstName, lastName, null AS city, null AS state
FROM Person
WHERE personId NOT IN (SELECT personId 
                        FROM Person_With_Address);