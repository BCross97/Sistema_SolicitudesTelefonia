--Paquete tabla TIPOSOLICITUD
create or replace PACKAGE pkTipoSolicitud AS
  PROCEDURE pInsertar(ivId IN NUMBER, ivNombre IN VARCHAR2);
  PROCEDURE pBorrar (ivId IN NUMBER);
  PROCEDURE pModificar (ivId IN NUMBER, ivNombre IN VARCHAR2);
  FUNCTION fConsultar (ivId IN NUMBER) return TIPOSOLICITUD%rowtype;
END pkTipoSolicitud;
/
create or replace PACKAGE BODY pkTipoSolicitud AS 
  --Procedimiento insertar
  PROCEDURE pInsertar(ivId IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
    INSERT INTO TIPOSOLICITUD VALUES (ivId, ivNombre);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar un tipo de solicitud'||SQLCODE);
  END pInsertar;
  --Procedimiento borrar
  PROCEDURE pBorrar (ivId IN NUMBER)
  IS
  BEGIN
    DELETE FROM TIPOSOLICITUD
    WHERE ID = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al borrar un tipo de solicitud'||SQLCODE);
  END pBorrar;
  --Procedimiento modificar
  PROCEDURE pModificar (ivId IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
    UPDATE TIPOSOLICITUD
    SET  NOMBRETIPOSOLICITUD = ivNombre
    WHERE ID = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al modificar un tipo de solicitud'||SQLCODE);
  END pModificar;
  --Funcion consultar
  FUNCTION fConsultar (ivId IN NUMBER) return TIPOSOLICITUD%rowtype
  IS
  tabla TIPOSOLICITUD%rowtype;
  BEGIN
    SELECT * INTO tabla
    FROM TIPOSOLICITUD
    WHERE ID = ivId;
    EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al consultar un tipo de solicitud'||SQLCODE);
  END fConsultar;
END pkTipoSolicitud;