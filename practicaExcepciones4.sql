SET SERVEROUTPUT ON

DECLARE
    pk_duplicada EXCEPTION;
    PRAGMA exception_init ( pk_duplicada, -00001 );
    cod_reg    regions.region_id%TYPE;
    name_reg   regions.region_name%TYPE;
BEGIN
    cod_reg := 101;
    name_reg := 'AMERICA';
    INSERT INTO regions VALUES (
        cod_reg,
        name_reg
    );

    COMMIT;
EXCEPTION
    WHEN pk_duplicada THEN
        dbms_output.put_line('CODIGO DUPLICADO');
    /*WHEN OTHERS THEN
        dbms_output.put_line('ERROR INDEFINIDO');*/
END;