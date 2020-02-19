CREATE OR REPLACE TRIGGER tr_factura BEFORE
    INSERT OR UPDATE OR DELETE ON facturas
DECLARE
    operacion CHAR(1);
BEGIN
    IF inserting THEN
        operacion := 'I';
    ELSIF updating THEN
        operacion := 'U';
    ELSIF deleting THEN
        operacion := 'D';
    END IF;

    INSERT INTO control_log VALUES (
        user,
        sysdate,
        'FACTURA',
        operacion
    );

END tr_factura;
/

CREATE OR REPLACE TRIGGER tr_lineas_factura BEFORE
    INSERT OR UPDATE OR DELETE ON lineas_factura
DECLARE
    operacion CHAR(1);
BEGIN
    IF inserting THEN
        operacion := 'I';
    ELSIF updating THEN
        operacion := 'U';
    ELSIF deleting THEN
        operacion := 'D';
    END IF;

    INSERT INTO control_log VALUES (
        user,
        sysdate,
        'LINEAS_FACTURA',
        operacion
    );

END tr_lineas_factura;
/

CREATE OR REPLACE TRIGGER t_lineas_facturas_precio AFTER
    DELETE OR INSERT OR UPDATE ON lineas_factura
    FOR EACH ROW
DECLARE
    total_cambio NUMBER := 0;
BEGIN
    IF inserting THEN
        UPDATE productos
        SET
            total_vendidos = total_vendidos + ( :new.pvp * :new.unidades )
        WHERE cod_producto = :new.cod_producto;

    END IF;

    IF updating THEN
        total_cambio := ( :new.pvp * :new.unidades ) - ( :old.pvp * :old.unidades );

        UPDATE productos
        SET
            total_vendidos = total_vendidos + total_cambio
        WHERE cod_producto = :new.cod_producto;

    END IF;

    IF deleting THEN
        UPDATE productos
        SET
            total_vendidos = total_vendidos - ( :old.pvp * :old.unidades )
        WHERE cod_producto = :old.cod_producto;

    END IF;

END t_lineas_facturas_precio;