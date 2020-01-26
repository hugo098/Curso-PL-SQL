/*PERMITE LA SALIDA PANTALLA*/
SET SERVEROUTPUT ON

/*DECLARACI�N DE VARIABLES*/

DECLARE
    name       VARCHAR2(100);
    lastname   VARCHAR2(100);
    x          CONSTANT NUMBER := 100; /*VARIABLE NO MODIFICABLE*/
    y          NUMBER NOT NULL := 50;  /*VARIABLE NO NULLABLE*/

/*================================================*/
/*==========INICIO BLOQUE AN�NIMO PL/SQL==========*/
BEGIN  
    
    /*ASIGNACI�N DE VARIABLES :=*/
    name := 'HUGO IV�N';
    lastname := 'RODR�GUEZ VERA';
    y := 45;
    dbms_output.put_line(name);
    dbms_output.put_line(lastname);
    dbms_output.put_line(name
                         || ' '
                         || lastname);
    dbms_output.put_line(x);
    dbms_output.put_line(y);
END;

/*=============================================*/
/*==========FIN BLOQUE AN�NIMO PL/SQL==========*/