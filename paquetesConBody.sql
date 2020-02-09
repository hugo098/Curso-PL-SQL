CREATE OR REPLACE PACKAGE pck1 IS
    PROCEDURE convert (
        name              VARCHAR2,
        conversion_type   CHAR
    );

END pck1;
/

CREATE OR REPLACE PACKAGE BODY pck1 IS

    FUNCTION up (
        name VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        RETURN upper(name);
    END up;

    FUNCTION do (
        name VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        RETURN lower(name);
    END do;

    PROCEDURE convert (
        name              VARCHAR2,
        conversion_type   CHAR
    ) IS
    BEGIN
        IF conversion_type = 'U' THEN
            dbms_output.put_line(up(name));
        ELSIF conversion_type = 'L' THEN
            dbms_output.put_line(do(name));
        ELSE
            dbms_output.put_line('EL PARAMETRO DEBE SER U O L');
        END IF;
    END convert;

END pck1;