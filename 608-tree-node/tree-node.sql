/* Write your T-SQL query statement below */
SELECT id, 'Root' AS 'type'
FROM Tree
WHERE p_id IS NULL
UNION
SELECT DISTINCT t1.id, 'Inner' AS 'type'
FROM Tree t1
    JOIN Tree t2
    ON t1.id = t2.p_id AND t1.p_id IS NOT NULL
UNION
SELECT id, 'Leaf' AS 'type'
FROM (
    SELECT t1.id, t2.p_id
    FROM Tree t1
        LEFT JOIN Tree t2
        ON t1.id = t2.p_id AND t2.p_id IS NOT NULL) left_join
WHERE p_id IS NULL AND id NOT IN (
    SELECT id
    FROM Tree
    WHERE p_id IS NULL
);