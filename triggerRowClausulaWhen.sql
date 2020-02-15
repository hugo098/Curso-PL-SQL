CREATE OR REPLACE TRIGGER tr1_region BEFORE
    INSERT OR UPDATE OR DELETE ON regions
    FOR EACH ROW
    WHEN ( new.region_id > 1000 )
BEGIN
    IF inserting THEN
        :new.region_name := upper(:new.region_name);
        INSERT INTO log_table VALUES (
            'INSERCION', user
        );

    END IF;

    IF updating('REGION_NAME') THEN
        :new.region_name := upper(:new.region_name);
        INSERT INTO log_table VALUES (
            'UPDATE DE REGION_NAME', user
        );

    END IF;

    IF updating('REGION_ID') THEN
        INSERT INTO log_table VALUES (
            'UPDATE DE REGION_ID', user
        );

    END IF;

    IF deleting THEN
        INSERT INTO log_table VALUES (
            'DELETE', user
        );

    END IF;
   

END;