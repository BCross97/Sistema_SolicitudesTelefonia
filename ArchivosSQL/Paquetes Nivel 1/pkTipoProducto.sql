--Paquete tabla TIPOPRODUCTO
create or replace PACKAGE pkTipoProducto AS
  PROCEDURE pInsertar(ivId IN NUMBER, ivNombre IN VARCHAR2);
  PROCEDURE pBorrar (ivId IN NUMBER);
  PROCEDURE pModificar (ivId IN NUMBER, ivNombre IN VARCHAR2);
  FUNCTION fConsultar (ivId IN NUMBER) return TIPOPRODUCTO%rowtype;
END pkTipoProducto;
/
create or replace PACKAGE BODY pkTipoProducto AS
  --Procedimiento insertar
  PROCEDURE pInsertar(ivId IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
    INSERT INTO TIPOPRODUCTO VALUES (ivId, ivNombre);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar un tipo de producto'||SQLCODE);
  END pInsertar;
  --Procedimiento borrar
  PROCEDURE pBorrar (ivId IN NUMBER)
  IS
  BEGIN
    DELETE FROM TIPOPRODUCTO
    WHERE ID = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al borrar un tipo de producto'||SQLCODE);
  END pBorrar;
  --Procedimiento modificar
  PROCEDURE pModificar (ivId IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
    UPDATE TIPOPRODUCTO
    SET  NOMBRETIPOPRODUCTO = ivNombre
    WHERE ID = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al modificar un tipo de producto'||SQLCODE);
  END pModificar;
  --Funcion consultar
  FUNCTION fConsultar (ivId IN NUMBER) return TIPOPRODUCTO%rowtype
  IS
  tabla TIPOPRODUCTO%rowtype;
  BEGIN
    SELECT * INTO tabla
    FROM TIPOPRODUCTO
    WHERE ID = ivId;
    EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al consultar un tipo de producto'||SQLCODE);
  END fConsultar;
END pkTipoProducto;