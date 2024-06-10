/* Write your T-SQL query statement below */
WITH Passengers_Weight_Order AS (
    SELECT turn, person_id, person_name, weight, 
        SUM(weight) OVER (ORDER BY turn) AS weight_sum
    FROM Queue
)

SELECT person_name
FROM Passengers_Weight_Order
WHERE weight_Sum <= 1000 
    AND turn IN 
        (
            SELECT MAX(turn) 
            FROM Passengers_Weight_Order 
            WHERE weight_Sum <= 1000
        );