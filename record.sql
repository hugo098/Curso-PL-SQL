SET SERVEROUTPUT ON

DECLARE
    TYPE empleado IS RECORD (
        nombre    VARCHAR2(100),
        salario   NUMBER,
        fecha     employees.hire_date%TYPE,
        datos     employees%rowtype
    );
    empl1   empleado;
    empl2   empleado;
BEGIN
    SELECT
        *
    INTO empl1.datos
    FROM
        employees
    WHERE
        employee_id = 100;

    empl1.nombre := empl1.datos.first_name
                    || ' '
                    || empl1.datos.last_name;

    empl1.salario := empl1.datos.salary * 0.80;
    empl1.fecha := empl1.datos.hire_date;
    dbms_output.put_line(empl1.nombre);
    dbms_output.put_line(empl1.salario);
    dbms_output.put_line(empl1.fecha);
    dbms_output.put_line(empl1.datos.first_name);
    empl2 := empl1;
    dbms_output.put_line(empl2.datos.salary);
END;