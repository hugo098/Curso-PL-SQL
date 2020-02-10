CREATE OR REPLACE PACKAGE nomina IS
    FUNCTION calcular_nomina (
        cod NUMBER
    ) RETURN NUMBER;

    FUNCTION calcular_nomina (
        cod   NUMBER,
        por   NUMBER
    ) RETURN NUMBER;

    FUNCTION calcular_nomina (
        cod     NUMBER,
        por     NUMBER,
        comis   CHAR
    ) RETURN NUMBER;

END nomina;
/

CREATE OR REPLACE PACKAGE BODY nomina IS

    FUNCTION calcular_nomina (
        cod NUMBER
    ) RETURN NUMBER IS
        v employees.salary%TYPE;
    BEGIN
        SELECT
            salary
        INTO v
        FROM
            employees
        WHERE
            employee_id = cod;

        v := v - ( v * 0.15 );
        RETURN v;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('NO EXISTE EL EMPLEADO');
    END calcular_nomina;

    FUNCTION calcular_nomina (
        cod   NUMBER,
        por   NUMBER
    ) RETURN NUMBER IS
        v employees.salary%TYPE;
    BEGIN
        SELECT
            salary
        INTO v
        FROM
            employees
        WHERE
            employee_id = cod;

        v := v - ( v * por / 100 );
        RETURN v;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('NO EXISTE EL EMPLEADO');
    END calcular_nomina;

    FUNCTION calcular_nomina (
        cod     NUMBER,
        por     NUMBER,
        comis   CHAR
    ) RETURN NUMBER IS
        v   employees.salary%TYPE;
        c   employees.commission_pct%TYPE;
    BEGIN
        SELECT
            salary,
            commission_pct
        INTO
            v,
            c
        FROM
            employees
        WHERE
            employee_id = cod;

        IF c IS NOT NULL THEN
            v := v + ( v * c );
        END IF;

        v := v - ( v * por / 100 );
        RETURN v;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('NO EXISTE EL EMPLEADO');
    END calcular_nomina;

END nomina;
/

SET SERVEROUTPUT ON

DECLARE
    s NUMBER;
BEGIN
    s := nomina.calcular_nomina(100);
    dbms_output.put_line(s);
    s := nomina.calcular_nomina(100, 10);
    dbms_output.put_line(s);
    s := nomina.calcular_nomina(145, 10, 'v');
    dbms_output.put_line(s);
END;