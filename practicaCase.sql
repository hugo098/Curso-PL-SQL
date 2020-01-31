SET SERVEROUTPUT ON

DECLARE
    usuario VARCHAR2(40) := user;
BEGIN
    CASE usuario
        WHEN 'SYS' THEN
            dbms_output.put_line('Eres superadministrador');
        WHEN 'SYSTEM' THEN
            dbms_output.put_line('Eres administrador');
        WHEN 'HR' THEN
            dbms_output.put_line('Eres de recursos humanos');
        ELSE
            dbms_output.put_line('Usuario no autorizado');
    END CASE;
END;