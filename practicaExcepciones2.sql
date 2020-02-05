SET SERVEROUTPUT ON

DECLARE
    nombre_empleado employees.first_name%TYPE;
BEGIN
    SELECT
        first_name
    INTO nombre_empleado
    FROM
        employees;

    dbms_output.put_line(nombre_empleado);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('EMPLEADO INEXISTENTE');
    WHEN too_many_rows THEN
        dbms_output.put_line('DEMASIADOS EMPLEADOS EN LA CONSULTA');
END;