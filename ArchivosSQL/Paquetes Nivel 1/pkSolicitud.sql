--Paquete tabla SOLICITUD
CREATE OR REPLACE PACKAGE pkSolicitud AS
  PROCEDURE pInsertar(ivId IN NUMBER, ivEstado IN VARCHAR2, ivObservacion IN VARCHAR2, ivFechaInicio IN DATE, ivFechaFin IN DATE, ivProducto_Id IN NUMBER, ivTipoProducto_Id IN NUMBER, ivTipoAnomalia_Id IN NUMBER, ivFuncionario_Cedula IN VARCHAR2, ivTipoSolicitud_Id IN NUMBER, ivCclienteCedula IN VARCHAR2);
  PROCEDURE pBorrar (ivId IN NUMBER);
  PROCEDURE pModificar (ivId IN NUMBER, ivEstado IN VARCHAR2, ivObservacion IN VARCHAR2, ivFechaInicio IN DATE, ivFechaFin IN DATE, ivProducto_Id IN NUMBER, ivTipoProducto_Id IN NUMBER, ivTipoAnomalia_Id IN NUMBER, ivFuncionario_Cedula IN VARCHAR2, ivTipoSolicitud_Id IN NUMBER, ivCclienteCedula IN VARCHAR2);
  FUNCTION fConsultar (ivId IN NUMBER) return SOLICITUD%rowtype;
END pkSolicitud;
/
CREATE OR REPLACE PACKAGE BODY pkSolicitud AS
  --Procedimiento insertar
  PROCEDURE pInsertar(ivId IN NUMBER, ivEstado IN VARCHAR2, ivObservacion IN VARCHAR2, ivFechaInicio IN DATE, ivFechaFin IN DATE, ivProducto_Id IN NUMBER, ivTipoProducto_Id IN NUMBER, ivTipoAnomalia_Id IN NUMBER, ivFuncionario_Cedula IN VARCHAR2, ivTipoSolicitud_Id IN NUMBER, ivCclienteCedula IN VARCHAR2)
  IS
  BEGIN
    INSERT INTO SOLICITUD VALUES (ivId, ivEstado, ivObservacion, ivFechaInicio, ivFechaFin, ivProducto_Id, ivTipoProducto_Id, ivTipoAnomalia_Id, ivFuncionario_Cedula, ivTipoSolicitud_Id, ivCclienteCedula);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar la solicitud'||SQLCODE);
  END pInsertar;
  --Procedimiento borrar
  PROCEDURE pBorrar (ivId IN NUMBER)
  IS
  BEGIN
    DELETE FROM SOLICITUD
    WHERE ID = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al borrar la solicitud'||SQLCODE);
  END pBorrar;
  --Procedimiento modificar
  PROCEDURE pModificar (ivId IN NUMBER, ivEstado IN VARCHAR2, ivObservacion IN VARCHAR2, ivFechaInicio IN DATE, ivFechaFin IN DATE, ivProducto_Id IN NUMBER, ivTipoProducto_Id IN NUMBER, ivTipoAnomalia_Id IN NUMBER, ivFuncionario_Cedula IN VARCHAR2, ivTipoSolicitud_Id IN NUMBER, ivCclienteCedula IN VARCHAR2)
  IS
  BEGIN
    UPDATE SOLICITUD
    SET ID = ivId, ESTADO = ivEstado, OBSERVACION = ivObservacion, FECHAINICIO = ivFechaInicio, FECHAFIN = ivFechaFin, PRODUCTO_ID = ivProducto_Id, TIPOPRODUCTO_ID = ivTipoProducto_Id, TIPOANOMALIA_ID = ivTipoAnomalia_Id, FUNCIONARIO_CEDULA = ivFuncionario_Cedula, TIPOSOLICITUD_ID = ivTipoSolicitud_Id, CLIENTE_CEDULA = ivCclienteCedula
    WHERE ID = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al modificar la solicitud'||SQLCODE);
  END pModificar;
  --Funcion consultar
  FUNCTION fConsultar (ivId IN NUMBER) return SOLICITUD%rowtype
  IS
  tabla SOLICITUD%rowtype;
  BEGIN
    SELECT * INTO tabla
    FROM SOLICITUD
    WHERE ID = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al consultar la solicitud'||SQLCODE);
  END fConsultar;
END pkSolicitud;