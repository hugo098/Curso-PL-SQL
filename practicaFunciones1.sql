CREATE OR REPLACE FUNCTION dpto (
    nro_dpto departments.department_id%TYPE
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
        SUM(salary)
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
        FETCH salary INTO sal;
        CLOSE salary;
        CLOSE depto;
    END IF;

    RETURN sal;
END dpto;
/

SET SERVEROUTPUT ON

DECLARE
    a NUMBER;
BEGIN
    a := dpto(100);
    dbms_output.put_line(a);
END;

/

