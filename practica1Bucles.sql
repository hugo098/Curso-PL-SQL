SET SERVEROUTPUT ON

DECLARE
    x      NUMBER := 1;
    cont   NUMBER := 1;
BEGIN
    dbms_output.put_line('*****************CON LOOP*****************');
    LOOP
        EXIT WHEN x > 10;
        cont := 1;
        LOOP
            EXIT WHEN cont > 10;
            dbms_output.put_line(x
                                 || '*'
                                 || cont
                                 || '='
                                 || x * cont);

            cont := cont + 1;
        END LOOP;

        x := x + 1;
    END LOOP;
    /*LOOP
        dbms_output.put_line(x
                             || '*'
                             || cont
                             || '='
                             || x * cont);

        cont := cont + 1;
        IF cont > 10 THEN
            cont := 1;
            x := x + 1;
        END IF;

        EXIT WHEN x > 10;
    END LOOP;*/

    x := 1;
    cont := 1;
    dbms_output.put_line('*****************CON WHILE*****************');
    WHILE x < 11 LOOP
        cont := 1;
        WHILE cont < 11 LOOP
            dbms_output.put_line(x
                                 || '*'
                                 || cont
                                 || '='
                                 || x * cont);

            cont := cont + 1;
        END LOOP;

        x := x + 1;
    END LOOP;

    x := 1;
    cont := 1;
    dbms_output.put_line('*****************CON FOR*****************');
    FOR i IN 1..10 LOOP
        cont := 1;
        FOR j IN 1..10 LOOP
            dbms_output.put_line(x
                                 || '*'
                                 || cont
                                 || '='
                                 || x * cont);

            cont := cont + 1;
        END LOOP;

        x := x + 1;
    END LOOP;

END;