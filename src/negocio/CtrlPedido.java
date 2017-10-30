package negocio;

import java.util.ArrayList;

import appExceptions.ApplicationException;
import data.DataPedido;
import data.DataProducto;
import entidades.Cliente;
import entidades.CostosEnvio;
import entidades.Empleado;
import entidades.LineaDetallePedido;
import entidades.Pedido;
import entidades.Producto;

public class CtrlPedido {
	
	DataPedido cat;
	DataProducto dprod;
	
	public CtrlPedido(){
		cat=new DataPedido();
	}
	
	public ArrayList<Pedido> listarPedidos(){
		return cat.listarPedidos();
	}
	
	public ArrayList<Pedido> listarPedidosConfirmados(){
		return cat.listarPedidosConfirmados();
	}
	
	
	
	public ArrayList<Pedido> listarPedidosRealizados(){
		return cat.listarPedidosRealizados();
	}
	
	public ArrayList<Pedido> listarPedidosOrdenados(){
		return cat.listarPedidosOrdenados();
	}
	
	public ArrayList<LineaDetallePedido> getLineaDetallePedido (int id){
		return cat.getLineaDetallePedido(id);
	}

	public void confirmarPedido(Pedido pedido) throws ApplicationException {
		//String mensaje ="";
		//valida que exista stock de todos los productos seleccionados
		//for (LineaDetallePedido lp : pedido.getLineasDetallePedido()) {
		//	int stock = dprod.getStock(lp.getProducto().getId_producto());
		//	if(stock<lp.getCantidad()){
		//		mensaje+="<br> Se ha agotado el stock del producto "+lp.getProducto().getId_producto()+" "+lp.getProducto().getNombre_producto();
		//		mensaje+=" Eliminar la linea de pedido correspondiente para poder confirmar el pedido";
		//	}
		//}
		//if(mensaje.equals("")){
		cat.registrarPedido(pedido);
		//} else throw new ApplicationException(mensaje, null);
	}


	public void registrarEnvioPedido(int id_pedido) throws ApplicationException {
		// TODO Auto-generated method stub
		cat.registrarEnvioPedido(id_pedido);
	}

	public void asignarPedido(int idped, int idcam) throws ApplicationException {
		// TODO Auto-generated method stub
		cat.asignarPedido(idped,idcam);
		
		
	}

	public double calcularCostoEnvio(int distancia, String EsZonaPeligrosa) {
		CostosEnvio ce = new CostosEnvio();
		ce = cat.calcularCostoEnvio();
		double costo = 0;
		costo = (distancia/1000)*ce.getCosto_km();
		if(String.valueOf(EsZonaPeligrosa).equals("true")){
			costo+=ce.getRecargo_zona();
		}
		return costo;
	}

	public void confirmarPedidoMostrador(Pedido pedido) throws ApplicationException {
		cat.registrarPedidoMostrador(pedido);		
	}


	/* public void agregarProducto(Producto p) throws ApplicationException {
		cat.agregarProducto(p);
		
	}
	
	public ArrayList<Producto> listarProductos(){    
		return cat.listarProductos();
	}

	public void borrarProducto(int codprod) throws ApplicationException {
		cat.borrarProducto(codprod);
		
	}
	
	public Producto getById(int id){
		return cat.getById(id);
	} */
	

}
