SET SERVEROUTPUT ON

DECLARE
    empl employees%rowtype;
BEGIN
    SELECT
        *
    INTO empl
    FROM
        employees
    WHERE
        employee_id >1;

    dbms_output.put_line(empl.first_name);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('ERROR: NO SE HA ENCONTRADO AL EMPLEADO');
    WHEN too_many_rows THEN
        dbms_output.put_line('ERROR: SE HAN ENCONTRADO MÁS DE UN EMPLEADO CON EL MISMO CRITERIO');
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR: INDEFINIDO');
END;