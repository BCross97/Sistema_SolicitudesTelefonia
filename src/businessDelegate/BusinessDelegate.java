package businessDelegate;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import conexion.Conexion;

public class BusinessDelegate implements IBusinessDelegate {

	@Override
	public void crearBaseDeDatos(String usuario, String contrasenia) throws Exception {
		Conexion.conectar(usuario, contrasenia);
		Statement stm = Conexion.getConexion().createStatement();
		Conexion.cerrarConexion();
	}
	
	public boolean executeQuery(String query){
        Statement sentencias = null;
        try{ 
            sentencias = Conexion.getConexion().createStatement(); 
            sentencias.executeUpdate(query); 
            sentencias.close(); 
        }catch(Exception e){ 
            return false; 
        } 
        return true;
    }

	public String leerSQL(java.io.File documento) {
		String sCadena = "";
		String retorno = "";

		if (!documento.exists()) {
			return null;
		}

		try {
			BufferedReader bf = new BufferedReader(new FileReader(documento));
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
