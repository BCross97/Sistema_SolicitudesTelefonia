package businessDelegate;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Statement;
import conexion.Conexion;

public class BusinessDelegate implements IBusinessDelegate {

	@Override
	public void crearBaseDeDatos(String usuario, String contrasenia) throws Exception {
		Conexion.conectar(usuario, contrasenia);
		Statement stm = Conexion.conexion.createStatement();
		// Crear tablas
		stm.executeUpdate(leerSQL("/SolicitudesTelefonia/ArchivosSQL/CrearTablasYDatos/Crear_Tablas.sql"));
		stm.close();
		Conexion.cerrarConexion();
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

	public static void main(String[] args) {
		System.out.println("-------- Prueba de Registro de Oracle JDBC ------");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("¡Oracle JDBC Driver no encontrado!");
			e.printStackTrace();
			return;
		}
		IBusinessDelegate del = new BusinessDelegate();
		try {
			del.crearBaseDeDatos("P09551_1_18", "P09551_1_18");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
