CREATE OR REPLACE PACKAGE pack_regiones IS
    PROCEDURE alta_region (
       -- cod      regions.region_id%TYPE,
        nombre regions.region_name%TYPE
    );

    PROCEDURE baja_region (
        cod regions.region_id%TYPE
    );

    PROCEDURE mod_region (
        cod          regions.region_id%TYPE,
        new_nombre   regions.region_name%TYPE
    );

    FUNCTION con_region (
        cod regions.region_id%TYPE
    ) RETURN VARCHAR2;

END pack_regiones;
/

CREATE OR REPLACE PACKAGE BODY pack_regiones IS

    FUNCTION existe_region (
        nombre regions.region_name%TYPE
    ) RETURN BOOLEAN IS
        v1 NUMBER;
    BEGIN
        SELECT
            region_id
        INTO v1
        FROM
            regions
        WHERE
            region_name = nombre;

        RETURN true;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN false;
    END existe_region;

    FUNCTION existe_region (
        cod regions.region_id%TYPE
    ) RETURN BOOLEAN IS
        v1 NUMBER;
    BEGIN
        SELECT
            region_id
        INTO v1
        FROM
            regions
        WHERE
            region_id = cod;

        RETURN true;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN false;
    END existe_region;

    FUNCTION con_region (
        cod regions.region_id%TYPE
    ) RETURN VARCHAR2 IS
        nombre regions.region_name%TYPE;
    BEGIN
        SELECT
            region_name
        INTO nombre
        FROM
            regions
        WHERE
            region_id = cod;

        RETURN nombre;
    EXCEPTION
        WHEN no_data_found THEN
            nombre := '0001-not_found';
            RETURN nombre;
    END con_region;

    PROCEDURE alta_region (
        --cod      regions.region_id%TYPE,
        nombre regions.region_name%TYPE
    ) AS
        cod regions.region_id%TYPE;
    BEGIN
        IF ( existe_region(nombre) ) THEN
            dbms_output.put_line('YA EXISTE LA REGIÓN');
        ELSE
            SELECT
                MAX(region_id)
            INTO cod
            FROM
                regions;

            INSERT INTO regions VALUES (
                cod + 1,
                nombre
            );

        END IF;
    END alta_region;

    PROCEDURE baja_region (
        cod regions.region_id%TYPE
    ) AS
    BEGIN
        IF ( existe_region(cod) ) THEN
            DELETE FROM regions
            WHERE
                region_id = cod;

        ELSE
            dbms_output.put_line('NO EXISTE LA REGIÓN');
        END IF;
    END baja_region;

    PROCEDURE mod_region (
        cod          regions.region_id%TYPE,
        new_nombre   regions.region_name%TYPE
    ) AS
    BEGIN
        IF ( existe_region(cod) ) THEN
            UPDATE regions
            SET
                region_name = new_nombre
            WHERE
                region_id = cod;

        ELSE
            dbms_output.put_line('NO EXISTE LA REGIÓN');
        END IF;
    END mod_region;

END pack_regiones;
/
set serveroutput on
BEGIN

    pack_regiones.ALTA_REGION('PARAGUAY');
    DBMS_OUTPUT.PUT_LINE(Pack_regiones.con_region(205));
    pack_regiones.MOD_REGION(201, 'CAMBIO');
    pack_regiones.baja_region(202);
    

END;