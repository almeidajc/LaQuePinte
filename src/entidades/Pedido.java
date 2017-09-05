package entidades;

import Linea_pedido;

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
	private Date fecha_efectiva;
	private double total;
	private FormaPago formapago;
	private double recarga_actual;
	private double costo_envio;
	private String direccion_envio;
	private Cliente cliente;
	private ArrayList<Producto> productos;
	private Zona zona;
	private Empleado empleado;
	private int id_estado;
	private ArrayList<LineaDetallePedido> lineasDetallePedido;
	
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
	public void setFecha_entrega(Date fecha_entrega) {
		this.fecha_entrega = fecha_entrega;
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
	public Zona getZona() {
		return zona;
	}
	public void setZona(Zona zona) {
		this.zona = zona;
	}
	public Empleado getEmpleado() {
		return empleado;
	}
	public void setEmpleado(Empleado empleado) {
		this.empleado = empleado;
	}
	 
	

}
