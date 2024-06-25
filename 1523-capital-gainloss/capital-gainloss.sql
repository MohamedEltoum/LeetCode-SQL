/* Write your T-SQL query statement below */
WITH Stock_Consecutive_Operation AS (
    SELECT *, LEAD(price, 1) OVER (PARTITION BY stock_name ORDER BY operation_day) AS sell_price
    FROM Stocks
)

SELECT stock_name, SUM(sell_price - price) AS 'capital_gain_loss'
FROM Stock_Consecutive_Operation 
WHERE operation = 'Buy'
GROUP BY stock_name;