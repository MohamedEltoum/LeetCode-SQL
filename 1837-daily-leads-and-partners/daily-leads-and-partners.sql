/* Write your T-SQL query statement below */
SELECT date_id, make_name, ISNULL(COUNT(DISTINCT lead_id), 0) AS unique_leads
        , ISNULL(COUNT(DISTINCT partner_id), 0) AS unique_partners
FROM DailySales
GROUP BY date_id, make_name;