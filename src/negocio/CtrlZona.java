package negocio;


import java.util.ArrayList;

import appExceptions.ApplicationException;
import data.DataCliente;
import data.DataEmpleado;
import data.DataZona;
import entidades.Cliente;
import entidades.Empleado;
import entidades.Zona;

public class CtrlZona {
	DataZona catalogo;
	
	public CtrlZona(){
		catalogo = new DataZona();
	}

	public void agregarZona(Zona z) throws ApplicationException {
		
		catalogo.agregarZona(z);
	}
	
	public ArrayList<Zona> listarZona(){
		return catalogo.listarZona();
	}


	public void borrarZona(int id_zona) {
		// TODO Auto-generated method stub
		catalogo.borrarZona(id_zona);
	}

	

}
