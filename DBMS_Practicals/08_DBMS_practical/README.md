# Practical 08: Database Triggers

## Objective
Implement and test triggers to maintain data integrity and automate tasks in the database.

## Steps Performed
1.  **Before Insert Trigger**: Validates that the return date is after the issue date.
2.  **After Insert Trigger**: Automatically decrements the book quantity in the `Book` table whenever a new record is added to `Issue_Record`.
3.  **After Delete Trigger**: Automatically increments the book quantity when a book is returned (or record deleted).

## Files in this Portfolio
- `Triggers.sql`: SQL script defining and testing database triggers.
