create or replace PACKAGE pkModificarNivel2 AS
  PROCEDURE pModificarCliente(ivCedula IN VARCHAR2, ivNombre IN VARCHAR2);
  PROCEDURE pModificarFuncionario(ivCedula IN VARCHAR2, ivNombre IN VARCHAR2, ivContrasenia IN VARCHAR2);
  PROCEDURE pModificarParametros(ivId IN VARCHAR2, ivNombre IN VARCHAR2, ivValor IN VARCHAR2);
  PROCEDURE pModificarProducto(ivId IN NUMBER, ivFechaInicio IN DATE, ivTipoProducto_Id IN NUMBER, ivCliente_Cedula IN VARCHAR2);
  PROCEDURE pModificarSolicitud(ivId IN NUMBER, ivEstado IN VARCHAR2, ivObservacion IN VARCHAR2, ivFechaInicio IN DATE, ivFechaFin IN DATE, ivProducto_Id IN NUMBER, ivTipoProducto_Id IN NUMBER, ivTipoAnomalia_Id IN NUMBER, ivFuncionario_Cedula IN VARCHAR2, ivTipoSolicitud_Id IN NUMBER, ivCclienteCedula IN VARCHAR2);
  PROCEDURE pModificarTipoAnomalia(ivId IN NUMBER, ivNombre IN VARCHAR2);
  PROCEDURE pModificarTipoProducto(ivId IN NUMBER, ivNombre IN VARCHAR2);
  PROCEDURE pModificarTipoSolicitud(ivId IN NUMBER, ivNombre IN VARCHAR2);
END pkModificarNivel2;
/
create or replace PACKAGE BODY pkModificarNivel2 AS
  PROCEDURE pModificarCliente(ivCedula IN VARCHAR2, ivNombre IN VARCHAR2)
  IS 
  BEGIN
      PKCLIENTE.PMODIFICAR(ivCedula, ivNombre);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al MODIFICAR en la tabla Cliente'||SQLCODE);
  END pModificarCliente;

  PROCEDURE pModificarFuncionario(ivCedula IN VARCHAR2, ivNombre IN VARCHAR2, ivContrasenia IN VARCHAR2)
  IS
  BEGIN 
      PKFUNCIONARIO.PMODIFICAR(ivCedula, ivNombre, ivContrasenia);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al MODIFICAR en la tabla Funcionario'||SQLCODE);
  END pModificarFuncionario;

  PROCEDURE pModificarParametros(ivId IN VARCHAR2, ivNombre IN VARCHAR2, ivValor IN VARCHAR2)
  IS
  BEGIN
      PKPARAMETROS.PMODIFICAR(ivId, ivNombre, ivValor);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al MODIFICAR en la tabla Parametros'||SQLCODE);
  END pModificarParametros;

  PROCEDURE pModificarProducto(ivId IN NUMBER, ivFechaInicio IN DATE, ivTipoProducto_Id IN NUMBER, ivCliente_Cedula IN VARCHAR2)
  IS
  BEGIN
      PKPRODUCTO.PMODIFICAR(ivId, ivFechaInicio, ivTipoProducto_Id, ivCliente_Cedula);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al MODIFICAR en la tabla Producto'||SQLCODE);
  END pModificarProducto;

  PROCEDURE pModificarSolicitud(ivId IN NUMBER, ivEstado IN VARCHAR2, ivObservacion IN VARCHAR2, ivFechaInicio IN DATE, ivFechaFin IN DATE, ivProducto_Id IN NUMBER, ivTipoProducto_Id IN NUMBER, ivTipoAnomalia_Id IN NUMBER, ivFuncionario_Cedula IN VARCHAR2, ivTipoSolicitud_Id IN NUMBER, ivCclienteCedula IN VARCHAR2)
  IS
  BEGIN
      PKSOLICITUD.PMODIFICAR(ivId, ivEstado, ivObservacion, ivFechaInicio, null, ivProducto_Id, ivTipoProducto_Id, ivTipoAnomalia_Id, '-1', ivTipoSolicitud_Id, ivCclienteCedula);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al MODIFICAR en la tabla Solicitud'||SQLCODE);
  END pModificarSolicitud;

  PROCEDURE pModificarTipoAnomalia(ivId IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
      PKTIPOANOMALIA.PMODIFICAR(ivId, ivNombre);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al MODIFICAR en la tabla Anomalia'||SQLCODE);
  END pModificarTipoAnomalia;

  PROCEDURE pModificarTipoProducto(ivId IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
      PKTIPOPRODUCTO.PMODIFICAR(ivId, ivNombre);
    EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al MODIFICAR en la tabla TipoProducto'||SQLCODE);
  END pModificarTipoProducto;

  PROCEDURE pModificarTipoSolicitud(ivId IN NUMBER, ivNombre IN VARCHAR2)
  IS
  BEGIN
      PKTIPOSOLICITUD.PMODIFICAR(ivId, ivNombre);
  EXCEPTION
  WHEN OTHERS THEN
  RAISE_APPLICATION_ERROR(-20000, 'Error al MODIFICAR en la tabla TipoSolicitud'||SQLCODE);
  END pModificarTipoSolicitud;
  
END pkModificarNivel2;