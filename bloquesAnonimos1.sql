/*PERMITE LA SALIDA PANTALLA*/
SET SERVEROUTPUT ON

/*DECLARACI�N DE VARIABLES*/
DECLARE

    NAME VARCHAR2(100);
    LASTNAME VARCHAR2(100);

/*================================================*/
/*==========INICIO BLOQUE AN�NIMO PL/SQL==========*/

BEGIN  
    
    /*ASIGNACI�N DE VARIABLES :=*/
    NAME:='HUGO IV�N';
    LASTNAME:='RODR�GUEZ VERA';
    
    DBMS_OUTPUT.PUT_LINE(NAME);
    
    DBMS_OUTPUT.PUT_LINE(LASTNAME);
    
    DBMS_OUTPUT.PUT_LINE(NAME || ' ' || LASTNAME);

END;

/*=============================================*/
/*==========FIN BLOQUE AN�NIMO PL/SQL==========*/