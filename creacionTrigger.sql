CREATE OR REPLACE TRIGGER ins_empl AFTER
    INSERT ON regions
BEGIN
    INSERT INTO log_table VALUES (
        'INSERCION EN LA TABLA REGIONES',
        user
    );

END ins_empl;

/

INSERT INTO REGIONS VALUES(10, 'REGION');


