-- SIMPLE PROCEDURE
CREATE OR REPLACE PROCEDURE show_students IS
BEGIN
    FOR rec IN (SELECT * FROM Student) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.name);
    END LOOP;
END;
/

-- CALL PROCEDURE
BEGIN
    show_students;
END;
/

-- Explicit Cursor Procedure
CREATE OR REPLACE PROCEDURE show_students_cursor IS
    CURSOR c1 IS SELECT name FROM Student;
    v_name Student.name%TYPE;
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO v_name;
        EXIT WHEN c1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_name);
    END LOOP;
    CLOSE c1;
END;
/

-- SIMPLE FUNCTION
CREATE OR REPLACE FUNCTION get_total_students
RETURN NUMBER
IS
    total NUMBER;
BEGIN
    SELECT COUNT(*) INTO total FROM Student;
    RETURN total;
END;
/