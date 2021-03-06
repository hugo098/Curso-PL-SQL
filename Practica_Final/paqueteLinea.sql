----------------------------------------------------------------------------------------------------------
------------------------------CABECERA DEL PAQUETE DE LINEAS DE FACTURA-----------------------------------
----------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE pck_lineas_factura AS
    PROCEDURE alta_linea (
        codigo     NUMBER,
        cod_prod   NUMBER,
        uni        NUMBER,
        fech       DATE
    );

    PROCEDURE baja_linea (
        codigo     NUMBER,
        cod_prod   NUMBER
    );

    PROCEDURE mod_producto (
        codigo     NUMBER,
        cod_prod   NUMBER,
        uni        NUMBER
    );

    PROCEDURE mod_producto (
        codigo     NUMBER,
        cod_prod   NUMBER,
        fech       DATE
    );

    FUNCTION num_lineas (
        codigo NUMBER
    ) RETURN NUMBER;

END pck_lineas_factura;
/

----------------------------------------------------------------------------------------------------------
-------------------------------CUERPO DEL PAQUETE DE LINEAS DE FACTURAS-----------------------------------
----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pck_lineas_factura AS

----------------------------------------------------------------------------------------------------------
-----------------------FUNCIÓN PRIVADA PARA COMPROBAR EXISTENCIA DE FACTURA-------------------------------
----------------------------------------------------------------------------------------------------------

    FUNCTION existe_factura (
        codigo NUMBER
    ) RETURN BOOLEAN AS
        aux_1 facturas.cod_factura%TYPE;
    BEGIN
        SELECT cod_factura
        INTO aux_1
        FROM facturas
        WHERE cod_factura = codigo;

        RETURN true;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN false;
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR ' || sqlcode);
    END existe_factura;

----------------------------------------------------------------------------------------------------------
----------------------FUNCIÓN PRIVADA PARA COMPROBAR EXISTENCIA DE PRODUCTO-------------------------------
----------------------------------------------------------------------------------------------------------

    FUNCTION existe_producto (
        codigo NUMBER
    ) RETURN BOOLEAN AS
        aux_1 productos.cod_producto%TYPE;
    BEGIN
        SELECT cod_producto
        INTO aux_1
        FROM productos
        WHERE cod_producto = codigo;

        RETURN true;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN false;
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR ' || sqlcode);
    END existe_producto;

----------------------------------------------------------------------------------------------------------
-------------------FUNCIÓN PRIVADA PARA COMPROBAR EXISTENCIA DE LINEAS DE FACTURA-------------------------
----------------------------------------------------------------------------------------------------------

    FUNCTION existe_linea_producto (
        codigo     NUMBER,
        cod_prod   NUMBER
    ) RETURN BOOLEAN AS
        aux_1 productos.cod_producto%TYPE;
    BEGIN
        SELECT cod_producto
        INTO aux_1
        FROM lineas_factura
        WHERE cod_producto = cod_prod
              AND cod_factura = codigo;

        RETURN true;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN false;
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR ' || sqlcode);
    END existe_linea_producto;


----------------------------------------------------------------------------------------------------------
------------------------FUNCIÓN PRIVADA PARA OBTENER EL PVP DE UN PRODUCTO--------------------------------
----------------------------------------------------------------------------------------------------------

    FUNCTION pvp (
        codigo NUMBER
    ) RETURN productos.pvp%TYPE AS
        pvp productos.pvp%TYPE;
    BEGIN
        SELECT pvp
        INTO pvp
        FROM productos
        WHERE cod_producto = codigo;

        RETURN pvp;
    EXCEPTION
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR ' || sqlcode);
    END pvp;

----------------------------------------------------------------------------------------------------------
------------------------------PROCEDIMIENTO PARA AGREGAR UNA LINEA----------------------------------------
----------------------------------------------------------------------------------------------------------

    PROCEDURE alta_linea (
        codigo     NUMBER,
        cod_prod   NUMBER,
        uni        NUMBER,
        fech       DATE
    ) AS
        error_no_existe_factura EXCEPTION;
        error_no_existe_producto EXCEPTION;
        existe_factura_    BOOLEAN;
        existe_producto_   BOOLEAN;
        pvp_               productos.pvp%TYPE;
    BEGIN
        existe_factura_ := existe_factura(codigo);
        existe_producto_ := existe_producto(cod_prod);
        IF existe_factura_ AND existe_producto_ THEN
            pvp_ := pvp(cod_prod);
            INSERT INTO lineas_factura (
                cod_factura,
                cod_producto,
                pvp,
                unidades,
                fecha
            ) VALUES (
                codigo,
                cod_prod,
                pvp_,
                uni,
                fech
            );

            COMMIT;
        ELSIF NOT existe_factura_ THEN
            RAISE error_no_existe_factura;
        ELSIF NOT existe_producto_ THEN
            RAISE error_no_existe_producto;
        END IF;

    EXCEPTION
        WHEN error_no_existe_factura THEN
            raise_application_error(-20002, 'ERROR, ESE NÚMERO DE FACTURA NO EXISTE');
        WHEN error_no_existe_producto THEN
            raise_application_error(-20003, 'ERROR, EL PRODUCTO CON ESE CÓDIGO NO EXISTE');
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR ' || sqlcode);
    END alta_linea;

----------------------------------------------------------------------------------------------------------
------------------------------PROCEDIMIENTO PARA ELIMINAR UNA LINEA---------------------------------------
----------------------------------------------------------------------------------------------------------

    PROCEDURE baja_linea (
        codigo     NUMBER,
        cod_prod   NUMBER
    ) AS
        error_no_existe_linea EXCEPTION;
        existe_linea_producto_ BOOLEAN;
    BEGIN
        existe_linea_producto_ := existe_linea_producto(codigo, cod_prod);
        IF existe_linea_producto_ THEN
            DELETE FROM lineas_factura
            WHERE cod_factura = codigo
                  AND cod_producto = cod_prod;

            COMMIT;
        ELSIF NOT existe_linea_producto_ THEN
            RAISE error_no_existe_linea;
        END IF;

    EXCEPTION
        WHEN error_no_existe_linea THEN
            raise_application_error(-20004, 'ERROR, ESE NÚMERO DE FACTURA-PRODUCTO NO EXISTE ');
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR ' || sqlcode);
    END baja_linea;

----------------------------------------------------------------------------------------------------------
------------------------PROCEDIMIENTO PARA MODIFICAR LAS UNIDADES DE UNA LINEA----------------------------
----------------------------------------------------------------------------------------------------------

    PROCEDURE mod_producto (
        codigo     NUMBER,
        cod_prod   NUMBER,
        uni        NUMBER
    ) AS
        error_no_existe_linea EXCEPTION;
        existe_linea_producto_ BOOLEAN;
    BEGIN
        existe_linea_producto_ := existe_linea_producto(codigo, cod_prod);
        IF existe_linea_producto_ THEN
            UPDATE lineas_factura
            SET
                unidades = uni
            WHERE cod_factura = codigo
                  AND cod_producto = cod_prod;

            COMMIT;
        ELSIF NOT existe_linea_producto_ THEN
            RAISE error_no_existe_linea;
        END IF;

    EXCEPTION
        WHEN error_no_existe_linea THEN
            raise_application_error(-20004, 'ERROR, ESE NÚMERO DE FACTURA-PRODUCTO NO EXISTE ');
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR ' || sqlcode);
    END mod_producto;

----------------------------------------------------------------------------------------------------------
---------------------------PROCEDIMIENTO PARA MODIFICAR LA FECHA DE UNA LINEA-----------------------------
----------------------------------------------------------------------------------------------------------

    PROCEDURE mod_producto (
        codigo     NUMBER,
        cod_prod   NUMBER,
        fech       DATE
    ) AS
        error_no_existe_linea EXCEPTION;
        existe_linea_producto_ BOOLEAN;
    BEGIN
        existe_linea_producto_ := existe_linea_producto(codigo, cod_prod);
        IF existe_linea_producto_ THEN
            UPDATE lineas_factura
            SET
                fecha = fech
            WHERE cod_factura = codigo
                  AND cod_producto = cod_prod;

            COMMIT;
        ELSIF NOT existe_linea_producto_ THEN
            RAISE error_no_existe_linea;
        END IF;

    EXCEPTION
        WHEN error_no_existe_linea THEN
            raise_application_error(-20004, 'ERROR, ESE NÚMERO DE FACTURA-PRODUCTO NO EXISTE ');
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR ' || sqlcode);
    END mod_producto;

----------------------------------------------------------------------------------------------------------
-----------------------FUNCIÓN PARA OBTENER LA CANTIDAD DE LINEAS DE UNA FACTURA---------------------------
----------------------------------------------------------------------------------------------------------

    FUNCTION num_lineas (
        codigo NUMBER
    ) RETURN NUMBER AS
        numero_lineas NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO numero_lineas
        FROM lineas_factura
        WHERE cod_factura = codigo;

        RETURN numero_lineas;
    END num_lineas;

END pck_lineas_factura;