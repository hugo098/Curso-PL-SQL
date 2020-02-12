CREATE OR REPLACE TRIGGER tr1_region BEFORE
    INSERT OR UPDATE OR DELETE ON regions
BEGIN
    IF inserting THEN
        INSERT INTO log_table VALUES (
            'INSERCION',
            user
        );

    ELSIF updating('REGION_NAME') THEN
        INSERT INTO log_table VALUES (
            'UPDATE DE REGION_NAME',
            user
        );

    ELSIF updating('REGION_ID') THEN
        INSERT INTO log_table VALUES (
            'UPDATE DE REGION_ID',
            user
        );

    ELSIF deleting THEN
        INSERT INTO log_table VALUES (
            'DELETE',
            user
        );

    END IF;
END tr1_region;
/

insert into regions values(100, 'test');
commit;


update regions set region_id=101 where region_id=100;
commit;

delete from regions where region_id=101;
commit;

   