create or replace trigger t2 
before insert on regions
begin
    
    if user<>'HR' then
        RAISE_APPLICATION_ERROR(-20000, 'SOLO HR PUEDE INSERTAR EN REGIONS');
    END IF;

end;
/
