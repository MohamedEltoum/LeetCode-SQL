-- Create CTE for first immediate orders.
WITH First_Immediate_Orders AS
(SELECT customer_id
FROM Delivery
GROUP BY customer_id
HAVING MIN(order_date) = MIN(customer_pref_delivery_date))

SELECT ROUND(CAST((SELECT COUNT(*) FROM First_Immediate_Orders) AS FLOAT) / CAST((SELECT COUNT(DISTINCT customer_id) from Delivery) AS FLOAT) * 100, 2) AS 'immediate_percentage';
--SELECT COUNT(*) FROM First_Immediate_Orders;