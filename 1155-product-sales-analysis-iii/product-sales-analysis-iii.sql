/* Write your T-SQL query statement below */
WITH firstProductSales AS (
    SELECT product_id, year, quantity, price, 
    Rank() OVER (PARTITION BY product_id ORDER BY year ASC) AS rank
    FROM Sales 
)

SELECT product_id, year AS first_year, quantity, price 
FROM firstProductSales
WHERE rank = 1;