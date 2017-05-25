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

	public void borrarProveedor(int cuit) {
		PreparedStatement stmtP=null;
		
		
		
		try { 
			stmtP=FactoryConexion.getInstancia().getConn().prepareStatement(
					  "delete from proveedores where cuit=?"
					);
			stmtP.setInt(1, cuit);
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

	public void modificarProveedor(Proveedor p) throws ApplicationException {

		ResultSet rs=null;
		PreparedStatement stmt=null;
		
		
		try {
			
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"update proveedores set razon_social=?, mail=?, direccion=?,telefono=? where cuit=?"
					);
			stmt.setString(1, p.getRazon_social());
			stmt.setString(2, p.getEmail());
			stmt.setString(3, p.getDireccion());
			stmt.setInt(4, p.getTel());
			stmt.setInt(5, p.getCuit());
			
		
			stmt.execute();
			
			
			
		} catch (SQLException d) {
			try {
				FactoryConexion.getInstancia().getConn().rollback();
			} catch (SQLException d1) {
				throw new ApplicationException("Error al recuperar proveedor en la base de datos", d1);
			}
			throw new ApplicationException("Error al modificar el proveedor en la base de datos", d);
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

	public Proveedor getProveedorByCuit(int cuit) {
		ResultSet rs=null;
		
		PreparedStatement stmt=null;
		
		Proveedor p = new Proveedor();
		
		
		try {
			stmt = 	FactoryConexion.getInstancia().getConn().prepareStatement(
					"select razon_social, mail, direccion, telefono from proveedores where cuit = ?"
					);
			stmt.setInt(1, cuit);
			rs = stmt.executeQuery();
			if(rs !=null && rs.next()){
	         
				p.setRazon_social(rs.getString("razon_social"));
				p.setEmail(rs.getString("mail"));
				p.setDireccion(rs.getString("direccion"));
				p.setTel(rs.getInt("telefono"));
	            
	            
	           
	         }
	      
	    }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	   
			FactoryConexion.getInstancia().releaseConn();
		}
		
		return p;
	}
}

