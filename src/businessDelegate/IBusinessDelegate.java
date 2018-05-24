package businessDelegate;

import java.util.ArrayList;

public interface IBusinessDelegate {

	/*
	 * METODO PARA CREAR TABLAS, POBLAR TABLAS Y CREAR PAQUETES
	 */
	public void crearBaseDeDatos(String usuario, String contrasenia) throws Exception;

	// Registro de solicitudes

	/**
	 * Este metodo se encarga de entregar los nombres de los tipos de producto
	 * aceptados (voz o datos), con el fin de desplegarlos en la interfaz y
	 * comunicarse con las demas capas
	 * 
	 * @return - Los tipos de producto
	 */
	public String[] tiposProductos();

	/**
	 * Este metodo se encarga de obtener del sistema los tipos de anomalia
	 * registrados y validos para reportar
	 * 
	 * @return - Un listado con los nombres de las anomalias registradas en el
	 *         sistema
	 */
	public String[] obtenerTiposAnomalias();

	/**
	 * Este metodo se encarga de abrir en el sistema una solicitud de creacion de
	 * producto
	 * 
	 * @param cedulaCliente
	 * @param tipoProducto
	 *            - voz o datos... en el mundo deben haber contantes con los valores
	 *            aceptados para siempre usar los mismos (ver tiposProductos():
	 *            String)
	 * @param observacion
	 *            -Es opcional, en caso tal de que el cliente desee agregar una
	 *            observacion
	 * @throws Exception
	 *             - En caso de que la cedula no este registrada, o que el tipo de
	 *             producto no sea uno de los validos
	 */
	public void solicitudCreacionProducto(String cedulaCliente, String tipoProducto, String observacion)
			throws Exception;

	/**
	 * Este metodo se encarga de entregar todos los productos vinculados a un
	 * cliente específico. Cada producto posee toda la información propia de este.
	 * 
	 * @param cedulaCliente
	 *            - Cedula del cliente al que se le despliegaran los productos
	 * @return - Retorna un ArrayList (uno por cada producto) de arreglos de string.
	 *         Cada arreglo de cadenas (cada producto especifico) posee una longitud
	 *         de 4: Id, FechaInicio, TipoProducto (uno valido, voz o datos),
	 *         cedulaCliente,
	 * 
	 * @throws Exception
	 *             - En caso tal de que la cedula no identifique a ningun cliente en
	 *             el sistema
	 */
	public ArrayList<String[]> obtenerProductos(String cedulaCliente) throws Exception;

	/**
	 * Este metodo se encarga de enviar al sistema una solicitud de cancelacion por
	 * parte del cliente.
	 * 
	 * @param cedulaCliente
	 *            - Se entiende...
	 * @param idProducto
	 *            - Id del producto que se desea cancelar
	 * @param causaCancelacion
	 *            - Texto del cliente donde explica las razones por las cuales desea
	 *            cancelar
	 * @throws Exception
	 *             - En caso tal de que la cedula o el id del producto sean
	 *             invalidos
	 */
	public void solicitudCancelacion(String cedulaCliente, String idProducto, String causaCancelacion) throws Exception;

	/**
	 * Este metodo se encarga de enviar al sistema un reporte de danho segun un
	 * listado de opciones.
	 * 
	 * @param cedulaCliente
	 *            - Cedula del cliente que desea reportar el danho
	 * @param idProducto
	 *            - Id del producto sobre el cual se encontro la falla
	 * @param tipoAnomalia
	 *            - Tipo de la anomalia segun un listado previamente definido
	 * @param descripcionProblema
	 *            - Descripcion del problema segun el cliente.
	 * @throws Exception
	 *             - En caso tal de que la cedula, el id del producto o el tipo de
	 *             anomalia sean invalidos se retorna una excepcion. Tambien si la
	 *             descripcion del problema esta vacia.
	 */
	public void reportarDanho(String cedulaCliente, String idProducto, String tipoAnomalia, String descripcionProblema)
			throws Exception;

	/**
	 * Este metodo se encarga de enviar al sistema un reporte de reclamo por parte
	 * del cliente.
	 * 
	 * @param cedulaCliente
	 *            - Cedula del cliente que desea reportar el reclamo
	 * @param idProducto
	 *            - Id del producto sobre el cual se encontro la incomformidad
	 * @param descripcionProblema
	 *            - Descripcion del reclamo segun el cliente.
	 * @throws Exception
	 *             - En caso tal de que la cedula o el id del producto sean
	 *             invalidos se retorna una excepcion. Tambien si la descripcion del
	 *             reclamo esta vacia.
	 */
	public void realizarReclamo(String cedulaCliente, String idProducto, String descripcionProblema) throws Exception;

	// Atencion de solicitudes.

	// Consultas

}