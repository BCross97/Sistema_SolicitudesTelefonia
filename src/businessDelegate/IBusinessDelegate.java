package businessDelegate;

public interface IBusinessDelegate {

	/*
	 * METODO PARA CREAR TABLAS, POBLAR TABLAS Y CREAR PAQUETES
	 */
	public void crearBaseDeDatos(String usuario, String contrasenia) throws Exception;
}
