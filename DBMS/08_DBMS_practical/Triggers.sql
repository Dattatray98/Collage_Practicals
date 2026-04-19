-- Oracle Triggers

-- 1. Trigger to decrement stock on book issue
CREATE OR REPLACE TRIGGER AfterBookIssue
AFTER INSERT ON Issue_Record
FOR EACH ROW
BEGIN
    UPDATE Book 
    SET Quantity = Quantity - 1 
    WHERE Book_ID = :NEW.Book_ID;
END;
/

-- 2. Trigger to increment stock on book return (deletion of record)
CREATE OR REPLACE TRIGGER AfterBookReturn
AFTER DELETE ON Issue_Record
FOR EACH ROW
BEGIN
    UPDATE Book 
    SET Quantity = Quantity + 1 
    WHERE Book_ID = :OLD.Book_ID;
END;
/

-- 3. Trigger for Validation (Before Insert)
CREATE OR REPLACE TRIGGER CheckDateValidity
BEFORE INSERT ON Issue_Record
FOR EACH ROW
BEGIN
    IF :NEW.Issue_Date > :NEW.Return_Date THEN
        RAISE_APPLICATION_ERROR(-20001, 'Return date cannot be earlier than issue date');
    END IF;
END;
/
