package negocio;

import java.util.ArrayList;

import appExceptions.ApplicationException;
import data.DataPedido;
import data.DataProducto;
import entidades.LineaDetallePedido;
import entidades.Pedido;
import entidades.Producto;

public class CtrlPedido {
	
	DataPedido cat;
	
	public CtrlPedido(){
		cat=new DataPedido();
	}
	
	public ArrayList<Pedido> listarPedidos(){
		return cat.listarPedidos();
	}
	
	public ArrayList<LineaDetallePedido> getLineaDetallePedido (int id){
		return cat.getLineaDetallePedido(id);
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
