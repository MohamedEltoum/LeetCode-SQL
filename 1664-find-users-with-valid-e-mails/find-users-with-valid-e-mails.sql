/* Write your T-SQL query statement below */
SELECT *
FROM Users
WHERE mail LIKE '%@leetcode.com'
        AND mail NOT LIKE '[0-9-._]%'
        AND SUBSTRING(mail, 1, LEN(mail) - 13) NOT LIKE '%[&*#(%)@{}`!~$^=+/\|,]%';