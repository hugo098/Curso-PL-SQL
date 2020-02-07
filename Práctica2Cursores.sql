SET SERVEROUTPUT ON

DECLARE
    department departments%rowtype;
    CURSOR c1 IS
    SELECT
        *
    FROM
        employees;

    CURSOR c2 (
        mng_id NUMBER
    ) IS
    SELECT
        *
    FROM
        departments
    WHERE
        manager_id = mng_id;

BEGIN
    FOR i IN c1 LOOP
        OPEN c2(i.employee_id);
        FETCH c2 INTO department;
        IF c2%notfound THEN
            dbms_output.put_line(i.first_name
                                 || ' '
                                 || i.last_name
                                 || ' no es jefe de ningún departamento');
        ELSE
            dbms_output.put_line(i.first_name
                                 || ' '
                                 || i.last_name
                                 || '  es jefe de '
                                 || department.department_name);
        END IF;

        CLOSE c2;
    END LOOP;
END;