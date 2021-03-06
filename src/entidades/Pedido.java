package entidades;



import java.util.ArrayList;
import java.util.Date;

public class Pedido {
	
	public Pedido(){
		this.setId_estado(1);    //1-pagado //2-reprogramado //3-en proceso de envio //4-entregado	
		//this.setFecha_emision(today());
	}
		
	
	private int id_pedido;
	private Date fecha_emision;
	private Date fecha_entrega;
	private int distancia;
	private Date fecha_efectiva;
	private String EsZonaPeligrosa;
	private double total;
	private FormaPago formapago;
	private double recarga_actual;
	private double costo_envio;
	private String direccion_envio;
	private Cliente cliente;
	private ArrayList<Producto> productos;
	private String coordenadas;
	private int id_zona;
	private Empleado empleado;
	private int id_estado;
	private String estado;
	private String nombre;
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}


	public String getEsZonaPeligrosa() {
		return EsZonaPeligrosa;
	}
	public void setEsZonaPeligrosa(String esZonaPeligrosa) {
		EsZonaPeligrosa = esZonaPeligrosa;
	}


	private String apellido;
	
	public String getEstado() {
		String descripcion;
		if (this.getId_estado()==1) {	descripcion="Confirmado";}
		else{descripcion="Entregado";
		}
		return descripcion;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	public int getDistancia() {
		return distancia;
	}
	public void setDistancia(int distancia) {
		this.distancia = distancia;
	}


	private ArrayList<LineaDetallePedido> lineasDetallePedido;
	private String juance;
	
	public String getJuance() {
		return juance;
	}
	public void setJuance(String juance) {
		this.juance = juance;
	}
	public ArrayList<LineaDetallePedido> getLineasDetallePedido() {
		return lineasDetallePedido;
	}
	public void setLineasDetallePedido(
			ArrayList<LineaDetallePedido> lineasDetallePedido) {
		this.lineasDetallePedido = lineasDetallePedido;
	}
	public int getId_estado() {
		return id_estado;
	}
	public void setId_estado(int id_estado) {
		this.id_estado = id_estado;
	}
	public int getId_pedido() {
		return id_pedido;
	}
	public void setId_pedido(int id_pedido) {
		this.id_pedido = id_pedido;
	}
	public Date getFecha_emision() {
		return fecha_emision;
	}
	public void setFecha_emision(Date fecha_emision) {
		this.fecha_emision = fecha_emision;
	}
	public Date getFecha_entrega() {
		return fecha_entrega;
	}
	public void setFecha_entrega(Date fecha_teorica) {
		this.fecha_entrega = fecha_teorica;
	}
	public Date getFecha_efectiva() {
		return fecha_efectiva;
	}
	public void setFecha_efectiva(Date fecha_efectiva) {
		this.fecha_efectiva = fecha_efectiva;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public FormaPago getFormapago() {
		return formapago;
	}
	public void setFormapago(FormaPago formapago) {
		this.formapago = formapago;
	}
	public double getRecarga_actual() {
		return recarga_actual;
	}
	public void setRecarga_actual(double recarga_actual) {
		this.recarga_actual = recarga_actual;
	}
	public double getCosto_envio() {
		return costo_envio;
	}
	public void setCosto_envio(double costo_envio) {
		this.costo_envio = costo_envio;
	}
	public String getDireccion_envio() {
		return direccion_envio;
	}
	public void setDireccion_envio(String direccion_envio) {
		this.direccion_envio = direccion_envio;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public ArrayList<Producto> getProductos() {
		return productos;
	}
	public void setProductos(ArrayList<Producto> productos) {
		this.productos = productos;
	}
	
	public Empleado getEmpleado() {
		return empleado;
	}
	public void setEmpleado(Empleado empleado) {
		this.empleado = empleado;
	}
	public String getCoordenadas() {
		return coordenadas;
	}
	public void setCoordenadas(String coordenadas) {
		this.coordenadas = coordenadas;
	}
	public int getId_zona() {
		return id_zona;
	}
	public void setId_zona(int id_zona) {
		this.id_zona = id_zona;
	}
	 
	

}
