package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

	public static Connection conexion;

	public static void conectar(String username, String password) throws Exception {
		try {
			conexion = DriverManager.getConnection("jdbc:oracle:thin:@200.3.193.24:1522:ESTUD",username,password);
		
		} catch (SQLException e) {
			if(e.getMessage().contains("usuario/contraseña"))
				throw new Exception("Log in incorrecto");
		}
	}
	
	public static void cerrarConexion() throws SQLException {
		conexion.close();
	}

}
