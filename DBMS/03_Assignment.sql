-- INSERT
INSERT INTO Student VALUES (103, 'Amit', 19, 'amit@gmail.com', 1);

-- UPDATE
UPDATE Student
SET age = 21
WHERE student_id = 101;

-- DELETE
DELETE FROM Student
WHERE student_id = 103;

-- SELECT
SELECT * FROM Student;

-- IS NULL
SELECT * FROM Student WHERE email IS NULL;

-- IS NOT NULL
SELECT * FROM Student WHERE email IS NOT NULL;

-- Logical
SELECT * FROM Student WHERE age > 20 AND dept_id = 1;

-- MINUS (Oracle)
SELECT name FROM Student
MINUS
SELECT name FROM Student WHERE dept_id = 1;

-- Arithmetic operation
SELECT name, age, age + 5 AS future_age FROM Student;

-- Pattern matching
SELECT * FROM Student WHERE name LIKE 'R%';

-- String function
SELECT UPPER(name) FROM Student;

-- Set operator
SELECT name FROM Student WHERE dept_id = 1
UNION
SELECT name FROM Student WHERE age > 20;

-- CASE
SELECT name,
CASE 
    WHEN age > 21 THEN 'Senior'
    ELSE 'Junior'
END AS category
FROM Student;

-- BETWEEN
SELECT * FROM Student
WHERE age BETWEEN 18 AND 22;

-- ANY
SELECT name FROM Student
WHERE dept_id = ANY (
    SELECT dept_id FROM Department
);

-- ALL
SELECT name FROM Student
WHERE age > ALL (
    SELECT age FROM Student WHERE dept_id = 1
);


-- START TRANSACTION (Oracle uses implicit)
SAVEPOINT sp1;

-- INSERT
INSERT INTO Student VALUES (104, 'Priya', 22, 'priya@gmail.com', 2);

-- ROLLBACK
ROLLBACK TO sp1;

-- COMMIT
COMMIT;
