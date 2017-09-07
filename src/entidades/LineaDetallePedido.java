package entidades;

public class LineaDetallePedido {
	
	private Producto producto;
	private int cantidad;
	private String nombre_producto;
	private float precioUnitario;
	private float subtotal;
	public String getNombre_producto() {
		return nombre_producto;
	}
	public void setNombre_producto(String nombre_producto) {
		this.nombre_producto = nombre_producto;
	}
	public float getPrecioUnitario() {
		return precioUnitario;
	}
	public void setPrecioUnitario(float precioUnitario) {
		this.precioUnitario = precioUnitario;
	}
	public float getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}
	public Producto getProducto() {
		return producto;
	}
	public void setProducto(Producto producto) {
		this.producto = producto;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	
	public LineaDetallePedido(Producto producto, int cantidad){
		this.setCantidad(cantidad);
		this.setProducto(producto);
	}
	
	public LineaDetallePedido(){
		
	}

}
