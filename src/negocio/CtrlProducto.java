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
	
	public ArrayList<Producto> getByDescripcion(String descripcion,int desde,int hasta) throws ApplicationException {
		return cat.getByDescripcion(descripcion,desde,hasta);
	}
	
	public ArrayList<Producto> listarProductos(){    
		return cat.listarProductos();
	}

	public void borrarProducto(int codprod) throws ApplicationException {
		cat.borrarProducto(codprod);
		
	}
	
	public Producto getById(int id){
		return cat.getById(id);
	}
	
//	public DisminuirStock(int )
	

//}

	public boolean verificarProducto(Producto p) {
		return cat.verificarProducto(p);
	}

	public int getStock(int id) throws ApplicationException {
		return cat.getStock(id);		
	}
	
}
