SET SERVEROUTPUT ON

DECLARE
    tipo_producto CHAR(1) := 'A';
BEGIN
    IF ( tipo_producto = 'A' ) THEN
        dbms_output.put_line('ELECTRÓNICA');
    ELSIF ( tipo_producto = 'B' ) THEN
        dbms_output.put_line('INFORMÁTICA');
    ELSIF ( tipo_producto = 'C' ) THEN
        dbms_output.put_line('ROPA');
    ELSIF ( tipo_producto = 'D' ) THEN
        dbms_output.put_line('MÚSICA');
    ELSIF ( tipo_producto = 'E' ) THEN
        dbms_output.put_line('LIBROS');
    ELSE
        dbms_output.put_line('El código es incorrecto');
    END IF;
END;