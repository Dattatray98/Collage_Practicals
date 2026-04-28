```
Table Student {
  Student_ID int [pk] // Primary Key
  Name varchar(50) [not null]
  Department varchar(50)
  Email varchar(100) [unique]
}

Table Author {
  Author_ID int [pk]
  Author_Name varchar(50) [not null]
}

Table Publisher {
  Publisher_ID int [pk]
  Publisher_Name varchar(50) [not null]
}

Table Book {
  Book_ID int [pk]
  Title varchar(100) [not null]
  Author_ID int
  Publisher_ID int
  Quantity int [note: '>= 0']
}

Table Issue_Record {
  Issue_ID int [pk]
  Student_ID int
  Book_ID int
  Issue_Date date
  Return_Date date
}

-- Relationships

Ref: Book.Author_ID > Author.Author_ID // ON DELETE SET NULL
Ref: Book.Publisher_ID > Publisher.Publisher_ID // ON DELETE SET NULL

Ref: Issue_Record.Student_ID > Student.Student_ID // ON DELETE CASCADE
Ref: Issue_Record.Book_ID > Book.Book_ID // ON DELETE CASCADE
```