package negocio;

import java.util.ArrayList;

import appExceptions.ApplicationException;
import data.DataPedido;
import data.DataProducto;
import entidades.Producto;

public class CtrlPedido {
	
	DataPedido cat;
	
	public CtrlPedido(){
		cat=new DataPedido();
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
