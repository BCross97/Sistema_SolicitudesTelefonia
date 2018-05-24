--Paquete tabla CLIENTE
create or replace PACKAGE pkCliente AS
  PROCEDURE pInsertar(ivCedula IN NUMBER, ivNombre IN VARCHAR2);
  PROCEDURE pBorrar (ivCedula IN NUMBER);
  PROCEDURE pModificar (ivCedula IN NUMBER, ivNombre IN VARCHAR2);
  FUNCTION fConsultar (ivCedula IN NUMBER) return CLIENTE%rowtype;
END pkCliente;
/
create or replace PACKAGE BODY pkCliente AS
  --Procedimiento insertar
  PROCEDURE pInsertar(ivCedula IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
    INSERT INTO CLIENTE VALUES (ivCedula, ivNombre);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar en la tabla cliente'||SQLCODE);
  END pInsertar;
  --Procedimiento borrar
  PROCEDURE pBorrar (ivCedula IN NUMBER)
  IS
  BEGIN
    DELETE FROM CLIENTE
    WHERE CEDULA = ivCedula;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al borrar el cliente'||SQLCODE);
  END pBorrar;
  --Procedimiento modificar
  PROCEDURE pModificar (ivCedula IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
    UPDATE CLIENTE
    SET NOMBRE = ivNombre
    WHERE CEDULA = ivCedula;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al modificar el cliente'||SQLCODE);
  END pModificar;
  --Funcion consultar
  FUNCTION fConsultar (ivCedula IN NUMBER) return CLIENTE%rowtype
  IS
  tabla CLIENTE%rowtype;
  BEGIN
    SELECT * INTO tabla
    FROM CLIENTE
    WHERE CEDULA = ivCedula;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al consultar un cliente'||SQLCODE);
  END fConsultar;
END pkCliente;