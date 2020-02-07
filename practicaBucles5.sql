SET SERVEROUTPUT ON

DECLARE
    inicio   NUMBER := 1;
    fin      NUMBER := 20;
BEGIN
    FOR i IN inicio..fin LOOP
        IF ( MOD(i, 4) = 0 ) THEN
            dbms_output.put_line(i);
        END IF;
    END LOOP;
END;
