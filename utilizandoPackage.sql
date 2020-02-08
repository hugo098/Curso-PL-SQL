SET SERVEROUTPUT ON

DECLARE BEGIN
    pck1.v1 := 10;
    pck1.v2 := 'HOLA';
    dbms_output.put_line(pck1.v1);
    dbms_output.put_line(pck1.v2);
END;