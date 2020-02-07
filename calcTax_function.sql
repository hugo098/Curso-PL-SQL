CREATE OR REPLACE FUNCTION calc_tax_f (
    empl   IN      employees.employee_id%TYPE,
    t1     IN OUT  NUMBER
) RETURN NUMBER IS
    tax   NUMBER := 0;
    sal   NUMBER := 0;
BEGIN
    IF t1 < 0 OR t1 > 60 THEN
        raise_application_error(-20000, 'El porcentaje debe estar entre 0 y 60');
    END IF;

    SELECT
        salary
    INTO sal
    FROM
        employees
    WHERE
        employee_id = empl;

    tax := sal * t1 / 100;
    RETURN tax;
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('NO EXISTE EL EMPLEADO');
END;