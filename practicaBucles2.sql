SET SERVEROUTPUT ON

DECLARE
    texto    VARCHAR2(100) := 'HUGO x RODRIGUEZ';
    invert   VARCHAR2(100);
    cont     NUMBER;
BEGIN
    cont := length(texto);
    dbms_output.put_line(cont);
    WHILE ( cont > 0 ) LOOP
        EXIT WHEN substr(texto, cont, 1) = 'x' OR substr(texto, cont, 1) = 'X';

        invert := invert
                  || substr(texto, cont, 1);
        cont := cont - 1;
    END LOOP;

    dbms_output.put_line(invert);
END;
