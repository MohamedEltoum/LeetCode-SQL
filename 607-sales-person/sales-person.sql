/* Write your T-SQL query statement below */
SELECT DISTINCT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT o.sales_id
    FROM Orders o
        JOIN Company c 
        ON o.com_id = c.com_id 
        AND c.name = 'RED'
);