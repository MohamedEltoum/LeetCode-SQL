/* Write your T-SQL query statement below */
WITH Tiv2015_Rank AS (
    SELECT *, RANK() OVER (PARTITION BY tiv_2015 ORDER BY tiv_2015) AS rank
    FROM Insurance
), Tiv2015_Rank_Count AS (
    SELECT tiv_2015, COUNT(rank) AS rank_count
    FROM Tiv2015_Rank
    GROUP BY tiv_2015
    HAVING COUNT(rank) > 1
), Same_Citites_Investment AS (
    SELECT b.pid, b.tiv_2015, b.tiv_2016, b.lat, b.lon
    FROM Insurance a
        JOIN Insurance b
        ON a.pid <> b.pid AND a.lat = b.lat AND a.lon = b.lon    
)

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (SELECT tiv_2015 FROM Tiv2015_Rank_Count) 
        AND pid NOT IN (SELECT pid FROM Same_Citites_Investment);
