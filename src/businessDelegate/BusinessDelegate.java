package businessDelegate;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
		// Cargar paquetes
		ejecutarPaquetesNivel1(stm);
		stm.close();
		Conexion.cerrarConexion();
	}

	private void ejecutarPaquetesNivel1(Statement stm) {
		try {
			ejecutarPaquetes(stm, leerPaquetes("./ArchivosSQL/Paquetes Nivel 1/pkCliente.sql"));
			ejecutarPaquetes(stm, leerPaquetes("./ArchivosSQL/Paquetes Nivel 1/pkFuncionario.sql"));
			ejecutarPaquetes(stm, leerPaquetes("./ArchivosSQL/Paquetes Nivel 1/pkParametros.sql"));
			ejecutarPaquetes(stm, leerPaquetes("./ArchivosSQL/Paquetes Nivel 1/pkProducto.sql"));
			ejecutarPaquetes(stm, leerPaquetes("./ArchivosSQL/Paquetes Nivel 1/pkSolicitud.sql"));
			ejecutarPaquetes(stm, leerPaquetes("./ArchivosSQL/Paquetes Nivel 1/pkTipoAnomalia.sql"));
			ejecutarPaquetes(stm, leerPaquetes("./ArchivosSQL/Paquetes Nivel 1/pkTipoProducto.sql"));
			ejecutarPaquetes(stm, leerPaquetes("./ArchivosSQL/Paquetes Nivel 1/pkTipoSolicitud.sql"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void ejecutarPaquetes(Statement stm, String paquete) throws SQLException {
		String[] paquetes = paquete.split("/");
		stm.executeUpdate(paquetes[0]);
		stm.executeUpdate(paquetes[1]);
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

	private String leerPaquetes(String direccion) {
		String sCadena = "";
		String retorno = "";
		File file = new File(direccion);
		if (!file.exists()) {
			return null;
		}
		try {
			BufferedReader bf = new BufferedReader(new FileReader(file));
			while ((sCadena = bf.readLine()) != null) {
				retorno += sCadena + "\n";
			}
			bf.close();
		} catch (FileNotFoundException fnfe) {
			return null;
		} catch (IOException ioe) {
			return null;
		}
		return retorno;
	}

	// public static void main(String[] args) {
	// IBusinessDelegate del = new BusinessDelegate();
	// try {
	// del.crearBaseDeDatos("p09551_1_15", "1234");
	// // del.crearBaseDeDatos("p09551_1_18", "p09551_1_18");
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }

	@Override
	public String[] tiposProductos() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String[] obtenerTiposAnomalias() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void solicitudCreacionProducto(String cedulaCliente, String tipoProducto, String observacion)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public ArrayList<String[]> obtenerProductos(String cedulaCliente) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void solicitudCancelacion(String cedulaCliente, String idProducto, String causaCancelacion)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void reportarDanho(String cedulaCliente, String idProducto, String tipoAnomalia, String descripcionProblema)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void realizarReclamo(String cedulaCliente, String idProducto, String descripcionProblema) throws Exception {
		// TODO Auto-generated method stub

	}
}
