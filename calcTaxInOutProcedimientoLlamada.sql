SET SERVEROUTPUT ON

DECLARE
    a   NUMBER;
    b   NUMBER;
    r   NUMBER;
BEGIN
    a := 100;
    b := 10;
    --r := 0;
    calc_tax_in_out(a, b);
    dbms_output.put_line('B= ' || b);
END;
/