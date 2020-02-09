SET SERVEROUTPUT ON

DECLARE
    v1 VARCHAR2(100);
BEGIN
    v1 := pck1.convert('aaaa', 'U');
    dbms_output.put_line(v1);
END;
/

SELECT
    first_name, PCK1.CONVERT(FIRST_NAME, 'U')
FROM
    employees;