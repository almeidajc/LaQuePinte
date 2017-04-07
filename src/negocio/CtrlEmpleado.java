package negocio;

import appExceptions.ApplicationException;
import data.DataEmpleado;

import entidades.Empleado;

public class CtrlEmpleado {
	
	DataEmpleado catalogo;
	
	public CtrlEmpleado(){
		catalogo = new DataEmpleado();
	}

	public Empleado getEmpleadoByUsuarioyContraseña(String usuario,	String contraseña) throws ApplicationException {
		
		return catalogo.getEmpleadoByUsuarioyContraseña(usuario, contraseña);
		
		
	}

}
