package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import appExceptions.ApplicationException;
import entidades.Zona;


public class DataZona {

	public ArrayList<Zona> listarZona() {
		
		ResultSet rs = null;
		Statement stmt = null;
		ArrayList<Zona> zonas = new ArrayList<Zona>();

		try {
			stmt = FactoryConexion.getInstancia().getConn().createStatement();

			rs = stmt
					.executeQuery("select zona.id_zona, zona.descripcion, zona.coordenadas"
							+ " from zona");

			while (rs.next()) {
				Zona z = new Zona();
				z.setId_zona(rs.getInt("id_zona"));
				z.setDescripcion(rs.getString("descripcion"));
				z.setCoordenadas(rs.getString("coordenadas"));
				
				

				zonas.add(z);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			FactoryConexion.getInstancia().releaseConn();
		}

		return zonas;
	}

	public void borrarZona(int id_zona) {
		// TODO Auto-generated method stub
		PreparedStatement stmtP=null;
		
		
		
		try { 
			stmtP=FactoryConexion.getInstancia().getConn().prepareStatement(
					  "delete from zona where id_zona=?"
					);
			stmtP.setInt(1, id_zona);
			stmtP.execute();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			
			try {
				
				if(stmtP != null) stmtP.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			FactoryConexion.getInstancia().releaseConn();
		}
	
		
	}

	
}
