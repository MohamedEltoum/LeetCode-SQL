/* Write your T-SQL query statement below */
WITH Numbers_Count AS (
    SELECT num, COUNT(num) AS num_count
    FROM MyNumbers
    GROUP BY num
)

SELECT MAX(num) AS 'num'
FROM Numbers_Count
WHERE num_count = 1;