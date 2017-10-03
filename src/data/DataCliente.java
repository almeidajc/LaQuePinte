package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import appExceptions.ApplicationException;
import entidades.Cliente;
import entidades.Empleado;
import entidades.Producto;

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
				if(rs.getString("email")==null){
					c.setEmail("-");
				}
				else
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

	public Cliente getClienteByDni(int dnicli) {

		ResultSet rs=null;
		
		PreparedStatement stmt=null;
		
		Cliente c = new Cliente();
		
		
		try {
			stmt = 	FactoryConexion.getInstancia().getConn().prepareStatement(
					"select dni, nombre, apellido, tel,direccion, email from clientes where dni = ?"
					);
			stmt.setInt(1, dnicli);
			rs = stmt.executeQuery();
			if(rs !=null && rs.next()){
				c.setDni(rs.getInt("dni"));
				c.setNombre(rs.getString("nombre"));
				c.setApellido(rs.getString("apellido"));
	            c.setTel(rs.getInt("tel"));
	            c.setDireccion(rs.getString("direccion"));
	            c.setEmail(rs.getString("email"));
	           
	         }
	      
	    }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	   
			FactoryConexion.getInstancia().releaseConn();
		}
		
		return c;
		
	}

	public void modificarCliente(Cliente c) throws ApplicationException {
		// TODO Auto-generated method stub

		ResultSet rs=null;
		PreparedStatement stmt=null;
		
		
		try {
			
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"update clientes set nombre=?, apellido=?, tel=?, direccion=?, email=? where dni=?"
					);
			stmt.setString(1, c.getNombre());
			stmt.setString(2, c.getApellido());
			stmt.setInt(3, c.getTel());
			stmt.setString(4, c.getDireccion());
			stmt.setString(5, c.getEmail());
			stmt.setInt(6, c.getDni());
			
		
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

	public ArrayList<Cliente> getClienteByNombreYApellido(String nombreYapellido,int desde, int hasta) throws ApplicationException {
		ArrayList<Cliente> clientes = new ArrayList<Cliente>();
		Cliente C;
		ResultSet rs= null;
		PreparedStatement stmt = null;
		try{				 
			stmt= FactoryConexion.getInstancia().getConn().prepareStatement(
					"select clientes.dni,clientes.nombre,clientes.apellido,clientes.direccion"
					+ " from clientes"
					+ " where clientes.nombre like ?"
					+ " limit ?,?");
			stmt.setString(1, "%"+nombreYapellido+"%");
			stmt.setInt(2, desde);
			stmt.setInt(3, hasta);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				C = new Cliente();
				C.setDni(rs.getInt("dni"));
				C.setNombre(rs.getString("nombre"));
				C.setApellido(rs.getString("apellido"));
				C.setDireccion(rs.getString("direccion"));
				clientes.add(C);
			}
			
		} catch (SQLException e){
			e.printStackTrace();
			throw new ApplicationException("Error al obtener la lista de clientes desde la base de datos", null);			
			
		} finally{
			try {
				if(stmt!=null) stmt.close();
				if(rs!=null) rs.close();
				FactoryConexion.getInstancia().getConn().close();
			} catch (SQLException e) {
				throw new ApplicationException("Error al cerrar conexiones con la base de datos", e);
			}
		}
		return clientes;
	}

	public ArrayList<Cliente> getClienteByApellido(String apellidoCliente,int desde, int hasta)throws ApplicationException {
		ArrayList<Cliente> clientes = new ArrayList<Cliente>();
		Cliente C;
		ResultSet rs= null;
		PreparedStatement stmt = null;
		try{				 
			stmt= FactoryConexion.getInstancia().getConn().prepareStatement(
					"select clientes.dni,clientes.nombre,clientes.apellido,clientes.direccion"
					+ " from clientes"
					+ " where clientes.nombre like ?"
					+ " limit ?,?");
			stmt.setString(1, "%"+apellidoCliente+"%");
			stmt.setInt(2, desde);
			stmt.setInt(3, hasta);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				C = new Cliente();
				C.setDni(rs.getInt("dni"));
				C.setNombre(rs.getString("nombre"));
				C.setApellido(rs.getString("apellido"));
				C.setDireccion(rs.getString("direccion"));
				clientes.add(C);
			}
			
		} catch (SQLException e){
			e.printStackTrace();
			throw new ApplicationException("Error al obtener la lista de clientes desde la base de datos", null);			
			
		} finally{
			try {
				if(stmt!=null) stmt.close();
				if(rs!=null) rs.close();
				FactoryConexion.getInstancia().getConn().close();
			} catch (SQLException e) {
				throw new ApplicationException("Error al cerrar conexiones con la base de datos", e);
			}
		}
		return clientes;
	}
}
