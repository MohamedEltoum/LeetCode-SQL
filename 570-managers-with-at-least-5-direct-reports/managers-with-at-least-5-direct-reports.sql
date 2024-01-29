/* Write your T-SQL query statement below */
SELECT M.NAME
FROM EMPLOYEE M 
JOIN EMPLOYEE E
ON M.ID = E.MANAGERID 
GROUP BY M.NAME, M.ID
HAVING COUNT(M.id) >= 5;
