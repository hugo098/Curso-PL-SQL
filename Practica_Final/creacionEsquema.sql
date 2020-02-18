--------------------------------------------------------
-- DDL for Table LINEAS_FACTURA
--------------------------------------------------------
CREATE TABLE "HUGO_RODRIGUEZ"."LINEAS_FACTURA" (
    "COD_FACTURA"    NUMBER,
    "COD_PRODUCTO"   NUMBER,
    "PVP"            NUMBER,
    "UNIDADES"       NUMBER,
    "FECHA"          DATE
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "USERS";
--------------------------------------------------------
-- DDL for Table FACTURAS
--------------------------------------------------------

CREATE TABLE "HUGO_RODRIGUEZ"."FACTURAS" (
    "COD_FACTURA"   NUMBER(5, 0),
    "FECHA"         DATE,
    "DESCRIPCION"   VARCHAR2(100 BYTE)
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "USERS";
--------------------------------------------------------
-- DDL for Table PRODUCTOS
--------------------------------------------------------

CREATE TABLE "HUGO_RODRIGUEZ"."PRODUCTOS" (
    "COD_PRODUCTO"      NUMBER,
    "NOMBRE_PRODUCTO"   VARCHAR2(50 BYTE),
    "PVP"               NUMBER,
    "TOTAL_VENDIDOS"    NUMBER
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "USERS";
--------------------------------------------------------
-- DDL for Table CONTROL_LOG
--------------------------------------------------------

CREATE TABLE "HUGO_RODRIGUEZ"."CONTROL_LOG" (
    "COD_EMPLEADO"    NUMBER,
    "FECHA"           DATE,
    "TABLA"           VARCHAR2(20 BYTE),
    "COD_OPERACION"   CHAR(1 BYTE)
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
TABLESPACE "USERS";
REM INSERTING into HR.LINEAS_FACTURA

SET DEFINE OFF;
--------------------------------------------------------
-- DDL for Index LINEAS_FACTURA_PK
--------------------------------------------------------

CREATE UNIQUE INDEX "HUGO_RODRIGUEZ"."LINEAS_FACTURA_PK" ON
    "HUGO_RODRIGUEZ"."LINEAS_FACTURA" (
        "COD_FACTURA",
        "COD_PRODUCTO"
    )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "USERS";
----
--------------------------------------------------------
-- Constraints for Table LINEAS_FACTURA
--------------------------------------------------------

ALTER TABLE "HUGO_RODRIGUEZ"."LINEAS_FACTURA"
    ADD CONSTRAINT "LINEAS_FACTURA_PK" PRIMARY KEY ( "COD_FACTURA",
                                                     "COD_PRODUCTO" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "USERS"
    ENABLE;

ALTER TABLE "HUGO_RODRIGUEZ"."LINEAS_FACTURA" MODIFY (
    "COD_PRODUCTO"
        NOT NULL ENABLE
);

ALTER TABLE "HUGO_RODRIGUEZ"."LINEAS_FACTURA" MODIFY (
    "COD_FACTURA"
        NOT NULL ENABLE
);
REM INSERTING into HUGO_RODRIGUEZ.PRODUCTOS

SET DEFINE OFF;

INSERT INTO HUGO_RODRIGUEZ.productos (
    cod_producto,
    nombre_producto,
    pvp,
    total_vendidos
) VALUES (
    '1',
    'TORNILLO',
    '1',
    NULL
);

INSERT INTO HUGO_RODRIGUEZ.productos (
    cod_producto,
    nombre_producto,
    pvp,
    total_vendidos
) VALUES (
    '2',
    'TUERCA',
    '5',
    NULL
);

INSERT INTO HUGO_RODRIGUEZ.productos (
    cod_producto,
    nombre_producto,
    pvp,
    total_vendidos
) VALUES (
    '3',
    'ARANDELA',
    '4',
    NULL
);

INSERT INTO HUGO_RODRIGUEZ.productos (
    cod_producto,
    nombre_producto,
    pvp,
    total_vendidos
) VALUES (
    '4',
    'MARTILLO',
    '40',
    NULL
);

INSERT INTO HUGO_RODRIGUEZ.productos (
    cod_producto,
    nombre_producto,
    pvp,
    total_vendidos
) VALUES (
    '5',
    'CLAVO',
    '1',
    NULL
);