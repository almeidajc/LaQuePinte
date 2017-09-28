package negocio;



import appExceptions.ApplicationException;
import data.DataCostosEnvio;
import entidades.CostosEnvio;


public class CtrlCostosEnvio {
	
	DataCostosEnvio catalogo;
	
	public CtrlCostosEnvio(){
		catalogo = new DataCostosEnvio();
	}
	
	public CostosEnvio listarCostosEnvio() throws ApplicationException{
		return catalogo.listarCostosEnvio();
	}

	public void modificarCostosEnvio(CostosEnvio c) throws ApplicationException {
		// TODO Auto-generated method stub
		catalogo.modificarCostosEnvio(c);
	}
	

}
