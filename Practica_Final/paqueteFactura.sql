----------------------------------------------------------------------------------------------------------
------------------------------------CABECERA DEL PAQUETE DE FACTURAS--------------------------------------
----------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE pck_facturas AS
    PROCEDURE alta_factura (
        cod_factura   NUMBER,
        fecha         DATE,
        descripcion   VARCHAR2
    );

    PROCEDURE baja_factura (
        cod_factura NUMBER
    );

    PROCEDURE mod_descri (
        cod_factura   NUMBER,
        descripcion   VARCHAR2
    );

    PROCEDURE mod_fecha (
        cod_factura   NUMBER,
        fecha         DATE
    );

    FUNCTION num_facturas (
        fecha_inicio   DATE,
        fecha_fin      DATE
    ) RETURN NUMBER;

    FUNCTION total_factura (
        cod_factura NUMBER
    ) RETURN NUMBER;

END pck_facturas;
/

----------------------------------------------------------------------------------------------------------
--------------------------------------CUERPO DEL PAQUETE DE FACTURAS--------------------------------------
----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY pck_facturas AS

----------------------------------------------------------------------------------------------------------
-----------------------FUNCIÓN PRIVADA PARA COMPROBAR EXISTENCIA DE FACTURA-------------------------------
----------------------------------------------------------------------------------------------------------

    FUNCTION existe (
        cod_factura NUMBER
    ) RETURN BOOLEAN AS
        aux_1 facturas.cod_factura%TYPE;
    BEGIN
        SELECT cod_factura
        INTO aux_1
        FROM facturas
        WHERE cod_factura = cod_factura;

        RETURN true;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN false;
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR ' || sqlcode);
    END existe;
    
    
----------------------------------------------------------------------------------------------------------
--------------------------------PROCEDIMIENTO PARA CREAR FACTURAS-----------------------------------------
----------------------------------------------------------------------------------------------------------

    PROCEDURE alta_factura (
        cod_factura   NUMBER,
        fecha         DATE,
        descripcion   VARCHAR2
    ) AS
        error_ya_existe EXCEPTION;
        existe_ BOOLEAN;
    BEGIN
        existe_ := existe(cod_factura);
        IF existe_ THEN
            RAISE error_ya_existe;
        ELSE
            INSERT INTO facturas (
                cod_factura,
                fecha,
                descripcion
            ) VALUES (
                cod_factura,
                fecha,
                descripcion
            );

            COMMIT;
        END IF;

    EXCEPTION
        WHEN error_ya_existe THEN
            raise_application_error(-20001, 'ERROR, ESE NÚMERO DE FACTURA YA EXISTE, NO SE ADMITEN DUPLICADOS');
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR ' || sqlcode);
    END alta_factura;

----------------------------------------------------------------------------------------------------------
--------------------------------PROCEDIMIENTO PARA BORRAR FACTURAS----------------------------------------
----------------------------------------------------------------------------------------------------------

    PROCEDURE baja_factura (
        cod_factura NUMBER
    ) AS
        error_no_existe EXCEPTION;
        existe_ BOOLEAN;
    BEGIN
        existe_ := existe(cod_factura);
        IF existe_ THEN
            DELETE FROM lineas_factura
            WHERE cod_factura = cod_factura;

            DELETE FROM facturas
            WHERE cod_factura = cod_factura;

            COMMIT;
        ELSE
            RAISE error_no_existe;
        END IF;

    EXCEPTION
        WHEN error_no_existe THEN
            raise_application_error(-20002, 'ERROR, ESE NÚMERO DE FACTURA NO EXISTE');
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR ' || sqlcode);
    END baja_factura;
    
    
----------------------------------------------------------------------------------------------------------
------------------------PROCEDIMIENTO PARA MODIFICAR DESCRIPCION DE FACTURAS------------------------------
----------------------------------------------------------------------------------------------------------

    PROCEDURE mod_descri (
        cod_factura   NUMBER,
        descripcion   VARCHAR2
    ) AS
        error_no_existe EXCEPTION;
        existe_ BOOLEAN;
    BEGIN
        existe_ := existe(cod_factura);
        IF existe_ THEN
            UPDATE facturas
            SET
                descripcion = descripcion
            WHERE cod_factura = cod_factura;

            COMMIT;
        ELSE
            RAISE error_no_existe;
        END IF;

    EXCEPTION
        WHEN error_no_existe THEN
            raise_application_error(-20002, 'ERROR, ESE NÚMERO DE FACTURA NO EXISTE');
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR ' || sqlcode);
    END mod_descri;
----------------------------------------------------------------------------------------------------------
---------------------------PROCEDIMIENTO PARA MODIFICAR FECHA DE FACTURAS---------------------------------
----------------------------------------------------------------------------------------------------------

    PROCEDURE mod_fecha (
        cod_factura   NUMBER,
        fecha         DATE
    ) AS
        error_no_existe EXCEPTION;
        existe_ BOOLEAN;
    BEGIN
        existe_ := existe(cod_factura);
        IF existe_ THEN
            UPDATE facturas
            SET
                fecha = fecha
            WHERE cod_factura = cod_factura;

            COMMIT;
        ELSE
            RAISE error_no_existe;
        END IF;

    EXCEPTION
        WHEN error_no_existe THEN
            raise_application_error(-20002, 'ERROR, ESE NÚMERO DE FACTURA NO EXISTE');
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR ' || sqlcode);
    END mod_fecha;
    
----------------------------------------------------------------------------------------------------------
----------------FUNCIÓN PARA DEVOLVER LA CANTIDAD DE FACTURAS EN UN RANGO DE FECHAS-----------------------
----------------------------------------------------------------------------------------------------------

    FUNCTION num_facturas (
        fecha_inicio   DATE,
        fecha_fin      DATE
    ) RETURN NUMBER AS
        cantidad_facturas NUMBER := 0;
    BEGIN
        SELECT COUNT(*)
        INTO cantidad_facturas
        FROM facturas
        WHERE fecha BETWEEN fecha_inicio AND fecha_fin;

        RETURN cantidad_facturas;
    END num_facturas;
----------------------------------------------------------------------------------------------------------
---------------------------FUNCIÓN PARA DEVOLVER EL TOTAL DE UNA FACTURA----------------------------------
----------------------------------------------------------------------------------------------------------

    FUNCTION total_factura (
        cod_factura NUMBER
    ) RETURN NUMBER AS
        total NUMBER := 0;
    BEGIN
        SELECT SUM(pvp * unidades)
        INTO total
        FROM lineas_factura
        WHERE cod_factura = cod_factura;

        RETURN total;
    END total_factura;

END pck_facturas;