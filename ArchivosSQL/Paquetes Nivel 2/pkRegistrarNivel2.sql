create or replace PACKAGE pkRegistroNivel2 AS
  PROCEDURE pRegistrarCliente(ivCedula IN VARCHAR2, ivNombre IN VARCHAR2);
  PROCEDURE pRegistrarFuncionario(ivCedula IN VARCHAR2, ivNombre IN VARCHAR2, ivContrasenia IN VARCHAR2);
  PROCEDURE pRegistrarParametros(ivId IN VARCHAR2, ivNombre IN VARCHAR2, ivValor IN VARCHAR2);
  PROCEDURE pRegistrarProducto(ivId IN NUMBER, ivFechaInicio IN DATE, ivTipoProducto_Id IN NUMBER, ivCliente_Cedula IN VARCHAR2);
  PROCEDURE pRegistrarSolicitud(ivId IN NUMBER, ivEstado IN VARCHAR2, ivObservacion IN VARCHAR2, ivFechaInicio IN DATE, ivFechaFin IN DATE, ivProducto_Id IN NUMBER, ivTipoProducto_Id IN NUMBER, ivTipoAnomalia_Id IN NUMBER, ivFuncionario_Cedula IN VARCHAR2, ivTipoSolicitud_Id IN NUMBER, ivCclienteCedula IN VARCHAR2);
  PROCEDURE pRegistrarTipoAnomalia(ivId IN NUMBER, ivNombre IN VARCHAR2);
  PROCEDURE pRegistrarTipoProducto(ivId IN NUMBER, ivNombre IN VARCHAR2);
  PROCEDURE pRegistrarTipoSolicitud(ivId IN NUMBER, ivNombre IN VARCHAR2);
END pkRegistroNivel2;
/
create or replace PACKAGE BODY pkRegistroNivel2 AS
  PROCEDURE pRegistrarCliente(ivCedula IN VARCHAR2, ivNombre IN VARCHAR2)
  IS 
  BEGIN
      PKCLIENTE.PINSERTAR(ivCedula, ivNombre);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar en la tabla Cliente'||SQLCODE);
  END pRegistrarCliente;

  PROCEDURE pRegistrarFuncionario(ivCedula IN VARCHAR2, ivNombre IN VARCHAR2, ivContrasenia IN VARCHAR2)
  IS
  BEGIN 
      PKFUNCIONARIO.PINSERTAR(ivCedula, ivNombre, ivContrasenia);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar en la tabla Funcionario'||SQLCODE);
  END pRegistrarFuncionario;

  PROCEDURE pRegistrarParametros(ivId IN VARCHAR2, ivNombre IN VARCHAR2, ivValor IN VARCHAR2)
  IS
  BEGIN
      PKPARAMETROS.PINSERTAR(ivId, ivNombre, ivValor);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar en la tabla Parametros'||SQLCODE);
  END pRegistrarParametros;

  PROCEDURE pRegistrarProducto(ivId IN NUMBER, ivFechaInicio IN DATE, ivTipoProducto_Id IN NUMBER, ivCliente_Cedula IN VARCHAR2)
  IS
  BEGIN
      PKPRODUCTO.PINSERTAR(ivId, ivFechaInicio, ivTipoProducto_Id, ivCliente_Cedula);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar en la tabla Producto'||SQLCODE);
  END pRegistrarProducto;

  PROCEDURE pRegistrarSolicitud(ivId IN NUMBER, ivEstado IN VARCHAR2, ivObservacion IN VARCHAR2, ivFechaInicio IN DATE, ivFechaFin IN DATE, ivProducto_Id IN NUMBER, ivTipoProducto_Id IN NUMBER, ivTipoAnomalia_Id IN NUMBER, ivFuncionario_Cedula IN VARCHAR2, ivTipoSolicitud_Id IN NUMBER, ivCclienteCedula IN VARCHAR2)
  IS
  BEGIN
      PKSOLICITUD.PINSERTAR(ivId, ivEstado, ivObservacion, ivFechaInicio, null, ivProducto_Id, ivTipoProducto_Id, ivTipoAnomalia_Id, '-1', ivTipoSolicitud_Id, ivCclienteCedula);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar en la tabla Solicitud'||SQLCODE);
  END pRegistrarSolicitud;

  PROCEDURE pRegistrarTipoAnomalia(ivId IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
      PKTIPOANOMALIA.PINSERTAR(ivId, ivNombre);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar en la tabla Anomalia'||SQLCODE);
  END pRegistrarTipoAnomalia;

  PROCEDURE pRegistrarTipoProducto(ivId IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
      PKTIPOPRODUCTO.PINSERTAR(ivId, ivNombre);
    EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar en la tabla TipoProducto'||SQLCODE);
  END pRegistrarTipoProducto;

  PROCEDURE pRegistrarTipoSolicitud(ivId IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
      PKTIPOSOLICITUD.PINSERTAR(ivId, ivNombre);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al insertar en la tabla TipoSolicitud'||SQLCODE);
  END pRegistrarTipoSolicitud;
  
END pkRegistroNivel2;