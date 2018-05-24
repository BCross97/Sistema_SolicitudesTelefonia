package businessDelegate;


import java.sql.Statement;
import conexion.Conexion;

public class BusinessDelegate implements IBusinessDelegate{

	@Override
	public void crearBaseDeDatos(String usuario, String contrasenia) throws Exception {
		Conexion.conectar(usuario, contrasenia);
		Statement stm = Conexion.getConexion().createStatement();
		//TODO ejecutar archivos sql
		Conexion.cerrarConexion();
	}



}
