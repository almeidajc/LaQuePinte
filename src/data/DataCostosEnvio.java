package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




import appExceptions.ApplicationException;
import entidades.CostosEnvio;


public class DataCostosEnvio {

	
	public CostosEnvio listarCostosEnvio() throws ApplicationException {
		ResultSet rs=null;
		PreparedStatement stmt=null;
		CostosEnvio c = new CostosEnvio();		
		try {
			stmt = 	FactoryConexion.getInstancia().getConn().prepareStatement(
					"select costo_km, recargo_zona from costos_envio"
					);
			
			rs = stmt.executeQuery();
			if(rs !=null && rs.next()){
				
				
					c.setCosto_km(rs.getFloat("costo_km"));
					c.setRecargo_zona(rs.getFloat("recargo_zona"));
					
				
					
				
				}
		} catch (SQLException e1) {
			throw new ApplicationException("Error al recuperar costos de la base de datos", e1.getCause());
		}
		finally
		{
			try {
			
				if(rs!=null)rs.close();				
				if(stmt!=null) stmt.close();				
				FactoryConexion.getInstancia().getConn().setAutoCommit(true);	
			} catch (SQLException e1) {
				throw new ApplicationException("Error al liberar recursos de la base de datos", e1.getCause());
			}
				FactoryConexion.getInstancia().releaseConn();
				
		}
			
		
		return c;
	}

	public void modificarCostosEnvio(CostosEnvio c) throws ApplicationException {
		// TODO Auto-generated method stub

		ResultSet rs=null;
		PreparedStatement stmt=null;
		
		
		try {
						
			if(c.getRecargo_zona()== -1){
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"update costos_envio set costo_km=?"
					);
			stmt.setFloat(1, c.getCosto_km());}
			
			else{
				stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
						"update costos_envio set recargo_zona=?"
						);
				stmt.setFloat(1, c.getRecargo_zona());
			}
			
			
			
		
			stmt.execute();
			
			
			
		} catch (SQLException d) {
			try {
				FactoryConexion.getInstancia().getConn().rollback();
			} catch (SQLException d1) {
				throw new ApplicationException("Error al recuperar habitacion en la base de datos", d1);
			}
			throw new ApplicationException("Error al modificar el cliente en la base de datos", d);
		} finally {
			try {
			if(stmt!=null) stmt.close();
			
					
			if(rs!=null) rs.close();
			FactoryConexion.getInstancia().getConn().close();
			} catch (SQLException d) {
				throw new ApplicationException("Error al cerrar conexiones con la base de datos", d);
			}
			
		
	}

	}
}
