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
		Statement stm = Conexion.getConexion().createStatement();
		stm.executeUpdate(leerSQL(""));	
		stm.close();
		Conexion.cerrarConexion();
	}
	
	public String leerSQL(String direccion) {
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

}
