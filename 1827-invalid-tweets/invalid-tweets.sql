/* Write your T-SQL query statement below */
SELECT tweet_id
FROM Tweets
GROUP BY tweet_id, LEN(content)
HAVING LEN(content) > 15;