SET SERVEROUTPUT ON

DECLARE
    salario_empleado employees.salary%TYPE;
    sql_code_error number;
    sql_code_message varchar2(100);
BEGIN
    SELECT
        salary
    INTO salario_empleado
    FROM
        employees
    WHERE
        employee_id = 100;

    salario_empleado := salario_empleado / 0;
    dbms_output.put_line(salario_empleado);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('EMPLEADO INEXISTENTE');
    WHEN too_many_rows THEN
        dbms_output.put_line('DEMASIADOS EMPLEADOS EN LA CONSULTA');
    WHEN zero_divide THEN
        sql_code_error:=sqlcode;
        sql_code_message:=sqlerrm;
        dbms_output.put_line('ERROR: ' || sql_code_error);
        dbms_output.put_line(sql_code_message);
END;