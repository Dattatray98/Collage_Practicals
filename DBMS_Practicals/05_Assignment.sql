-- INNER JOIN
SELECT s.name, d.dept_name
FROM Student s
INNER JOIN Department d
ON s.dept_id = d.dept_id;

-- LEFT JOIN
SELECT s.name, d.dept_name
FROM Student s
LEFT JOIN Department d
ON s.dept_id = d.dept_id;

-- RIGHT JOIN
SELECT s.name, d.dept_name
FROM Student s
RIGHT JOIN Department d
ON s.dept_id = d.dept_id;

-- CROSS JOIN
SELECT s.name, d.dept_name
FROM Student s CROSS JOIN Department d;

-- SELF JOIN
SELECT a.name, b.name
FROM Student a, Student b
WHERE a.dept_id = b.dept_id AND a.student_id <> b.student_id;

-- Theta Join (old style)
SELECT s.name, d.dept_name
FROM Student s, Department d
WHERE s.dept_id = d.dept_id;

-- CREATE VIEW
CREATE VIEW student_view AS
SELECT name, age FROM Student;

-- SELECT FROM VIEW
SELECT * FROM student_view;

-- DROP VIEW
DROP VIEW student_view;