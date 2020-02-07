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
    FETCH c1 INTO v1;
    dbms_output.put_line(v1.region_name);
    CLOSE c1;
END;