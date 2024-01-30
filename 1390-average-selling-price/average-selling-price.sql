/* Write your T-SQL query statement below */
SELECT p.product_id, ISNULL(ROUND(SUM(IIF(u.purchase_date BETWEEN p.start_date AND p.end_date, p.price * u.units, 0)) * 1.0 / NULLIF(SUM(IIF(u.purchase_date BETWEEN p.start_date AND p.end_date, u.units, 0)), 0), 2), 0) AS "average_price"
FROM Prices p LEFT JOIN UnitsSold u
ON p.product_id = u.product_id
GROUP BY p.product_id;