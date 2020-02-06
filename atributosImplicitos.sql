SET SERVEROUTPUT ON

DECLARE
    x NUMBER;
BEGIN
    UPDATE test
    SET
        c2 = 'cambio'
    WHERE
        c1 = 100;

    dbms_output.put_line(SQL%rowcount);
    IF SQL%found THEN
        dbms_output.put_line('ENCONTRADO');
    END IF;
    /*NO SE PUEDE
    SELECT C1 INTO X FROM TEST WHERE C1=1000;
    
    if sql%NOTfound then
        dbms_output.put_line('FILA NO EXISTE');
    END IF;*/
END;