SET SERVEROUTPUT ON

DECLARE
    nombre       VARCHAR2(100) := 'HUGO RODRIGUEZ';
    asteriscos   VARCHAR2(100);
BEGIN
    FOR i IN 1..length(nombre) LOOP asteriscos := asteriscos || '*';
    END LOOP;

    dbms_output.put_line(nombre);
    dbms_output.put_line(length(nombre));
    dbms_output.put_line(asteriscos);
END;