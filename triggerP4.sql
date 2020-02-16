CREATE OR REPLACE TRIGGER tr_depto BEFORE
    INSERT ON departments
    FOR EACH ROW
DECLARE
    nro_dto NUMBER;
BEGIN
    SELECT department_id INTO NRO_DTO
    FROM departments
    WHERE department_id = :new.department_id;

    raise_application_error(-20000, 'EL DPTO YA EXISTE');
EXCEPTION
    WHEN no_data_found THEN
        IF :new.location_id IS NULL THEN
            :new.location_id := 1700;
        END IF;

        IF :new.manager_id IS NULL THEN
            :new.manager_id := 200;
        END IF;

END;