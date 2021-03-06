CREATE OR REPLACE PROCEDURE calc_tax_in_out (
    empl   IN      employees.employee_id%TYPE,
    t1     IN OUT  NUMBER
) IS
    sal NUMBER := 0;
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

    dbms_output.put_line('T1: ' || t1);
    t1 := sal * t1 / 100;
    
    --dbms_output.put_line('SALARY: ' || sal);
    --dbms_output.put_line('TAX: ' || tax);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('NO EXISTE EL EMPLEADO');
END;