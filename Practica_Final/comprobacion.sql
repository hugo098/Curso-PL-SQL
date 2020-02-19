SET SERVEROUTPUT ON

DECLARE
    a   DATE := TO_DATE('04/05/2020', 'DD/MM/YYYY');
    p   NUMBER:=0;
BEGIN

--pck_facturas.ALTA_FACTURA(2, a, 'FACTURA DE PRUEBA 2');
--pck_facturas.baja_FACTURA(2);
--pck_facturas.mod_descri(1, 'CAMBIO');
--pck_facturas.mod_fecha(1, a);
    --p := pck_facturas.num_facturas(TO_DATE('04/01/2020', 'DD/MM/YYYY'), TO_DATE('04/05/2020', 'DD/MM/YYYY'));

    --dbms_output.put_line(p);
    
    --select pck_facturas.total_factura(1) from facturas;


--pck_lineas_factura.alta_linea(1,1,5,sysdate);

--pck_lineas_factura.mod_producto(1,1,5);

--pck_lineas_factura.baja_linea(1,1);
END;