# Case Study: Library Management System

## Introduction
The Library Management System (LMS) is designed to manage the operations of a college library. It tracks students, authors, publishers, books, and the records of books issued to students.

## Functional Requirements
1.  **Student Management**: The system should store details about students who are members of the library, including their ID, name, department, and email.
2.  **Author & Publisher Management**: The system should maintain records of authors who write the books and publishers who publish them.
3.  **Book Inventory**: Each book in the library has a title, author, publisher, and quantity available.
4.  **Transaction Tracking**: The system must record when a student issues a book and when they return it.

## Entities and Attributes
- **Student**: `Student_ID` (PK), `Name`, `Department`, `Email`.
- **Author**: `Author_ID` (PK), `Author_Name`.
- **Publisher**: `Publisher_ID` (PK), `Publisher_Name`.
- **Book**: `Book_ID` (PK), `Title`, `Author_ID` (FK), `Publisher_ID` (FK), `Quantity`.
- **Issue_Record**: `Issue_ID` (PK), `Student_ID` (FK), `Book_ID` (FK), `Issue_Date`, `Return_Date`.
