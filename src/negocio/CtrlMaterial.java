package negocio;

import java.util.ArrayList;

import appExceptions.ApplicationException;
import data.DataMaterial;
import entidades.Cliente;
import entidades.Material;
import entidades.Producto;

public class CtrlMaterial {
	
	DataMaterial catalogo;
	
	public CtrlMaterial(){
		catalogo = new DataMaterial();
	}
	
	public ArrayList<Material> listarMateriales(){
		return catalogo.listarMateriales();
	}

	public void agregarMaterial(Material m) throws ApplicationException {
		// TODO Auto-generated method stub
		catalogo.agregarMaterial(m);
	}
	
	public Material getMaterialById(int id) {
		// TODO Auto-generated method stub
		return catalogo.getMaterialById(id);
	}

	public void modificarMaterial(Material m) throws ApplicationException {
		// TODO Auto-generated method stub
		catalogo.modificarMaterial(m);
	}

}
