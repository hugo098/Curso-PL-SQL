CREATE OR REPLACE FUNCTION crear_region (
    nombre regions.region_name%TYPE
) RETURN NUMBER AS
    nro_reg      NUMBER := 0;
    nombre_reg   regions.region_name%TYPE;
BEGIN
    SELECT
        region_name
    INTO nombre_reg
    FROM
        regions
    WHERE
        region_name = nombre;

    IF ( SQL%found ) THEN
        raise_application_error(-20000, 'Ya existe la region');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
        SELECT
            MAX(region_id)
        INTO nro_reg
        FROM
            regions;

        nro_reg := nro_reg + 1;
        INSERT INTO regions VALUES (
            nro_reg,
            nombre
        );

        RETURN nro_reg;
END crear_region;
/

DECLARE
    a NUMBER;
BEGIN
    a := crear_region('TEST');
    dbms_output.put_line(a);
END;