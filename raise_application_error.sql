SET SERVEROUTPUT ON

DECLARE
    regn   NUMBER;
    regt   VARCHAR2(200);
BEGIN
    regn := 101;
    regt := 'ASIA';
    IF regn > 100 THEN
       -- EL CODIGO DEBE ESTAR ENTRE -20000 Y -20999
        raise_application_error(-20001, 'LA ID NO PUEDE SER MAYOR DE 100');
    ELSE
        INSERT INTO regions VALUES (
            regn,
            regt
        );

        COMMIT;
    END IF;

END;
/