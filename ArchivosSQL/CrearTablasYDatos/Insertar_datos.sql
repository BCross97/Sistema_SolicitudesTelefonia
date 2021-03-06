
--INSERTAR VALORES NULOS
INSERT INTO  CLIENTE (CEDULA,NOMBRE) VALUES ('-1','NO APLICA');
INSERT INTO  FUNCIONARIO (CEDULA,NOMBRE,CONTRASENIA) VALUES ('-1','NO APLICA','NO APLICA');
INSERT INTO  TIPOANOMALIA (ID,NOMBREANOMALIA) VALUES ('-1','NO APLICA');
INSERT INTO  TIPOPRODUCTO (ID,NOMBRETIPOPRODUCTO) VALUES ('-1','NO APLICA');
INSERT INTO  TIPOSOLICITUD (ID,NOMBRETIPOSOLICITUD) VALUES ('-1','NO APLICA');
INSERT INTO  PRODUCTO (CLIENTE_CEDULA,FECHAINICIO,ID,TIPOPRODUCTO_ID) VALUES ('-1',NULL,'-1','-1');
INSERT INTO  SOLICITUD (CLIENTE_CEDULA,ESTADO,FECHAFIN,FECHAINICIO,FUNCIONARIO_CEDULA,ID,OBSERVACION,PRODUCTO_ID,TIPOANOMALIA_ID,TIPOPRODUCTO_ID,TIPOSOLICITUD_ID) VALUES ('-1','NO APLICA',NULL,NULL,'-1','-1','NO APLICA','-1','-1','-1','-1');

--INSERTAR  VALORES A CLIENTE
INSERT INTO  CLIENTE (CEDULA,NOMBRE) VALUES ('145785','DIEGO LAMUS');
INSERT INTO  CLIENTE (CEDULA,NOMBRE) VALUES ('154621','MATEO MARIN');
INSERT INTO  CLIENTE (CEDULA,NOMBRE) VALUES ('164618','PEPITO JULINA');
INSERT INTO  CLIENTE (CEDULA,NOMBRE) VALUES ('174612','JHONATAN GARZON');
INSERT INTO  CLIENTE (CEDULA,NOMBRE) VALUES ('184621','JULIAN GOMEZ');
INSERT INTO  CLIENTE (CEDULA,NOMBRE) VALUES ('193155','ANDRES PEREZ');

--INSERTAR VALORES A FUNCIONARIO
INSERT INTO  FUNCIONARIO (CEDULA,NOMBRE,CONTRASENIA) VALUES ('216845','FUNCIONARIO LAMUS','1234');
INSERT INTO  FUNCIONARIO (CEDULA,NOMBRE,CONTRASENIA) VALUES ('216515','FUNCIONARIO MARIN','1234');
INSERT INTO  FUNCIONARIO (CEDULA,NOMBRE,CONTRASENIA) VALUES ('265456','FUNCIONARIO JULIAN','1234');
INSERT INTO  FUNCIONARIO (CEDULA,NOMBRE,CONTRASENIA) VALUES ('651321','FUNCIONARIO ANDRES','1234');

--INSERTAR PARAMETROS
INSERT INTO PARAMETROS (IDPARAMETRO,NOMBREPARAMETRO,VALORPARAMETRO) VALUES ('1','MAXIMO SOLICITUDES ASIGANDA','3');

--INSERTAR ANOMALIAS
INSERT INTO  TIPOANOMALIA (ID,NOMBREANOMALIA) VALUES ('1','BAJA VELOCIDAD');
INSERT INTO  TIPOANOMALIA (ID,NOMBREANOMALIA) VALUES ('2','MALA CALIDAD SERVICIO');
INSERT INTO  TIPOANOMALIA (ID,NOMBREANOMALIA) VALUES ('3','SIN SERVICIO');
INSERT INTO  TIPOANOMALIA (ID,NOMBREANOMALIA) VALUES ('4','OTRA');

--INSERTAR TIPOS DE PRODUCTOS
INSERT INTO TIPOPRODUCTO (ID,NOMBRETIPOPRODUCTO) VALUES ('1','VOZ');
INSERT INTO TIPOPRODUCTO (ID,NOMBRETIPOPRODUCTO) VALUES ('2','DATOS');
INSERT INTO TIPOPRODUCTO (ID,NOMBRETIPOPRODUCTO) VALUES ('3','INTEGRADO');

--INSERTAR TIPOS DE SOLICITUDES
INSERT INTO TIPOSOLICITUD (ID,NOMBRETIPOSOLICITUD) VALUES ('1','CREACION');
INSERT INTO TIPOSOLICITUD (ID,NOMBRETIPOSOLICITUD) VALUES ('2','MODIFICACION');
INSERT INTO TIPOSOLICITUD (ID,NOMBRETIPOSOLICITUD) VALUES ('3','CANCELACION');
INSERT INTO TIPOSOLICITUD (ID,NOMBRETIPOSOLICITUD) VALUES ('4','DAÑO');
INSERT INTO TIPOSOLICITUD (ID,NOMBRETIPOSOLICITUD) VALUES ('5','RECLAMO');

--INSERTAR PRODUCTOS
INSERT INTO PRODUCTO (ID,FECHAINICIO,TIPOPRODUCTO_ID,CLIENTE_CEDULA) VALUES ('1',TO_DATE('12/05/2018', 'DD/MM/YYYY'),'1','145785');
INSERT INTO PRODUCTO (ID,FECHAINICIO,TIPOPRODUCTO_ID,CLIENTE_CEDULA) VALUES ('2',TO_DATE('13/05/2018', 'DD/MM/YYYY'),'1','154621');
INSERT INTO PRODUCTO (ID,FECHAINICIO,TIPOPRODUCTO_ID,CLIENTE_CEDULA) VALUES ('3',TO_DATE('15/05/2018', 'DD/MM/YYYY'),'1','164618');
INSERT INTO PRODUCTO (ID,FECHAINICIO,TIPOPRODUCTO_ID,CLIENTE_CEDULA) VALUES ('4',TO_DATE('16/05/2018', 'DD/MM/YYYY'),'2','174612');
INSERT INTO PRODUCTO (ID,FECHAINICIO,TIPOPRODUCTO_ID,CLIENTE_CEDULA) VALUES ('5',TO_DATE('18/05/2018', 'DD/MM/YYYY'),'3','184621');
INSERT INTO PRODUCTO (ID,FECHAINICIO,TIPOPRODUCTO_ID,CLIENTE_CEDULA) VALUES ('6',TO_DATE('19/05/2018', 'DD/MM/YYYY'),'1','193155');
INSERT INTO PRODUCTO (ID,FECHAINICIO,TIPOPRODUCTO_ID,CLIENTE_CEDULA) VALUES ('7',TO_DATE('20/05/2018', 'DD/MM/YYYY'),'2','193155');

--INSERTAR SOLICITUDES
INSERT INTO  SOLICITUD (CLIENTE_CEDULA,ESTADO,FECHAINICIO,FECHAFIN,FUNCIONARIO_CEDULA,ID,OBSERVACION,PRODUCTO_ID,TIPOANOMALIA_ID,TIPOPRODUCTO_ID,TIPOSOLICITUD_ID) VALUES ('145785','ASIGNADA',TO_DATE('22/05/2018', 'DD/MM/YYYY'),NULL,'216845','1','CREACION','-1','-1','3','1');
INSERT INTO  SOLICITUD (CLIENTE_CEDULA,ESTADO,FECHAINICIO,FECHAFIN,FUNCIONARIO_CEDULA,ID,OBSERVACION,PRODUCTO_ID,TIPOANOMALIA_ID,TIPOPRODUCTO_ID,TIPOSOLICITUD_ID) VALUES ('164618','ASIGNADA',TO_DATE('23/05/2018', 'DD/MM/YYYY'),NULL,'216845','2','MODIFICACION','3','-1','2','2');
INSERT INTO  SOLICITUD (CLIENTE_CEDULA,ESTADO,FECHAINICIO,FECHAFIN,FUNCIONARIO_CEDULA,ID,OBSERVACION,PRODUCTO_ID,TIPOANOMALIA_ID,TIPOPRODUCTO_ID,TIPOSOLICITUD_ID) VALUES ('193155','RESUELTA',TO_DATE('23/05/2018', 'DD/MM/YYYY'),TO_DATE('25/05/2018', 'DD/MM/YYYY'),'265456','3','QUEJA','7','-1','-1','5');
INSERT INTO  SOLICITUD (CLIENTE_CEDULA,ESTADO,FECHAINICIO,FECHAFIN,FUNCIONARIO_CEDULA,ID,OBSERVACION,PRODUCTO_ID,TIPOANOMALIA_ID,TIPOPRODUCTO_ID,TIPOSOLICITUD_ID) VALUES ('184621','PENDIENTE',NULL,NULL,'651321','4','DAÑO','5','3','-1','4');



