-- Oracle Subqueries

-- 1. Simple Subquery in WHERE clause
-- Get students who have issued books
SELECT * FROM Student 
WHERE Student_ID IN (SELECT Student_ID FROM Issue_Record);

-- 2. Subquery with Aggregate
-- Get books with more than average quantity
SELECT Title, Quantity 
FROM Book 
WHERE Quantity > (SELECT AVG(Quantity) FROM Book);

-- 3. Subquery in FROM clause (Derived Table)
-- Find the max number of books issued by any student
SELECT MAX(IssueCount) FROM (
    SELECT COUNT(*) AS IssueCount 
    FROM Issue_Record 
    GROUP BY Student_ID
) StudentIssues;

-- 4. Correlated Subquery
-- Find students who have issued a specific book (e.g., Book_ID 1)
SELECT Name FROM Student S
WHERE EXISTS (
    SELECT 1 FROM Issue_Record I 
    WHERE I.Student_ID = S.Student_ID AND I.Book_ID = 1
);
