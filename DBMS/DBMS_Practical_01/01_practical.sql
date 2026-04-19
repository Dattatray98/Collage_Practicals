CREATE DATABASE Library1;
USE Library1;

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Author (
    Author_ID INT PRIMARY KEY,
    Author_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Publisher (
    Publisher_ID INT PRIMARY KEY,
    Publisher_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Book (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author_ID INT,
    Publisher_ID INT,
    Quantity INT CHECK (Quantity >= 0),
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID)
        ON DELETE SET NULL,
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID)
        ON DELETE SET NULL
);

CREATE TABLE Issue_Record (
    Issue_ID INT PRIMARY KEY,
    Student_ID INT,
    Book_ID INT,
    Issue_Date DATE,
    Return_Date DATE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
        ON DELETE CASCADE
);

INSERT INTO Student VALUES
(1, 'pushpraj patil', 'CS', 'pushpa@gmail.com'),
(2, 'tejaswini lagad', 'IT', 'teju@gmail.com');

INSERT INTO Author VALUES
(1, 'sejal pathare'),
(2, 'srushti budhawant');

INSERT INTO Publisher VALUES
(1, 'Penguin'),
(2, 'HarperCollins');

INSERT INTO Book VALUES
(01, 'Half Girlfriend', 1, 1, 5),
(02, 'Malgudi Days', 2, 2, 3);

INSERT INTO Issue_Record VALUES
(1, 1, 01, '2026-04-01', '2026-04-10'),
(2, 2, 02, '2026-04-05', NULL);

SELECT * FROM Student;
SELECT * FROM Author;
SELECT * FROM Publisher;
SELECT * FROM Book;
SELECT * FROM Issue_Record;
