DECLARE
    t test.c1%TYPE;
BEGIN
    t := 10;
    UPDATE test
    SET
        c2 = 'ADIOS MUNDO'
    WHERE
        c1 = t;

    COMMIT;
END;