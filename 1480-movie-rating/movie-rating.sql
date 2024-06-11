/* Write your T-SQL query statement below */
WITH Joined_Movies_Rating AS (
    SELECT m.movie_id, m.title, u.user_id, u.name, r.rating, r.created_at
    FROM MovieRating r
        JOIN Movies m ON r.movie_id = m.movie_id
        JOIN Users u ON r.user_id = u.user_id
), Users_Rating AS (
    SELECT name, COUNT(movie_id) AS rated_movies_count
    FROM Joined_Movies_Rating
    GROUP BY name
), Movies_Rating AS (
    SELECT title, AVG(rating * 1.00)  AS movie_rating_avg
    FROM Joined_Movies_Rating
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-28'
    GROUP BY title
)

SELECT name AS results
FROM Users_Rating
WHERE name IN (SELECT TOP 1 name 
                FROM Users_Rating 
                ORDER BY rated_movies_count DESC, name ASC)
UNION ALL
SELECT title AS results
FROM Movies_Rating
WHERE title IN (SELECT TOP 1 title 
                FROM Movies_Rating 
                ORDER BY movie_rating_avg DESC, title ASC)