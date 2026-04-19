-- Oracle DML, DCL, and TCL Operations

-- 1. Data Manipulation Language (DML)
UPDATE Student 
SET Email = 'p_patil_new@gmail.com' 
WHERE Student_ID = 1;

UPDATE Book 
SET Quantity = Quantity + 5 
WHERE Quantity < 10;

DELETE FROM Issue_Record 
WHERE Return_Date < TO_DATE('2026-04-05', 'YYYY-MM-DD');

SELECT * FROM Student WHERE Name LIKE 'P%';

-- 2. Data Control Language (DCL)
-- GRANT SELECT, INSERT ON Book TO some_user;
-- REVOKE INSERT ON Book FROM some_user;

-- 3. Transaction Control Language (TCL)
-- Transaction is implicit in Oracle
UPDATE Book SET Quantity = Quantity - 1 WHERE Book_ID = 1;
SAVEPOINT inventory_updated;

INSERT INTO Issue_Record (Issue_ID, Student_ID, Book_ID, Issue_Date)
VALUES (10, 1, 1, SYSDATE);

-- Decide to rollback to savepoint
-- ROLLBACK TO inventory_updated;

-- Or commit all changes
COMMIT;

SELECT * FROM ISSUE_RECORD;