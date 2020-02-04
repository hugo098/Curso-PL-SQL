SET SERVEROUTPUT ON

DECLARE
    empl      employees%rowtype;
    code      NUMBER;
    message   VARCHAR2(100);
BEGIN
    SELECT
        *
    INTO empl
    FROM
        employees;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlcode);
        dbms_output.put_line(sqlerrm);
        code := sqlcode;
        message := sqlerrm;
        INSERT INTO errors VALUES (
            code,
            message
        );

        COMMIT;
END;