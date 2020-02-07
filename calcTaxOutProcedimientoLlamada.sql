SET SERVEROUTPUT ON

DECLARE
    a   NUMBER;
    b   NUMBER;
    r   NUMBER;
BEGIN
    a := 100;
    b := 5;
    r := 0;
    calc_tax_out(a, b, r);
    dbms_output.put_line('R= ' || r);
END;
/