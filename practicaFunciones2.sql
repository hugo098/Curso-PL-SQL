CREATE OR REPLACE FUNCTION dpto (
    nro_dpto departments.department_id%TYPE, 
    nro_empl out number
) RETURN NUMBER AS

    CURSOR depto (
        p NUMBER
    ) IS
    SELECT
        department_id
    FROM
        departments
    WHERE
        department_id = p;

    CURSOR salary (
        x NUMBER
    ) IS
    SELECT
        SUM(salary), count(salary)
    FROM
        employees
    WHERE
        department_id = x;

    nrodpto   NUMBER;
    sal       NUMBER;
BEGIN
    OPEN depto(nro_dpto);
    FETCH depto INTO nrodpto;
    IF ( depto%notfound ) THEN
        raise_application_error(-20000, 'No hay registro');
    ELSE
        OPEN salary(nrodpto);
        FETCH salary INTO sal, nro_empl;
        CLOSE salary;
        CLOSE depto;
    END IF;

    RETURN sal;
END dpto;
/

SET SERVEROUTPUT ON

DECLARE
    a NUMBER;
    b number:=0;
BEGIN
    a := dpto(100, b);
    dbms_output.put_line(a);
    dbms_output.put_line(b);
END;

/



