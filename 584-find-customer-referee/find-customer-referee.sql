/* Write your T-SQL query statement below */
SELECT C.name
FROM Customer AS C
WHERE C.referee_id <> 2 OR C.referee_id IS NULL;