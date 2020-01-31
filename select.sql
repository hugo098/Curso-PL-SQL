SET SERVEROUTPUT ON

DECLARE
    salario    employees.salary%TYPE;
    nombre     employees.first_name%TYPE;
    empleado   employees%rowtype;
BEGIN
    SELECT  --SOLO PUEDE DEVOLVER UNA FILA
        salary,
        first_name
    INTO
        salario,
        nombre
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line(salario);
    dbms_output.put_line(nombre);
    SELECT
        *
    INTO empleado
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line(empleado.salary);
    dbms_output.put_line(empleado.first_name);
END;