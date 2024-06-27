/* Write your T-SQL query statement below */
SELECT name, travelled_distance
FROM
    (SELECT u.id, u.name, ISNULL(SUM(r.distance), 0) AS travelled_distance
    FROM Users u
        LEFT JOIN Rides r
        ON u.id = r.user_id
    GROUP BY u.id, u.name) AS Join_Table
ORDER BY travelled_distance DESC, name ASC;