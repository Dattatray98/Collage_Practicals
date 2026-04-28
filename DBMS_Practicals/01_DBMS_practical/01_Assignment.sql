-- DROP TABLES (ignore error if not exists)

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Issue_Record';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Book';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Author';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Publisher';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Student';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- CREATE TABLE Student
CREATE TABLE Student (
    Student_ID NUMBER PRIMARY KEY, -- INT -> NUMBER
    Name VARCHAR2(50) NOT NULL, -- VARCHAR -> VARCHAR2
    Department VARCHAR2(50),
    Email VARCHAR2(100) UNIQUE
);

-- CREATE TABLE Author
CREATE TABLE Author (
    Author_ID NUMBER PRIMARY KEY,
    Author_Name VARCHAR2(50) NOT NULL
);

-- CREATE TABLE Publisher
CREATE TABLE Publisher (
    Publisher_ID NUMBER PRIMARY KEY,
    Publisher_Name VARCHAR2(50) NOT NULL
);

-- CREATE TABLE Book
CREATE TABLE Book (
    Book_ID NUMBER PRIMARY KEY,
    Title VARCHAR2(100) NOT NULL,
    Author_ID NUMBER,
    Publisher_ID NUMBER,
    Quantity NUMBER CHECK (Quantity >= 0),

    CONSTRAINT fk_author FOREIGN KEY (Author_ID)
    REFERENCES Author(Author_ID)
    ON DELETE SET NULL,

    CONSTRAINT fk_publisher FOREIGN KEY (Publisher_ID)
    REFERENCES Publisher(Publisher_ID)
    ON DELETE SET NULL
);

-- CREATE TABLE Issue_Record
CREATE TABLE Issue_Record (
    Issue_ID NUMBER PRIMARY KEY,
    Student_ID NUMBER,
    Book_ID NUMBER,
    Issue_Date DATE,
    Return_Date DATE,

    CONSTRAINT fk_student FOREIGN KEY (Student_ID)
    REFERENCES Student(Student_ID)
    ON DELETE CASCADE,

    CONSTRAINT fk_book FOREIGN KEY (Book_ID)
    REFERENCES Book(Book_ID)
    ON DELETE CASCADE
);

---------------------------------------------------
-- INSERT DATA (Oracle does NOT support multi-row VALUES)
---------------------------------------------------

-- Student
INSERT INTO Student VALUES (1, 'pushpraj patil', 'CS', 'pushpa@gmail.com');
INSERT INTO Student VALUES (2, 'tejaswini lagad', 'IT', 'teju@gmail.com');

-- Author
INSERT INTO Author VALUES (1, 'sejal pathare');
INSERT INTO Author VALUES (2, 'srushti budhawant');

-- Publisher
INSERT INTO Publisher VALUES (1, 'Penguin');
INSERT INTO Publisher VALUES (2, 'HarperCollins');

-- Book
INSERT INTO Book VALUES (1, 'Half Girlfriend', 1, 1, 5);
INSERT INTO Book VALUES (2, 'Malgudi Days', 2, 2, 3);

-- Issue_Record (DATE format fix)
INSERT INTO Issue_Record VALUES (1, 1, 1, DATE '2026-04-01', DATE '2026-04-10');
INSERT INTO Issue_Record VALUES (2, 2, 2, DATE '2026-04-05', NULL);

---------------------------------------------------
-- SELECT
---------------------------------------------------

SELECT * FROM Student;
SELECT * FROM Author;
SELECT * FROM Publisher;
SELECT * FROM Book;
SELECT * FROM Issue_Record;