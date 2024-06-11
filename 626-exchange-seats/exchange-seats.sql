/* Write your T-SQL query statement below */
DECLARE @Groups_Count AS Integer = (SELECT CEILING(COUNT(*)/2.00) FROM Seat);
WITH Consecutive_Seats AS (
    SELECT id, student, NTILE(@Groups_Count) OVER (ORDER BY id) AS 'groupx'
    FROM Seat
), Grouped_Seats AS (
    SELECT f.id AS first_id, f.student AS first_student, f.groupx As first_groupx, 
            s.id AS second_id, s.student AS second_student, s.groupx AS second_groupx
    FROM Consecutive_Seats f
        JOIN Consecutive_Seats s 
        ON (f.id + 1 = s.id OR s.id - 1 = f.id) 
        AND f.groupx = s.groupx
), Union_Seat_Swap AS (
    SELECT first_id AS id, second_student AS student
    FROM Grouped_Seats
    UNION
    SELECT second_id AS id, first_student AS student
    FROM Grouped_Seats
    UNION
    SELECT id, student
    FROM Seat
    WHERE id NOT IN (SELECT first_id FROM Grouped_Seats) AND id NOT IN (SELECT second_id FROM Grouped_Seats)
)

SELECT * 
FROM Union_Seat_Swap
ORDER BY id;