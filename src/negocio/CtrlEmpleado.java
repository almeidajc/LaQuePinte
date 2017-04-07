package negocio;

import appExceptions.ApplicationException;
import data.DataEmpleado;

import entidades.Empleado;

public class CtrlEmpleado {
	
	DataEmpleado catalogo;
	
	public CtrlEmpleado(){
		catalogo = new DataEmpleado();
	}

	public Empleado getEmpleadoByUsuarioyContrase�a(String usuario,	String contrase�a) throws ApplicationException {
		
		return catalogo.getEmpleadoByUsuarioyContrase�a(usuario, contrase�a);
		
		
	}

}
