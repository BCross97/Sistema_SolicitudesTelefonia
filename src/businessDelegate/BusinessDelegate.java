package businessDelegate;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import conexion.Conexion;

public class BusinessDelegate implements IBusinessDelegate {

	@Override
	public void crearBaseDeDatos(String usuario, String contrasenia) throws Exception {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("¡Oracle JDBC Driver no encontrado!");
			e.printStackTrace();
			return;
		}
		Conexion.conectar(usuario, contrasenia);
		Statement stm = Conexion.conexion.createStatement();
		// Crear tablas
		ejecutarScript(leerSQL("./ArchivosSQL/CrearTablasYDatos/Crear_Tablas.sql"), stm);
		ejecutarScript(leerSQL("./ArchivosSQL/CrearTablasYDatos/Insertar_datos.sql"), stm);
		// TODO cargar paquetes
		stm.close();
		Conexion.cerrarConexion();
	}

	private void ejecutarScript(String sql, Statement stm) throws SQLException {
		String[] esecuele = sql.split(";");
		for (int i = 0; i < esecuele.length; i++) {
			try {
				stm.executeUpdate(esecuele[i]);
			} catch (Exception e) {

			}
		}
	}

	private String leerSQL(String direccion) {
		String sCadena = "";
		String retorno = "";
		File file = new File(direccion);
		if (!file.exists()) {
			return null;
		}
		try {
			BufferedReader bf = new BufferedReader(new FileReader(file));
			while ((sCadena = bf.readLine()) != null) {
				if (!sCadena.equals("") && sCadena.charAt(0) != '-')
					retorno += sCadena;
			}
			bf.close();
		} catch (FileNotFoundException fnfe) {
			return null;
		} catch (IOException ioe) {
			return null;
		}
		return retorno;
	}
	

}
