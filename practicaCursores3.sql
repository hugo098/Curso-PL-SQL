SET SERVEROUTPUT ON

DECLARE
    dpto_id     departments.department_id%TYPE;
    CURSOR c1 (
        dpto_id departments.department_id%TYPE
    ) IS
    SELECT
        COUNT(*)
    FROM
        employees
    WHERE
        department_id = dpto_id;

    num_emple   NUMBER;
BEGIN
    dpto_id := 50;
    OPEN c1(dpto_id);
    FETCH c1 INTO num_emple;
    dbms_output.put_line(num_emple);
    CLOSE c1;
END;