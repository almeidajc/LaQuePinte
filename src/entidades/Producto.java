package entidades;

import java.util.Date;

public class Producto {
	
	private int id_producto;
	private String nombre_producto;	
	private int cantidad_stock;
	private int cantidad_min_stock;	
	private int cantidad_max_stock;
	private float precio;
	private String nombre_material;
	private int id_material;
	
	
	
	public int getId_material() {
		return id_material;
		
	}
	public void setId_material(int id_material) {
		this.id_material = id_material;
	}
	public String getNombre_material() {
		return nombre_material;
	}
	public void setNombre_material(String nombre_material) {
		this.nombre_material = nombre_material;
	}
	public int getId_producto() {
		return id_producto;
	}
	public void setId_producto(int id_producto) {
		this.id_producto = id_producto;
	}
	public String getNombre_producto() {
		return nombre_producto;
	}
	public void setNombre_producto(String nombre_producto) {
		this.nombre_producto = nombre_producto;
	}
	public int getCantidad_stock() {
		return cantidad_stock;
	}
	public void setCantidad_stock(int cantidad_stock) {
		this.cantidad_stock = cantidad_stock;
	}
	public int getCantidad_min_stock() {
		return cantidad_min_stock;
	}
	public void setCantidad_min_stock(int cantidad_min_stock) {
		this.cantidad_min_stock = cantidad_min_stock;
	}
	public int getCantidad_max_stock() {
		return cantidad_max_stock;
	}
	public void setCantidad_max_stock(int cantidad_max_stock) {
		this.cantidad_max_stock = cantidad_max_stock;
	}
	public float getPrecio() {
		return precio;
	}
	public void setPrecio(float precio) {
		this.precio = precio;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	private Date fecha;
	
	

}
