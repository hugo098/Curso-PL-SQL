CREATE OR REPLACE TRIGGER ins_empl AFTER
    INSERT OR UPDATE OF region_name OR DELETE ON regions
BEGIN
    INSERT INTO log_table VALUES (
        'INSERCION EN LA TABLA REGIONES',
        user
    );

END ins_empl;
/

INSERT INTO regions VALUES (
    11,
    'REGION'
);