/* Write your T-SQL query statement below */
WITH Customer_Products AS (
    SELECT c.customer_id, p.product_key, 
    Dense_Rank() OVER (PARTITION BY c.customer_id ORDER BY p.product_key) AS dense_rank
    FROM Customer c RIGHT JOIN Product p ON c.product_key = p.product_key
)

SELECT DISTINCT customer_id
FROM Customer_Products
GROUP BY customer_id
HAVING MAX(dense_rank) IN (SELECT COUNT(DISTINCT product_key) FROM Product);