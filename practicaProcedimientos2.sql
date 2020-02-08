CREATE OR REPLACE PROCEDURE visualizar_2 (
    dpto_id    IN    departments.department_id%TYPE,
    cantidad   OUT   NUMBER
) AS
    CURSOR empl IS
    SELECT
        first_name,
        salary
    FROM
        employees
    WHERE
        department_id = dpto_id;

    contador NUMBER := 0;
BEGIN
    FOR i IN empl LOOP
        contador := contador + 1;
        dbms_output.put_line('Nombre: '
                             || i.first_name
                             || ' Salario: '
                             || i.salary);

    END LOOP;
    cantidad:=contador;
END visualizar_2;
/

SET SERVEROUTPUT ON

DECLARE
    cantidad   NUMBER := 0;
    dpto_id    NUMBER := 100;
BEGIN
    visualizar_2(dpto_id, cantidad);
    dbms_output.put_line('Cantidad ' || cantidad);
END;