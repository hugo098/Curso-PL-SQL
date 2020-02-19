CREATE OR REPLACE TRIGGER tr1_region BEFORE
    INSERT OR UPDATE OR DELETE ON regions
BEGIN
    IF inserting THEN
        INSERT INTO log_table VALUES (
            'INSERCION', user
        );

    ELSIF updating('REGION_NAME') THEN
        INSERT INTO log_table VALUES (
            'UPDATE DE REGION_NAME', user
        );

    ELSIF updating('REGION_ID') THEN
        INSERT INTO log_table VALUES (
            'UPDATE DE REGION_ID', user
        );

    ELSIF deleting THEN
        INSERT INTO log_table VALUES (
            'DELETE', user
        );

    END IF;
END tr1_region;
/

INSERT INTO regions VALUES (
    100, 'test'
);

COMMIT;

UPDATE regions
SET
    region_id = 101
WHERE region_id = 100;

COMMIT;

DELETE FROM regions
WHERE region_id = 101;

COMMIT;