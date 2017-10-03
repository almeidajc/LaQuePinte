package negocio;


import java.util.ArrayList;

import appExceptions.ApplicationException;
import data.DataCliente;
import data.DataEmpleado;
import entidades.Cliente;
import entidades.Empleado;
import entidades.Producto;

public class CtrlCliente {
	DataCliente catalogo;
	
	public CtrlCliente(){
		catalogo = new DataCliente();
	}

	public void agregarCliente(Cliente c) throws ApplicationException {
		catalogo.agregarCliente(c);
		}

	
	public ArrayList<Cliente> listarClientes(){
		return catalogo.listarClientes();
	}

	public void borrarCliente(int dnicli) {
		// TODO Auto-generated method stub
		catalogo.borrarCliente(dnicli);
	}
	public Cliente getClienteByDni(int dnicli) {
		// TODO Auto-generated method stub
		return catalogo.getClienteByDni(dnicli);
	}

	public void modificarCliente(Cliente c) throws ApplicationException {
		// TODO Auto-generated method stub
		catalogo.modificarCliente(c);
	}

	public ArrayList<Cliente> getClienteByNombreYApellido(String nombreYapellido,int inicio, int cant_por_pagina) throws ApplicationException {
		return catalogo.getClienteByNombreYApellido(nombreYapellido,inicio,cant_por_pagina);
	}

	public ArrayList<Cliente> getClienteByApellido(String apellidoCliente,int inicio, int cant_por_pagina) throws ApplicationException {
		return catalogo.getClienteByApellido(apellidoCliente,inicio,cant_por_pagina);
	}

}
