SET SERVEROUTPUT ON

DECLARE
    x       VARCHAR(50);
    mayus   VARCHAR(100);
    fecha   DATE;
    z       NUMBER := 109.65;
BEGIN
    x := 'ejemplo';
    dbms_output.put_line(substr(x, 1, 3));
    mayus := upper(x);
    dbms_output.put_line(mayus);
    fecha := sysdate;
    dbms_output.put_line(fecha);
    dbms_output.put_line(floor(z));
END;