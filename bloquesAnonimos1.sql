/*PERMITE LA SALIDA PANTALLA*/
SET SERVEROUTPUT ON

/*DECLARACIÓN DE VARIABLES*/

DECLARE
    name       VARCHAR2(100);
    lastname   VARCHAR2(100);
    x          CONSTANT NUMBER := 100; /*VARIABLE NO MODIFICABLE*/
    y          NUMBER NOT NULL := 50;  /*VARIABLE NO NULLABLE*/

/*================================================*/
/*==========INICIO BLOQUE ANÓNIMO PL/SQL==========*/
BEGIN  
    
    /*ASIGNACIÓN DE VARIABLES :=*/
    name := 'HUGO IVÁN';
    lastname := 'RODRÍGUEZ VERA';
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
/*==========FIN BLOQUE ANÓNIMO PL/SQL==========*/