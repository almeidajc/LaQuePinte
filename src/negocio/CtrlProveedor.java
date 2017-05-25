package negocio;


import java.util.ArrayList;

import appExceptions.ApplicationException;
import data.DataCliente;
import data.DataEmpleado;
import data.DataProveedor;
import entidades.Cliente;
import entidades.Empleado;
import entidades.Proveedor;

public class CtrlProveedor {
	DataProveedor catalogo;
	
	public CtrlProveedor(){
		catalogo = new DataProveedor();
	}

	public void agregarProveedor(Proveedor p) throws ApplicationException {
		catalogo.agregarProveedor(p);
		}

	
	public ArrayList<Proveedor> listarProveedores(){
		return catalogo.listarProveedores();
	}

	
	public Proveedor getProveedorByCuit(int cuit) {
		// TODO Auto-generated method stub
		return catalogo.getProveedorByCuit(cuit);
	}

	


	public void borrarProveedor(int cuit) {
		// TODO Auto-generated method stub
		catalogo.borrarProveedor(cuit);
	}

	public void modificarProveedor(Proveedor p) throws ApplicationException {
		// TODO Auto-generated method stub
		catalogo.modificarProveedor(p);
	}
}
