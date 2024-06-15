/* Write your T-SQL query statement below */
WITH Unique_Products AS (
    SELECT DISTINCT product, sell_date
    FROM Activities
)
SELECT sell_date, 
        COUNT(sell_date) AS num_sold, 
        STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product ASC) AS products
FROM Unique_Products
GROUP BY sell_date
ORDER BY sell_date;