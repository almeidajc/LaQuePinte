package negocio;

import java.util.ArrayList;

import appExceptions.ApplicationException;
import data.DataProducto;
import entidades.Producto;

public class CtrlProducto {
	
	DataProducto cat;
	
	public CtrlProducto(){
		cat=new DataProducto();
	}

	public void agregarProducto(Producto p) throws ApplicationException {
		cat.agregarProducto(p);
		
	}
	
	public ArrayList<Producto> listarProductos(){    
		return cat.listarProductos();
	}

	public void borrarProducto(int codprod) throws ApplicationException {
		cat.borrarProducto(codprod);
		
	}
	
	/* public Producto getById(int id){
		cat.getById(id);
	}*/

}
