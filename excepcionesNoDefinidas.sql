SET SERVEROUTPUT ON

DECLARE
    mi_exception EXCEPTION;
    PRAGMA exception_init ( mi_exception, -937 );
    v1   NUMBER;
    v2   NUMBER;
BEGIN
    SELECT
        employee_id,
        SUM(salary)
    INTO
        v1,
        v2
    FROM
        employees;

    dbms_output.put_line(v1);
EXCEPTION
    WHEN mi_exception THEN
        dbms_output.put_line('FUNCION DE GRUPO INCORRECTA');
    WHEN OTHERS THEN
        dbms_output.put_line('ERRO NO DEFINIDO');
END;