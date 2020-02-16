create or replace trigger tr_auditoria BEFORE insert on regions
begin
    
    insert into auditoria values (user, sysdate, null, null);
end;

/
insert into regions values(100, 'nue');


