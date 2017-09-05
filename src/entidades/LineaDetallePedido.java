package entidades;

public class LineaDetallePedido {
	
	private Producto producto;
	private int cantidad;
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

}
