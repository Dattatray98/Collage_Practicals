-- Subquery
SELECT name
FROM Student
WHERE dept_id IN (
    SELECT dept_id FROM Department WHERE dept_name = 'Computer'
);

-- NOT IN
SELECT name FROM Student
WHERE dept_id NOT IN (
    SELECT dept_id FROM Department WHERE dept_name = 'Mechanical'
);

-- Subquery in SELECT
SELECT name,
       (SELECT COUNT(*) FROM Student) AS total_students
FROM Student;

-- Subquery in FROM
SELECT * 
FROM (SELECT name, age FROM Student) temp;


-- Subquery in HAVING
SELECT dept_id, COUNT(*)
FROM Student
GROUP BY dept_id
HAVING COUNT(*) > (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM Student
        GROUP BY dept_id
    )
);