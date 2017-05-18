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

	public Empleado getEmpleadoByUsuarioyContrase�a(String usuario,	String contrase�a) throws ApplicationException {
		
		return catalogo.getEmpleadoByUsuarioyContrase�a(usuario, contrase�a);
		
		
	}
	
public Empleado getEmpleadoById(int idEmp) throws ApplicationException {
		
		return catalogo.getEmpleadoById(idEmp);
		
		
	}
	public ArrayList<Empleado> listarEmpleados(){
		return catalogo.listarEmpleados();
	}
	
	
	public void borrarEmpleado(int idemp) {
		// TODO Auto-generated method stub
		catalogo.borrarEmpleado(idemp);
		
	}



	public void agregarEmpleado(Empleado e) throws ApplicationException {
		
		catalogo.agregarEmpleado(e);
	}

	public void modificarEmpleado(Empleado e) throws ApplicationException {
		// TODO Auto-generated method stub
		catalogo.modificarEmpleado(e);
	}

/*	public void agregarEmpleado(Empleado emp) throws ApplicationException {
		// TODO Auto-generated method stub
		catalogo.agregarEmpleado(emp);
	}*/
}
