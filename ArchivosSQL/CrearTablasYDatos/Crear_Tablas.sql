-- Generado por Oracle SQL Developer Data Modeler 17.2.0.188.1059
--   en:        2018-05-16 10:10:03 COT
--   sitio:      Oracle Database 10g
--   tipo:      Oracle Database 10g


DROP TABLE cliente CASCADE CONSTRAINTS;
DROP TABLE funcionario CASCADE CONSTRAINTS;
DROP TABLE parametros CASCADE CONSTRAINTS;
DROP TABLE producto CASCADE CONSTRAINTS;
DROP TABLE solicitud CASCADE CONSTRAINTS;
DROP TABLE tipoanomalia CASCADE CONSTRAINTS;
DROP TABLE tipoproducto CASCADE CONSTRAINTS;
DROP TABLE tiposolicitud CASCADE CONSTRAINTS;

CREATE TABLE cliente (
    cedula   VARCHAR2(30 CHAR) NOT NULL,
    nombre   VARCHAR2(30 CHAR) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( cedula );

CREATE TABLE funcionario (
    cedula   VARCHAR2(30 CHAR) NOT NULL,
    nombre   VARCHAR2(30 CHAR) NOT NULL,
    contrasenia VARCHAR2(30 CHAR) NOT NULL
);

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( cedula );

CREATE TABLE parametros (
    idparametro       VARCHAR2(30 CHAR) NOT NULL,
    nombreparametro   VARCHAR2(30 CHAR),
    valorparametro    VARCHAR2(30 CHAR)
);

ALTER TABLE parametros ADD CONSTRAINT parametros_pk PRIMARY KEY ( idparametro );

CREATE TABLE producto (
    id                NUMBER NOT NULL,
    fechainicio       DATE,
    tipoproducto_id   NUMBER(5) NOT NULL,
    cliente_cedula    VARCHAR2(30 CHAR) NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id );

CREATE TABLE solicitud (
    id                   NUMBER(10) NOT NULL,
    estado               VARCHAR2(30 CHAR),
    observacion          VARCHAR2(200 CHAR),
    fechainicio          DATE,
    fechafin             DATE,
    producto_id          NUMBER NOT NULL,
    tipoproducto_id      NUMBER(5) NOT NULL,
    tipoanomalia_id      NUMBER(10) NOT NULL,
    funcionario_cedula   VARCHAR2(30 CHAR) NOT NULL,
    tiposolicitud_id     NUMBER(10) NOT NULL,
    cliente_cedula       VARCHAR2(30 CHAR) NOT NULL
);

ALTER TABLE solicitud ADD CONSTRAINT solicitud_pk PRIMARY KEY ( id );

CREATE TABLE tipoanomalia (
    id               NUMBER(10) NOT NULL,
    nombreanomalia   VARCHAR2(30 CHAR)
);

ALTER TABLE tipoanomalia ADD CONSTRAINT tipoanomalia_pk PRIMARY KEY ( id );

CREATE TABLE tipoproducto (
    id                   NUMBER(5) NOT NULL,
    nombretipoproducto   VARCHAR2(30)
);

ALTER TABLE tipoproducto ADD CONSTRAINT tipoproducto_pk PRIMARY KEY ( id );

CREATE TABLE tiposolicitud (
    id                    NUMBER(10) NOT NULL,
    nombretiposolicitud   VARCHAR2(30 CHAR)
);

ALTER TABLE tiposolicitud ADD CONSTRAINT tiposolicitud_pk PRIMARY KEY ( id );

ALTER TABLE producto
    ADD CONSTRAINT producto_cliente_fk FOREIGN KEY ( cliente_cedula )
        REFERENCES cliente ( cedula )
    NOT DEFERRABLE;

ALTER TABLE producto
    ADD CONSTRAINT producto_tipoproducto_fk FOREIGN KEY ( tipoproducto_id )
        REFERENCES tipoproducto ( id )
    NOT DEFERRABLE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_cliente_fk FOREIGN KEY ( cliente_cedula )
        REFERENCES cliente ( cedula )
    NOT DEFERRABLE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_funcionario_fk FOREIGN KEY ( funcionario_cedula )
        REFERENCES funcionario ( cedula )
    NOT DEFERRABLE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES producto ( id )
    NOT DEFERRABLE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_tipoanomalia_fk FOREIGN KEY ( tipoanomalia_id )
        REFERENCES tipoanomalia ( id )
    NOT DEFERRABLE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_tipoproducto_fk FOREIGN KEY ( tipoproducto_id )
        REFERENCES tipoproducto ( id )
    NOT DEFERRABLE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_tiposolicitud_fk FOREIGN KEY ( tiposolicitud_id )
        REFERENCES tiposolicitud ( id )
    NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
