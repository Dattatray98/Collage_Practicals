-- Oracle DDL Script

-- 1. Create Tables with Constraints
CREATE TABLE Student (
    Student_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(50) NOT NULL,
    Department VARCHAR2(50),
    Email VARCHAR2(100) UNIQUE
);

CREATE TABLE Author (
    Author_ID NUMBER PRIMARY KEY,
    Author_Name VARCHAR2(50) NOT NULL
);

CREATE TABLE Publisher (
    Publisher_ID NUMBER PRIMARY KEY,
    Publisher_Name VARCHAR2(50) NOT NULL
);

CREATE TABLE Book (
    Book_ID NUMBER PRIMARY KEY,
    Title VARCHAR2(100) NOT NULL,
    Author_ID NUMBER,
    Publisher_ID NUMBER,
    Quantity NUMBER CHECK (Quantity >= 0),
    CONSTRAINT fk_author FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID) ON DELETE SET NULL,
    CONSTRAINT fk_publisher FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID) ON DELETE SET NULL
);

CREATE TABLE Issue_Record (
    Issue_ID NUMBER PRIMARY KEY,
    Student_ID NUMBER,
    Book_ID NUMBER,
    Issue_Date DATE,
    Return_Date DATE,
    CONSTRAINT fk_student FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE,
    CONSTRAINT fk_book FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID) ON DELETE CASCADE
);

-- 2. Demonstrating ALTER Command
ALTER TABLE Student ADD Phone_Number VARCHAR2(15);

-- 3. Insert Data
INSERT INTO Student VALUES (2, 'Jojewar Dattatray', 'CS', 'jojewardattatray@gmail.com', '1234567890');
INSERT INTO Author VALUES (2, 'vedant');
INSERT INTO Publisher VALUES (2, 'Penguin');
INSERT INTO Book VALUES (2, 'GOT', 1, 1, 5);
INSERT INTO Issue_Record VALUES (2, 1, 1, TO_DATE('2026-04-01', 'YYYY-MM-DD'), TO_DATE('2026-04-10', 'YYYY-MM-DD'));

COMMIT;


SELECT * FROM Student;