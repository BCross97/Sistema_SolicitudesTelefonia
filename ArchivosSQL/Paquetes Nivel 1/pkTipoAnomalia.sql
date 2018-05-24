--Paquete tabla TIPOANOMALIA
CREATE OR REPLACE PACKAGE pkTipoAnomalia AS
  PROCEDURE pInsertar(ivId IN NUMBER, ivNombre IN VARCHAR2);
  PROCEDURE pBorrar (ivId IN NUMBER);
  PROCEDURE pModificar (ivId IN NUMBER, ivNombre IN VARCHAR2);
  FUNCTION fConsultar (ivId IN NUMBER) return TIPOANOMALIA%rowtype;
END pkTipoAnomalia;
/
CREATE OR REPLACE PACKAGE BODY pkTipoAnomalia AS
  --Procedimiento insertar
  PROCEDURE pInsertar(ivId IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
    INSERT INTO TIPOANOMALIA VALUES (ivId, ivNombre);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar el tipo de producto'||SQLCODE);
  END pInsertar;
  --Procedimiento borrar
  PROCEDURE pBorrar (ivId IN NUMBER)
  IS
  BEGIN
    DELETE FROM TIPOANOMALIA
    WHERE ID = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al borrar el tipo de producto'||SQLCODE);
  END pBorrar;
  --Procedimiento modificar
  PROCEDURE pModificar (ivId IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
    UPDATE TIPOANOMALIA
    SET  NOMBREANOMALIA = ivNombre
    WHERE ID = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al modificar el tipo de producto'||SQLCODE);
  END pModificar;
  --Funcion consultar
  FUNCTION fConsultar (ivId IN NUMBER) return TIPOANOMALIA%rowtype
  IS
  tabla TIPOANOMALIA%rowtype;
  BEGIN
    SELECT * INTO tabla
    FROM TIPOANOMALIA
    WHERE ID = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al consultar el tipo de producto'||SQLCODE);
  END fConsultar;
END pkTipoAnomalia;