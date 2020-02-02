DECLARE
    C1 TEST.C1%TYPE;
    C2 test.c2%TYPE;
BEGIN
    
    C1:=10;
    C2:='HOLA MUNDO';
    
    
    INSERT INTO TEST(C1,C2)VALUES(C1,C2);
    COMMIT;


END;