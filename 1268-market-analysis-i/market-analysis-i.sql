/* Write your T-SQL query statement below */
WITH Orders_Count AS (
    SELECT o.buyer_id, COUNT(*) AS orders_in_2019
    FROM Orders o
        JOIN Users u
        ON o.buyer_id = u.user_id
    WHERE o.order_date LIKE '%2019%'
    GROUP BY o.buyer_id
)

SELECT user_id AS 'buyer_id', join_date, ISNULL(orders_in_2019, 0) AS 'orders_in_2019'
FROM Orders_Count
    RIGHT JOIN Users
    ON buyer_id = user_id;