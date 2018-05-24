create or replace PACKAGE pkEliminarNivel2 AS
  PROCEDURE pEliminarCliente(ivCedula IN VARCHAR2);
  PROCEDURE pEliminarFuncionario(ivCedula IN VARCHAR2);
  PROCEDURE pEliminarParametros(ivId IN VARCHAR2);
  PROCEDURE pEliminarProducto(ivId IN NUMBER);
  PROCEDURE pEliminarSolicitud(ivId IN NUMBER);
  PROCEDURE pEliminarTipoAnomalia(ivId IN NUMBER);
  PROCEDURE pEliminarTipoProducto(ivId IN NUMBER);
  PROCEDURE pEliminarTipoSolicitud(ivId IN NUMBER);
END pkEliminarNivel2;
/

create or replace PACKAGE BODY pkEliminarNivel2 AS
  PROCEDURE pEliminarCliente(ivCedula IN VARCHAR2)
  IS 
  BEGIN
      PKCLIENTE.PBORRAR(ivCedula);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al eliminar en la tabla cliente'||SQLCODE);
  END pEliminarCliente;

  PROCEDURE pEliminarFuncionario(ivCedula IN VARCHAR2)
  IS
  BEGIN 
      PKFUNCIONARIO.PBORRAR(ivCedula);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al eliminar en la tabla Funcionario'||SQLCODE);
  END pEliminarFuncionario;

  PROCEDURE pEliminarParametros(ivId IN VARCHAR2)
  IS
  BEGIN
      PKPARAMETROS.PBORRAR(ivId);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al eliminar en la tabla Parametros'||SQLCODE);
  END pEliminarParametros;

  PROCEDURE pEliminarProducto(ivId IN NUMBER)
  IS
  BEGIN
      PKPRODUCTO.PBORRAR(ivId);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al eliminar en la tabla Producto'||SQLCODE);
  END pEliminarProducto;

  PROCEDURE pEliminarSolicitud(ivId IN NUMBER)
  IS
  BEGIN
      PKSOLICITUD.PBORRAR(ivId);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al eliminar en la tabla Solicitud'||SQLCODE);
  END pEliminarSolicitud;

  PROCEDURE pEliminarTipoAnomalia(ivId IN NUMBER)
  IS
  BEGIN
      PKTIPOANOMALIA.PBORRAR(ivId);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al eliminar en la tabla TipoAnomalia'||SQLCODE);
  END pEliminarTipoAnomalia;

  PROCEDURE pEliminarTipoProducto(ivId IN NUMBER)
  IS
  BEGIN
      PKTIPOPRODUCTO.PBORRAR(ivId);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al eliminar en la tabla TipoProducto'||SQLCODE);
  END pEliminarTipoProducto;

  PROCEDURE pEliminarTipoSolicitud(ivId IN NUMBER)
  IS
  BEGIN
      PKTIPOSOLICITUD.PBORRAR(ivId);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al eliminar en la tabla TipoSolicitud'||SQLCODE);
  END pEliminarTipoSolicitud;
  
END pkEliminarNivel2;