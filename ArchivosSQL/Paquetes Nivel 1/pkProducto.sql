--Paquete tabla PRODUCTO
CREATE OR REPLACE PACKAGE pkProducto AS
  PROCEDURE pInsertar(ivId IN NUMBER, ivFechaInicio IN DATE, ivTipoProducto_Id IN NUMBER, ivCliente_Cedula IN VARCHAR2);
  PROCEDURE pBorrar (ivId IN NUMBER);
  PROCEDURE pModificar (ivId IN NUMBER, ivFechaInicio IN DATE, ivTipoProducto_Id IN NUMBER,ivCliente_Cedula IN VARCHAR2);
  FUNCTION fConsultar (ivId IN NUMBER) return PRODUCTO%rowtype;
END pkProducto;
/
CREATE OR REPLACE PACKAGE BODY pkProducto AS
  --Procedimiento insertar
  PROCEDURE pInsertar(ivId IN NUMBER, ivFechaInicio IN DATE, ivTipoProducto_Id IN NUMBER, ivCliente_Cedula IN VARCHAR2)
  IS
  BEGIN
    INSERT INTO PRODUCTO VALUES (ivId, ivFechaInicio,ivTipoProducto_Id, ivCliente_Cedula);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar el producto'||SQLCODE);
  END pInsertar;
  --Procedimiento borrar
  PROCEDURE pBorrar (ivId IN NUMBER)
  IS
  BEGIN
    DELETE FROM PRODUCTO
    WHERE ID = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al borrar el producto'||SQLCODE);
  END pBorrar;
  --Procedimiento modificar
  PROCEDURE pModificar (ivId IN NUMBER, ivFechaInicio IN DATE, ivTipoProducto_Id IN NUMBER, ivCliente_Cedula IN VARCHAR2)
  IS
  BEGIN
    UPDATE PRODUCTO
    SET FECHAINICIO = ivFechaInicio, TIPOPRODUCTO_ID = ivTipoProducto_Id, CLIENTE_CEDULA = ivCliente_Cedula
    WHERE ID = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al modificar el producto'||SQLCODE);
  END pModificar;
  --Funcion consultar
  FUNCTION fConsultar (ivId IN NUMBER) return PRODUCTO%rowtype
  IS
  tabla PRODUCTO%rowtype;
  BEGIN
    SELECT * INTO tabla
    FROM PRODUCTO
    WHERE ID = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al consultar el producto'||SQLCODE);
  END fConsultar;
END pkProducto;