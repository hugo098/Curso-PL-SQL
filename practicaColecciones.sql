SET SERVEROUTPUT ON

DECLARE
    TYPE empleado IS RECORD (
        name       VARCHAR2(100),
        sal        employees.salary%TYPE,
        cod_dept   employees.department_id%TYPE
    );
    TYPE empleados IS
        TABLE OF empleado INDEX BY PLS_INTEGER;
    empls empleados;
BEGIN
    FOR i IN 100..206 LOOP SELECT
                               first_name
                               || ' '
                               || last_name,
                               salary,
                               department_id
                           INTO
                               empls(i).name,
                               empls(i).sal,
                               empls(i).cod_dept
                           FROM
                               employees
                           WHERE
                               employee_id = i;

    END LOOP;

    FOR i IN empls.first..empls.last LOOP
        dbms_output.put_line('---------Empleado '
                             || i
                             || '---------');
        dbms_output.put_line('Nombre: ' || empls(i).name);
        dbms_output.put_line('Salario: ' || empls(i).sal);
        dbms_output.put_line('Cod. depto: ' || empls(i).cod_dept);
    END LOOP;

    dbms_output.put_line('El primer empleado es: ' || empls.first);
    dbms_output.put_line('El ultimo empleado es: ' || empls.last);
    dbms_output.put_line('La cantidad de empleado es: ' || empls.count);
    FOR i IN empls.first..empls.last LOOP IF empls(i).sal < 7000 THEN
        empls.DELETE(i);
    END IF;
    END LOOP;

    dbms_output.put_line('La cantidad de empleado despues del filtro es: ' || empls.count);
END;