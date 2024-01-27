/* Write your T-SQL query statement below */
SELECT A.MACHINE_ID, ROUND(AVG(B.timestamp - A.timestamp), 3) AS processing_time
FROM ACTIVITY A, ACTIVITY B
WHERE A.process_id = B.process_id AND A.machine_id = B.machine_id AND A.activity_type = 'start' AND B.activity_type = 'end'
GROUP BY A.MACHINE_ID
ORDER BY A.MACHINE_ID;