DECLARE
    CURSOR c1 (
        sal NUMBER
    ) IS
    SELECT
        *
    FROM
        employees
    WHERE
        salary > sal;

    empl employees%rowtype;
BEGIN
    OPEN c1(10000);
    LOOP
        FETCH c1 INTO empl;
        EXIT WHEN c1%notfound;
        dbms_output.put_line(empl.first_name
                             || ' '
                             || empl.salary);
    END LOOP;

    dbms_output.put_line('He encontrado '
                         || c1%rowcount
                         || ' empleados');
    CLOSE c1;
END;