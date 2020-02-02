DECLARE
    c1   test.c1%TYPE;
    c2   test.c2%TYPE;
BEGIN
    c1 := 10;
    c2 := 'HOLA MUNDO';
    INSERT INTO test (
        c1,
        c2
    ) VALUES (
        c1,
        c2
    );

    COMMIT;
END;