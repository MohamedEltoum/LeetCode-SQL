/* Write your T-SQL query statement below */
SELECT P.PRODUCT_NAME, S.YEAR, S.PRICE
FROM SALES AS S LEFT JOIN PRODUCT AS P
ON S.PRODUCT_ID = P.PRODUCT_ID
WHERE P.PRODUCT_NAME IS NOT NULL AND S.PRICE IS NOT NULL;