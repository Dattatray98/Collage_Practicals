-- Oracle Join Queries and Views

-- 1. INNER JOIN (Only records with matches in both)
-- Get Book titles and their Author names
SELECT B.Title, A.Author_Name
FROM Book B
INNER JOIN Author A ON B.Author_ID = A.Author_ID;

-- 2. LEFT JOIN (All books, even if no issues exist)
SELECT B.Title, I.Issue_Date
FROM Book B
LEFT JOIN Issue_Record I ON B.Book_ID = I.Book_ID;

-- 3. Complex JOIN (Joining 3 tables)
SELECT S.Name, B.Title, I.Issue_Date
FROM Issue_Record I
JOIN Student S ON I.Student_ID = S.Student_ID
JOIN Book B ON I.Book_ID = B.Book_ID;

-- 4. Create a VIEW
CREATE VIEW Issued_Books_Summary AS
SELECT S.Name AS Student_Name, B.Title AS Book_Title, I.Issue_Date
FROM Issue_Record I
JOIN Student S ON I.Student_ID = S.Student_ID
JOIN Book B ON I.Book_ID = B.Book_ID;

-- 5. Using the VIEW
SELECT * FROM Issued_Books_Summary;

-- 6. Drop the VIEW
-- DROP VIEW Issued_Books_Summary;
