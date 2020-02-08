CREATE OR REPLACE PROCEDURE formateo (
    cuenta IN OUT VARCHAR2
) AS

    v1   VARCHAR2(4);
    v2   VARCHAR2(4);
    v3   VARCHAR2(2);
    v4   VARCHAR2(10);
BEGIN
    v1 := substr(cuenta, 1, 4);
    v2 := substr(cuenta, 5, 4);
    v3 := substr(cuenta, 10, 2);
    v4 := substr(cuenta, 13, 7);
    cuenta := v1
              || '-'
              || v2
              || '-'
              || v3
              || '-'
              || v4;

END formateo;
/

SET SERVEROUTPUT ON

DECLARE
    cuenta VARCHAR2(20) := 11111111111111111111;
BEGIN
    dbms_output.put_line('Antes del formateo: ' || cuenta);
    formateo(cuenta);
    dbms_output.put_line('Después del formateo: ' || cuenta);
END;