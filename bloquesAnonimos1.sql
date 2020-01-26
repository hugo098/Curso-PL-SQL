/*PERMITE LA SALIDA PANTALLA*/
SET SERVEROUTPUT ON

/*================================================*/
/*==========INICIO BLOQUE ANÓNIMO PL/SQL==========*/

BEGIN  
    
    DBMS_OUTPUT.PUT_LINE(100);   
    
    DBMS_OUTPUT.PUT_LINE('HOLA MUNDO' || 'PL/SQL');

END;

/*=============================================*/
/*==========FIN BLOQUE ANÓNIMO PL/SQL==========*/