CREATE OR REPLACE PACKAGE pcK1 IS
    FUNCTION convert (
        name              VARCHAR2,
        conversion_type   CHAR
    ) RETURN VARCHAR2;

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

    FUNCTION convert (
        name              VARCHAR2,
        conversion_type   CHAR
    ) RETURN VARCHAR2 IS
    BEGIN
        IF conversion_type = 'U' THEN
            return(up(name));
        ELSIF conversion_type = 'L' THEN
            return(do(name));
        ELSE
            dbms_output.put_line('EL PARAMETRO DEBE SER U O L');
        END IF;
    END convert;

END pck1;