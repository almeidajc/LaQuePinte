package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import appExceptions.ApplicationException;
import entidades.Cliente;
import entidades.Empleado;

public class DataCliente {

	public void agregarCliente(Cliente cli) throws ApplicationException {
		// TODO Auto-generated method stub

		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {

			stmt = FactoryConexion
					.getInstancia()
					.getConn()
					.prepareStatement(
							"insert into clientes (dni,nombre,apellido,tel,direccion,email,id_zona) values (?,?,?,?,?,?,?)");
			stmt.setInt(1, cli.getDni());
			stmt.setString(2, cli.getNombre());
			stmt.setString(3, cli.getApellido());
			stmt.setInt(4, cli.getTel());
			stmt.setString(5, cli.getDireccion());
			stmt.setString(6, cli.getEmail());
			stmt.setInt(7, 1);
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

	public ArrayList<Cliente> listarClientes() {
		ResultSet rs = null;
		Statement stmt = null;
		ArrayList<Cliente> clientes = new ArrayList<Cliente>();

		try {
			stmt = FactoryConexion.getInstancia().getConn().createStatement();

			rs = stmt
					.executeQuery("select clientes.dni, clientes.nombre, clientes.apellido, clientes.tel, clientes.direccion, clientes.email,clientes.id_zona "
							+ " from clientes");

			while (rs.next()) {
				Cliente c = new Cliente();
				c.setDni(rs.getInt("dni"));
				c.setNombre(rs.getString("nombre"));
				c.setApellido(rs.getString("apellido"));
				c.setTel(rs.getInt("tel"));
				c.setDireccion(rs.getString("direccion"));
				c.setEmail(rs.getString("email"));
				c.setId_zona(rs.getInt("id_zona"));

				clientes.add(c);

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

		return clientes;
	}

	public void borrarCliente(int dnicli) {
		PreparedStatement stmtP=null;
		
		
		
		try { 
			stmtP=FactoryConexion.getInstancia().getConn().prepareStatement(
					  "delete from clientes where dni=?"
					);
			stmtP.setInt(1, dnicli);
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
