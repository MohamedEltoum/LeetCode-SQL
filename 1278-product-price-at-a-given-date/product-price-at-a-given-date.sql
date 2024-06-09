/* Write your T-SQL query statement below */
WITH Product_Price_Before AS (
    SELECT product_id, MAX(change_date) AS latest_price_amendment
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
),
Latest_Product_Price AS (
    SELECT B.product_id, P.new_price, B.latest_price_amendment
    FROM Products P
    INNER JOIN Product_Price_Before B
    ON P.change_date = B.latest_price_amendment AND P.product_id = B.product_id
)

SELECT DISTINCT product_id, new_price AS 'price'
FROM Latest_Product_Price
UNION
SELECT product_id, 10 AS 'price'
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM Latest_Product_Price)