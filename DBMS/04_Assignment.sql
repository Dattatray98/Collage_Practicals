-- COUNT
SELECT COUNT(*) FROM Student;

-- AVG
SELECT AVG(age) FROM Student;

-- GROUP BY
SELECT dept_id, COUNT(*)
FROM Student
GROUP BY dept_id;

-- HAVING
SELECT dept_id, COUNT(*)
FROM Student
GROUP BY dept_id
HAVING COUNT(*) > 1;

SELECT MIN(age), MAX(age), SUM(age) FROM Student;

SELECT COUNT(DISTINCT dept_id) FROM Student;