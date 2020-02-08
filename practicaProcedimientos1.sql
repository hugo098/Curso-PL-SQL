CREATE OR REPLACE PROCEDURE visualizar AS
    CURSOR empl IS
    SELECT
        first_name,
        salary
    FROM
        employees;

BEGIN
    FOR i IN empl LOOP
        dbms_output.put_line('Nombre: '
                             || i.first_name
                             || ' Salario: '
                             || i.salary);
    END LOOP;
END visualizar;
/

SET SERVEROUTPUT ON

EXECUTE visualizar();