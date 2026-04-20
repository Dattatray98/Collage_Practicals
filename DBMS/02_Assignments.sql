-- Department Table
CREATE TABLE Department (
    dept_id NUMBER PRIMARY KEY, -- primary key
    dept_name VARCHAR2(50) NOT NULL UNIQUE, -- not null + unique
    location VARCHAR2(50) DEFAULT 'Pune' -- default value
);

-- Student Table
CREATE TABLE Student (
    student_id NUMBER,
    name VARCHAR2(50) NOT NULL,
    age NUMBER CHECK (age >= 18), -- check
    email VARCHAR2(100) UNIQUE,
    dept_id NUMBER,
    
    -- primary key
    CONSTRAINT pk_student PRIMARY KEY (student_id),
    
    -- foreign key
    CONSTRAINT fk_dept FOREIGN KEY (dept_id)
    REFERENCES Department(dept_id)
);

INSERT INTO Department VALUES (1, 'Computer', 'Block A');
INSERT INTO Department VALUES (2, 'Mechanical', 'Block B');

INSERT INTO Student VALUES (101, 'Rahul', 20, 'rahul@gmail.com', 1);
INSERT INTO Student VALUES (102, 'Sneha', 22, 'sneha@gmail.com', 2);


-- ADD column
ALTER TABLE Student ADD phone VARCHAR2(15);

-- MODIFY column
ALTER TABLE Student MODIFY name VARCHAR2(100);

-- ADD constraint
ALTER TABLE Student ADD CONSTRAINT chk_age CHECK (age <= 60);

-- DROP column
ALTER TABLE Student DROP COLUMN phone;

-- RENAME TABLE (Oracle)
ALTER TABLE Student RENAME TO Student_Info;

-- DROP PRIMARY KEY
ALTER TABLE Student_Info DROP CONSTRAINT pk_student;

-- DROP FOREIGN KEY
ALTER TABLE Student_Info DROP CONSTRAINT fk_dept;

-- UNIQUE on multiple columns
ALTER TABLE Student_Info
ADD CONSTRAINT unique_combo UNIQUE (email, dept_id);

-- ADD DEFAULT using ALTER
ALTER TABLE Student_Info MODIFY dept_id DEFAULT 1;

-- REMOVE DEFAULT
ALTER TABLE Student_Info MODIFY dept_id DEFAULT NULL;

-- CREATE VIEW
CREATE VIEW student_view AS
SELECT name, age FROM Student_Info;

-- UPDATE VIEW (Oracle uses replace)
CREATE OR REPLACE VIEW student_view AS
SELECT name, age, dept_id FROM Student_Info;

-- SELECT
SELECT * FROM student_view;

-- SHOW INDEX
SELECT * FROM USER_INDEXES WHERE TABLE_NAME = 'STUDENT_INFO';

-- DROP VIEW
DROP VIEW student_view;

-- CREATE INDEX
CREATE INDEX idx_name
ON Student_Info(name);

-- UNIQUE INDEX
CREATE UNIQUE INDEX idx_email
ON Student_Info(email);

-- DROP INDEX
DROP INDEX idx_name;

-- CREATE SEQUENCE
CREATE SEQUENCE student_seq
START WITH 1
INCREMENT BY 1;

-- USE SEQUENCE
INSERT INTO Student_Info
VALUES (student_seq.NEXTVAL, 'Amit', 21, 'amit@gmail.com', 1);

-- CREATE SYNONYM
CREATE SYNONYM stu FOR Student_Info;

-- USE SYNONYM
SELECT * FROM stu;

-- DROP SYNONYM
DROP SYNONYM stu;

-- TRUNCATE
TRUNCATE TABLE Student_Info;

-- DROP TABLE
DROP TABLE Student_Info;
DROP TABLE Department;