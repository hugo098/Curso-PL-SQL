CREATE TABLE regiones
    AS
        SELECT
            *
        FROM
            regions
        WHERE
            region_id = 0;

DECLARE
    reg1 regions%rowtype;
BEGIN
    SELECT
        *
    INTO reg1
    FROM
        regions
    WHERE
        region_id = 1;

    INSERT INTO regiones VALUES reg1;

END;
/

DECLARE
    reg1 regions%rowtype;
BEGIN
    reg1.region_id := 1;
    reg1.region_name := 'AUSTRALIA';
    UPDATE regiones
    SET
        row = reg1
    WHERE
        region_id = 1;

END;