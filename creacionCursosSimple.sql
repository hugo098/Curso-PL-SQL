/*ATRIBUTOS IMPLICITOS

SQL%NOTFOUND
SQL%FOUND
SQL%ISOPEN
SQL%ROWCOUNT


*/

/*
ATRIBUTOS EXPLICITOS

C1%NOTFOUND
C1%FOUND
C1%ISOPEN
C1%ROWCOUNT

*/
SET SERVEROUTPUT ON

DECLARE
    CURSOR c1 IS
    SELECT
        *
    FROM
        regions;

    v1 regions%rowtype;
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO v1;
        EXIT WHEN c1%notfound;
        dbms_output.put_line(v1.region_name);
    END LOOP;

    CLOSE c1;
    ---------------------------------
    
    -- CURSOS CON BUCLE FOR
    FOR i IN c1 LOOP dbms_output.put_line(i.region_name);
    END LOOP;
    FOR i IN (
        SELECT
            *
        FROM
            regions
    ) LOOP dbms_output.put_line(i.region_name);
    END LOOP;

END;