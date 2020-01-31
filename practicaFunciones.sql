SET SERVEROUTPUT ON

DECLARE
    nombre             VARCHAR2(50);
    apellido1          VARCHAR2(50);
    apellido2          VARCHAR2(50);
    fecha_nacimiento   DATE;
BEGIN
    nombre := upper('Hugo');
    apellido1 := upper('RODRÍGUEZ');
    apellido2 := upper('VERA');
    fecha_nacimiento := to_date('16 / 7 / 1998');
    dbms_output.put_line(nombre
                         || ' '
                         || apellido1
                         || ' '
                         || apellido2);

    dbms_output.put_line(substr(nombre, 1, 1)
                         || '.'
                         || substr(apellido1, 1, 1)
                         || '.'
                         || substr(apellido2, 1, 1));

    dbms_output.put_line(to_char(fecha_nacimiento, 'DAY'));
END;