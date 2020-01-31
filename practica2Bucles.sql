SET SERVEROUTPUT ON

DECLARE
    texto    VARCHAR2(100) := 'HUGO RODRIGUEZ';
    invert   VARCHAR2(100);
    cont     NUMBER;
BEGIN
    cont := length(texto);
    dbms_output.put_line(cont);
    WHILE ( cont > 0 ) LOOP
        invert := invert
                  || substr(texto, cont, 1);
        cont := cont - 1;
    END LOOP;

    dbms_output.put_line(invert);
END;