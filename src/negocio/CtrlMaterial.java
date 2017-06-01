package negocio;

import java.util.ArrayList;

import data.DataMaterial;
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
	

}
