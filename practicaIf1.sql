SET SERVEROUTPUT ON

DECLARE
    numero NUMBER := 137;
BEGIN
    IF ( MOD(numero, 2) = 0 ) THEN
        dbms_output.put_line(numero || ' ES PAR');
    ELSE
        dbms_output.put_line(numero || ' ES IMPAR');
    END IF;
END;