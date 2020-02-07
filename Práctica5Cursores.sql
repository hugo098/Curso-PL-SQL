declare
    
    cursor c1 is select * from employees for update;
    
    empl employees%rowtype;
    
begin
    
    open c1;
    
    FETCH c1 into empl;
    
    
    if empl.salary>8000 then
        update employees set salary=empl.salary*1.02 where current of c1;
    elsif(empl.salary<8000) then
        update employees set salary=empl.salary*1.03 where current of c1;

    end if;
end;
