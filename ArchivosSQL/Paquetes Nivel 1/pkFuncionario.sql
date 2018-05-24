--Paquete tabla FUNCIONARIO
CREATE OR REPLACE PACKAGE pkFuncionario AS
  PROCEDURE pInsertar(ivCedula IN VARCHAR2, ivNombre IN VARCHAR2, ivContrasenia IN VARCHAR2);
  PROCEDURE pBorrar (ivCedula IN VARCHAR2);
  PROCEDURE pModificar (ivCedula IN VARCHAR2, ivNombre IN VARCHAR2, ivContrasenia IN VARCHAR2);
  FUNCTION fConsultar (ivId IN VARCHAR2) return FUNCIONARIO%rowtype;
END pkFuncionario;
/
CREATE OR REPLACE PACKAGE BODY pkFuncionario AS
  --Procedimiento insertar
  PROCEDURE pInsertar(ivCedula IN VARCHAR2, ivNombre IN VARCHAR2, ivContrasenia IN VARCHAR2)
  IS
  BEGIN
    INSERT INTO FUNCIONARIO VALUES (ivCedula, ivNombre, ivContrasenia);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar el funcionario'||SQLCODE);
  END pInsertar;
  --Procedimiento borrar
  PROCEDURE pBorrar (ivCedula IN VARCHAR2)
  IS
  BEGIN
    DELETE FROM FUNCIONARIO
    WHERE CEDULA = ivCedula;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al borrar el funcionario'||SQLCODE);
  END pBorrar;
  --Procedimiento modificar
  PROCEDURE pModificar (ivCedula IN VARCHAR2, ivNombre IN VARCHAR2, ivContrasenia IN VARCHAR2)
  IS
  BEGIN
    UPDATE FUNCIONARIO
    SET NOMBRE = ivNombre, CONTRASENIA = ivContrasenia
    WHERE CEDULA = ivCedula;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al modificar el funcionario'||SQLCODE);
  END pModificar;
  --Funcion consultar
  FUNCTION fConsultar (ivId IN VARCHAR2) return FUNCIONARIO%rowtype
  IS
  tabla FUNCIONARIO%rowtype;
  BEGIN
    SELECT * INTO tabla
    FROM FUNCIONARIO
    WHERE CEDULA = ivId;
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al consultar el funcionario'||SQLCODE);
  END fConsultar;
END pkFuncionario;