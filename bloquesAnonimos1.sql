/*PERMITE LA SALIDA PANTALLA*/
SET SERVEROUTPUT ON

/*DECLARACIÓN DE VARIABLES*/
DECLARE

    NAME VARCHAR2(100);
    LASTNAME VARCHAR2(100);

/*================================================*/
/*==========INICIO BLOQUE ANÓNIMO PL/SQL==========*/

BEGIN  
    
    /*ASIGNACIÓN DE VARIABLES :=*/
    NAME:='HUGO IVÁN';
    LASTNAME:='RODRÍGUEZ VERA';
    
    DBMS_OUTPUT.PUT_LINE(NAME);
    
    DBMS_OUTPUT.PUT_LINE(LASTNAME);
    
    DBMS_OUTPUT.PUT_LINE(NAME || ' ' || LASTNAME);

END;

/*=============================================*/
/*==========FIN BLOQUE ANÓNIMO PL/SQL==========*/