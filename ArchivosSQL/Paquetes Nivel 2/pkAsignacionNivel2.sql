create or replace PACKAGE pkAsignacionNivel2 AS
  PROCEDURE pAsignar(ivIdSolicitud IN VARCHAR2);
END pkAsignacionNivel2;
/
create or replace PACKAGE BODY pkAsignacionNivel2 AS
  PROCEDURE pAsignar(ivIdSolicitud IN VARCHAR2)
  IS
  BEGIN
      UPDATE SOLICITUD
      SET FUNCIONARIO_CEDULA = (SELECT CEDULA FROM 
                                    (SELECT CEDULA
                                    FROM FUNCIONARIO
                                    ORDER BY dbms_random.value)
                                WHERE rownum = 1 and CEDULA != -1)
      WHERE ID = ivIdSolicitud; 
  END pAsignar;
END pkAsignacionNivel2;