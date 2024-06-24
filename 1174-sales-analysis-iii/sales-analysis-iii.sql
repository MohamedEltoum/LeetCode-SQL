/* Write your T-SQL query statement below */
SELECT DISTINCT product_id, product_name
FROM (
    SELECT p.product_id, p.product_name
    FROM Sales s
        JOIN Product p
        ON s.product_id = p.product_id AND s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
    WHERE p.product_id NOT IN (
        SELECT product_id
        FROM Sales
        WHERE sale_date > '2019-03-31' OR sale_date < '2019-01-01'
        )
    ) q1_sold_product;