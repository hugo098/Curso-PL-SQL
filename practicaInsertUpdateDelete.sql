DECLARE
    id_depto departments.department_id%TYPE;
BEGIN
    SELECT
        MAX(department_id)
    INTO id_depto
    FROM
        departments;

    INSERT INTO departments (
        department_id,
        location_id,
        manager_id,
        department_name
    ) VALUES (
        id_depto + 1,
        1000,
        100,
        'INFORMATICA'
    );

    COMMIT;
END;
/

DECLARE
    id_depto departments.department_id%TYPE;
BEGIN
    SELECT
        MAX(department_id)
    INTO id_depto
    FROM
        departments;

    UPDATE departments
    SET
        location_id = 1700
    WHERE
        department_id = id_depto;

END;
/

DECLARE
    id_depto departments.department_id%TYPE;
BEGIN
    SELECT
        MAX(department_id)
    INTO id_depto
    FROM
        departments;

    DELETE FROM departments
    WHERE
        department_id = id_depto;
    COMMIT;

END;
/

SELECT
    *
FROM
    departments
