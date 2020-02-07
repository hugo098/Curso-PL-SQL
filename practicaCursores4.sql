set serveroutput on

begin

    for empleado in (select * from employees where job_id='ST_CLERK')loop
        DBMS_OUTPUT.PUT_LINE (empleado.first_name || ' '||empleado.last_name );
    end loop;
end;