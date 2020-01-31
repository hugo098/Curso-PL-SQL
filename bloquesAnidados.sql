SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 2560; --VARIABLE GLOBAL
BEGIN
    dbms_output.put_line('x:= ' || x);
    DECLARE
        x NUMBER := 10; --VARIABLE LOCAL
    BEGIN
        dbms_output.put_line('x:= ' || x);
    END;

END;