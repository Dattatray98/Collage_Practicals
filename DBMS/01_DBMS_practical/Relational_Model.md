# Relational Model: Library Management System

The conceptual ER Model is mapped to the following relational schema:

### 1. Student Table
- `Student_ID` (INT, PK)
- `Name` (VARCHAR(50))
- `Department` (VARCHAR(50))
- `Email` (VARCHAR(100), UNIQUE)

### 2. Author Table
- `Author_ID` (INT, PK)
- `Author_Name` (VARCHAR(50))

### 3. Publisher Table
- `Publisher_ID` (INT, PK)
- `Publisher_Name` (VARCHAR(50))

### 4. Book Table
- `Book_ID` (INT, PK)
- `Title` (VARCHAR(100))
- `Author_ID` (INT, FK -> Author.Author_ID)
- `Publisher_ID` (INT, FK -> Publisher.Publisher_ID)
- `Quantity` (INT)

### 5. Issue_Record Table
- `Issue_ID` (INT, PK)
- `Student_ID` (INT, FK -> Student.Student_ID)
- `Book_ID` (INT, FK -> Book.Book_ID)
- `Issue_Date` (DATE)
- `Return_Date` (DATE, NULLABLE)
