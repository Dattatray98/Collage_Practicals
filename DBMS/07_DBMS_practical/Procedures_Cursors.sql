-- Oracle PL/SQL: Procedures and Functions with Cursors

-- Enable output in SQL*Plus or SQL Developer
-- SET SERVEROUTPUT ON;

-- 1. Stored Procedure with Cursors
CREATE OR REPLACE PROCEDURE CheckBookStatus AS
    CURSOR cur IS SELECT Title, Quantity FROM Book;
    b_title VARCHAR2(100);
    b_qty NUMBER;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO b_title, b_qty;
        EXIT WHEN cur%NOTFOUND;
        
        IF b_qty > 0 THEN
            DBMS_OUTPUT.PUT_LINE(b_title || ' is in stock with ' || b_qty || ' copies');
        ELSE
            DBMS_OUTPUT.PUT_LINE(b_title || ' is OUT OF STOCK');
        END IF;
    END LOOP;
    CLOSE cur;
END;
/

-- 2. Stored Function
CREATE OR REPLACE FUNCTION GetAuthorName(a_id IN NUMBER) 
RETURN VARCHAR2 IS
    a_name VARCHAR2(50);
BEGIN
    SELECT Author_Name INTO a_name FROM Author WHERE Author_ID = a_id;
    RETURN a_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Not Found';
END;
/

-- Testing
-- EXEC CheckBookStatus;
-- SELECT GetAuthorName(1) FROM DUAL;
