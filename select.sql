SET SERVEROUTPUT ON

DECLARE
    salario   employees.salary%TYPE;
    nombre    employees.first_name%TYPE;
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
END;