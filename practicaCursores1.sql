set SERVEROUTPUT ON

declare
    cursor c1 is select * from employees;
    
begin
    for i in c1 loop
        if(i.first_name<>'Steven' or i.last_name<>'King')Then
        
            dbms_output.put_line(i.salary);
        else
           --raise_application_error(-20001, 'El sueldo del jefe no se puede ver');
            dbms_output.put_line('El sueldo del jefe no se puede ver'); 
        end if;   
    end loop;
    

end;
/
select * from employees where first_name='Steven';
