DECLARE
    col1 test.c1%TYPE;
BEGIN
    col1 := 10;
    DELETE FROM test
    WHERE
        c1 = col1;

    COMMIT;
END;