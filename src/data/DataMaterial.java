package data;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
	

}
