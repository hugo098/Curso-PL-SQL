SET SERVEROUTPUT ON

DECLARE
    salario_maximo   employees.salary%TYPE;
    empleado         employees%rowtype;
    tipo_trabajo     jobs.job_title%TYPE;
    id_department    departments.department_id%TYPE := 10;
    cant_empl        NUMBER;
    nombre_depto     departments.department_name%TYPE;
    salario_max      employees.salary%TYPE;
    salario_min      employees.salary%TYPE;
BEGIN
    --CONSULTA PARA OBTENER EL MAYOR SALARIO SEGÚN DEPARTAMENTO
    SELECT
        MAX(salary)
    INTO salario_maximo
    FROM
        employees
    WHERE
        department_id = 100;

    dbms_output.put_line('El salario máximo del departamento 100 es: ' || salario_maximo);
    
    --CONSULTA PARA LOS DATOS DE UN EMPLEADO
    SELECT
        *
    INTO empleado
    FROM
        employees
    WHERE
        employee_id = 100;

    --CONSULTA PARA OBTENER EL NOMBRE DEL DEPARTAMENTO SEGÚN ID DE EMPLEADO

    SELECT
        job_title
    INTO tipo_trabajo
    FROM
        jobs
    WHERE
        job_id = empleado.job_id;

    dbms_output.put_line('El tipo de trabajo del empleado '
                         || empleado.first_name
                         || ' '
                         || empleado.last_name
                         || ' es: '
                         || tipo_trabajo);
                         

    --CONSULTA PARA OBTENER EL NOMBRE DE UN DEPARTAMENTO SEGÍN ID

    SELECT
        department_name
    INTO nombre_depto
    FROM
        departments
    WHERE
        department_id = id_department;

    --CONSULTA PARA OBTERNER LA CANTIDAD DE EMPLEADOS SEGÚN DEPARTAMENTO

    SELECT
        COUNT(*)
    INTO cant_empl
    FROM
        employees
    WHERE
        department_id = id_department;

    dbms_output.put_line('El nombre del departamento con id '
                         || id_department
                         || ' es: '
                         || nombre_depto);
    dbms_output.put_line('La cantidad de empleados del departamento con id '
                         || id_department
                         || ' es: '
                         || cant_empl);
                         
    
    --CONSULTA PARA OBTENER EL MÁXIMO Y MÍNIMO SALARIO                    
    SELECT
        MAX(salary),
        MIN(salary)
    INTO
        salario_max,
        salario_min
    FROM
        employees;

    dbms_output.put_line('El salario máximo es: ' || salario_max);
    dbms_output.put_line('El salario mínimo es: ' || salario_min);
    dbms_output.put_line('La diferencia entre el salario máximo y mínimo es: ' ||(salario_max - salario_min));
END;