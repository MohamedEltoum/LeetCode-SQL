/* Write your T-SQL query statement below */
SELECT FORMAT(trans_date, 'yyyy-MM') AS month,
 country, 
 COUNT(id) AS trans_count, 
 SUM(IIF(state = 'approved', 1, 0)) AS approved_count, 
 SUM(amount) AS trans_total_amount,
 SUM(IIF(state = 'approved', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY FORMAT(trans_date, 'yyyy-MM'), country;