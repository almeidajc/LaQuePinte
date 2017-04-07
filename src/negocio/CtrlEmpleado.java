package negocio;

import java.util.ArrayList;

import appExceptions.ApplicationException;
import data.DataEmpleado;
import entidades.Empleado;
import entidades.Producto;

public class CtrlEmpleado {
	
	DataEmpleado catalogo;
	
	public CtrlEmpleado(){
		catalogo = new DataEmpleado();
	}

	public Empleado getEmpleadoByUsuarioyContraseña(String usuario,	String contraseña) throws ApplicationException {
		
		return catalogo.getEmpleadoByUsuarioyContraseña(usuario, contraseña);
		
		
	}
	public ArrayList<Empleado> listarEmpleados(){
		return catalogo.listarEmpleados();
	}

	public void borrarEmpleado(int idemp) {
		// TODO Auto-generated method stub
		catalogo.borrarEmpleado(idemp);
		
	}
}
