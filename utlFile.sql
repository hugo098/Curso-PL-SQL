set serveroutput on
create or replace PROCEDURE read_file IS

string VARCHAR2(32767); 
Vfile UTL_FILE.FILE_TYPE; 

BEGIN 
-- Open FILE
Vfile := UTL_FILE.FOPEN('EJERCICIOS','f1.txt','R'); 
Loop
    begin
        --read line
        UTL_FILE.GET_LINE(Vfile,string); 
        INSERT INTO F1 VALUES(string);
       DBMS_OUTPUT.PUT_LINE(STRING);
     EXCEPTION
          WHEN NO_DATA_FOUND THEN EXIT; 
    end;
end loop;
-- close file
UTL_FILE.FCLOSE(Vfile);

END;