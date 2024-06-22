/* Write your T-SQL query statement below */
WITH Customer_Order_Count AS (
    SELECT customer_number, COUNT(customer_number) customer_count
    FROM Orders
    GROUP BY customer_number
)

SELECT customer_number
FROM Customer_Order_Count
WHERE customer_count IN (
    SELECT MAX(customer_count)
    FROM Customer_Order_Count    
);