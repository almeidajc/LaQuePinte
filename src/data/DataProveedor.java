package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import appExceptions.ApplicationException;
import entidades.Cliente;
import entidades.Proveedor;

public class DataProveedor {

	public void agregarProveedor(Proveedor pro) throws ApplicationException {
		// TODO Auto-generated method stub

		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {

			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
							"insert into proveedores (cuit,razon_social,mail,direccion,telefono) values (?,?,?,?,?)");
			stmt.setInt(1, pro.getCuit());
			stmt.setString(2, pro.getRazon_social());
			stmt.setString(3, pro.getEmail());
			stmt.setString(4, pro.getDireccion());
			stmt.setInt(5, pro.getTel());
			
			stmt.execute();

		} catch (SQLException e) {
			throw new ApplicationException(
					"Error agregar un cliente en la base de datos", e);

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

	public ArrayList<Proveedor> listarProveedores() {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		Statement stmt = null;
		ArrayList<Proveedor> proveedores = new ArrayList<Proveedor>();

		try {
			stmt = FactoryConexion.getInstancia().getConn().createStatement();

			rs = stmt.executeQuery("select cuit, razon_social, mail, direccion, telefono "
							+ " from proveedores");

			while (rs.next()) {
				Proveedor p = new Proveedor();
				p.setCuit(rs.getInt("cuit"));
				p.setRazon_social(rs.getString("razon_social"));
				p.setEmail(rs.getString("mail"));
				p.setDireccion(rs.getString("direccion"));
				p.setTel(rs.getInt("telefono"));
				

				proveedores.add(p);

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

		return proveedores;
	}

}
