/* Write your T-SQL query statement below */
WITH Triangle_Rows AS (
    SELECT x, y, z, 'Yes' AS triangle
    FROM Triangle
    WHERE x + y > z AND y + z > x AND x + z > y
)

SELECT x, y, z, 'No' AS triangle
FROM Triangle
WHERE x + y <= z OR y + z <= x OR x + z <= y
UNION 
SELECT x, y, z, triangle
FROM Triangle_Rows;