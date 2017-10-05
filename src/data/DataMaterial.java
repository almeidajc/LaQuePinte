package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import appExceptions.ApplicationException;
import entidades.Cliente;
import entidades.Material;


public class DataMaterial {
	
	public DataMaterial(){
		
	}

	public ArrayList<Material> listarMateriales() {
		ResultSet rs = null;
		Statement stmt = null;
		ArrayList<Material> materiales = new ArrayList<Material>();

		try {
			stmt = FactoryConexion.getInstancia().getConn().createStatement();

			rs = stmt.executeQuery("select id_material, nombre, descripcion "
							+ " from materiales");

			while (rs.next()) {
				Material m = new Material();
				m.setId(rs.getInt("id_material"));
				m.setNombre(rs.getString("nombre"));
				m.setDescripcion(rs.getString("descripcion"));
				
				materiales.add(m);

				

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

		return materiales;
	}

	public void agregarMaterial(Material m) throws ApplicationException {
		// TODO Auto-generated method stub
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {

			stmt = FactoryConexion
					.getInstancia()
					.getConn()
					.prepareStatement(
							"insert into materiales (nombre,descripcion) values (?,?)");
			stmt.setString(1, m.getNombre());
			stmt.setString(2, m.getDescripcion());
			
			stmt.execute();

		} catch (SQLException e) {
			throw new ApplicationException(
					"Error agregar un material en la base de datos", e);

		} finally {

			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				FactoryConexion.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw new ApplicationException(
						"Error al cerrar conexiones con la base de datos", e);
			}
	}
	
	}

	public Material getMaterialById(int id) {
		ResultSet rs=null;
		
		PreparedStatement stmt=null;
		
		Material m = new Material();
		
		
		try {
			stmt = 	FactoryConexion.getInstancia().getConn().prepareStatement(
					"select nombre, descripcion from materiales where id_material = ?"
					);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs !=null && rs.next()){
				m.setNombre(rs.getString("nombre"));
				m.setDescripcion(rs.getString("descripcion"));
				m.setId(rs.getInt("id_material"));
				
	           
	         }
	      
	    }catch (SQLException e) {
	    	// TODO Auto-generated catch block
	    				e.printStackTrace();
	    		    } finally
	    			{
	    				try {
	    					if(rs!=null)rs.close();
	    					
	    					
	    				} catch (SQLException e) {
	    					// TODO Auto-generated catch block
	    					e.printStackTrace();
	    				}
	    				FactoryConexion.getInstancia().releaseConn();
	    			}
		return m;
		
	
	}

	public void modificarMaterial(Material m) throws ApplicationException {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		PreparedStatement stmt=null;
		
		
		try {
			
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"update materiales set nombre=?, descripcion=? where id_material=?");
			stmt.setString(1, m.getNombre());
			stmt.setString(2, m.getDescripcion());
			stmt.setInt(3, m.getId());
			
		
			stmt.execute();
			
			
			
		} catch (SQLException d) {
			try {
				FactoryConexion.getInstancia().getConn().rollback();
			} catch (SQLException d1) {
				throw new ApplicationException("Error al recuperar material en la base de datos", d1);
			}
			throw new ApplicationException("Error al modificar el material en la base de datos", d);
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
