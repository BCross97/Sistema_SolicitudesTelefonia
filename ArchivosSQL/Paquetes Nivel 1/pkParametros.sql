--Paquete tabla PARAMETROS
CREATE OR REPLACE PACKAGE pkParametros AS
  PROCEDURE pInsertar(ivId IN VARCHAR2, ivNombre IN VARCHAR2, ivValor IN VARCHAR2);
  PROCEDURE pBorrar (ivId IN VARCHAR2);
  PROCEDURE pModificar (ivId IN VARCHAR2, ivNombre IN VARCHAR2, ivValor IN VARCHAR2);
  FUNCTION fConsultar (ivId IN NUMBER) return PARAMETROS%rowtype;
END pkParametros;
/
CREATE OR REPLACE PACKAGE BODY pkParametros AS
  --Procedimiento insertar
  PROCEDURE pInsertar(ivId IN VARCHAR2, ivNombre IN VARCHAR2, ivValor IN VARCHAR2)
  IS
  BEGIN
    INSERT INTO PARAMETROS VALUES (ivId, ivNombre, ivValor);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar el parametro'||SQLCODE);
  END pInsertar;
  --Procedimiento borrar
  PROCEDURE pBorrar (ivId IN VARCHAR2)
  IS
  BEGIN
    DELETE FROM PARAMETROS
    WHERE IDPARAMETRO = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al borrar el parametro'||SQLCODE);
  END pBorrar;
  --Procedimiento modificar
  PROCEDURE pModificar (ivId IN VARCHAR2, ivNombre IN VARCHAR2, ivValor IN VARCHAR2)
  IS
  BEGIN
    UPDATE PARAMETROS
    SET NOMBREPARAMETRO = ivNombre, VALORPARAMETRO = ivValor
    WHERE IDPARAMETRO = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al modificar el parametro'||SQLCODE);
  END pModificar;
  --Funcion consultar
  FUNCTION fConsultar (ivId IN NUMBER) return PARAMETROS%rowtype
  IS
  tabla PARAMETROS%rowtype;
  BEGIN
    SELECT * INTO tabla
    FROM PARAMETROS
    WHERE IDPARAMETRO = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al consultar el parametro'||SQLCODE);
  END fConsultar;
END pkParametros;