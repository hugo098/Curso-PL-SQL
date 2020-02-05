SET SERVEROUTPUT ON

DECLARE
    control_regiones EXCEPTION;
    codigo NUMBER :=201;
BEGIN
    IF codigo > 200 THEN
        RAISE control_regiones;
    ELSE
        INSERT INTO regions VALUES (
            codigo,
            'PRUEBA'
        );

    END IF;
EXCEPTION
    WHEN control_regiones THEN
        dbms_output.put_line('El codigo debe ser inferior a 200');
    WHEN OTHERS THEN
        dbms_output.put_line(sqlcode);
        dbms_output.put_line(sqlerrm);
END;