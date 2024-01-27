/* Write your T-SQL query statement below */
SELECT DISTINCT A.Id
FROM WEATHER A, WEATHER B
WHERE DATEDIFF(dd, A.RECORDDATE, B.RECORDDATE) = -1 AND A.temperature > B.temperature AND A.ID IS NOT NULL;