-- Oracle Aggregation Queries

-- 1. Count total number of books
SELECT COUNT(*) AS Total_Books FROM Book;

-- 2. Find total quantity of all books in library
SELECT SUM(Quantity) AS Global_Stock FROM Book;

-- 3. Find average quantity per book entry
SELECT AVG(Quantity) AS Avg_Stock FROM Book;

-- 4. Find max and min quantity
SELECT MAX(Quantity) AS Max_Qty, MIN(Quantity) AS Min_Qty FROM Book;

-- 5. Group by Publisher to see how many book types each has
SELECT Publisher_ID, COUNT(Book_ID) AS Book_Count 
FROM Book 
GROUP BY Publisher_ID;

-- 6. Group by Author and filter using HAVING
-- Show authors who have a total quantity of books across all titles > 10
SELECT Author_ID, SUM(Quantity) AS Total_Books_By_Author
FROM Book
GROUP BY Author_ID
HAVING SUM(Quantity) > 10;
