SET SERVEROUTPUT ON

DECLARE
/*OPERADORES MÁS HABITUALES
    +   SUMA
    -   RESTA
    /   DIVISIÓN
    *   MULTIPLICACIÓN
    **  EXPONENTE
    ||  CONCATENAR
*/
    x   NUMBER;
    z   NUMBER := 10;
    a   VARCHAR(100) := 'EXAMPLE';
    d   DATE := '16-07-1998';
BEGIN
    dbms_output.put_line(x);
    dbms_output.put_line(a || ' HELLO');
    dbms_output.put_line(a || z);
    dbms_output.put_line(d);
    dbms_output.put_line(sysdate + 1);
END;