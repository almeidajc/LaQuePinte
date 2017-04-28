package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import appExceptions.ApplicationException;
import entidades.Camionero;
import entidades.Cliente;
import entidades.Despachante;
import entidades.Empleado;
import entidades.EncargadoAdministracion;
import entidades.Producto;
import entidades.Vendedor;


public class DataEmpleado {

	
	public Empleado getEmpleadoByUsuarioyContraseña(String usuario,	String contraseña) throws ApplicationException {
		
		ResultSet rs=null;
		PreparedStatement stmt=null;
		Empleado e = null;		
		try {
			stmt = 	FactoryConexion.getInstancia().getConn().prepareStatement(
					"select id_empleado, usuario, contraseña, nombre, apellido, tel, tipo, patente from empleados where usuario=? and contraseña=?"
					);
			stmt.setString(1, usuario);
			stmt.setString(2, contraseña);
			rs = stmt.executeQuery();
			if(rs !=null && rs.next()){
				
				String tipo = rs.getString("tipo");
				
				switch (tipo) {
				case "CA":

					Camionero C = new Camionero ();
					C.setId_empleado(rs.getInt("id_empleado"));
					C.setNombre(rs.getString("nombre"));
				 	C.setApellido(rs.getString("apellido"));	
					C.setUsuario(rs.getString("usuario"));
					C.setContraseña(rs.getString("contraseña"));
					C.setTipo(rs.getString("tipo"));
					C.setPatente(rs.getString("patente"));
					
					e=C;
					
					break;
					
				case "VE":
					
					Vendedor V = new Vendedor();
					V.setId_empleado(rs.getInt("id_empleado"));
					V.setNombre(rs.getString("nombre"));
				 	V.setApellido(rs.getString("apellido"));	
					V.setUsuario(rs.getString("usuario"));
					V.setContraseña(rs.getString("contraseña"));
					V.setTipo(rs.getString("tipo"));
					
					e=V; 
					break;
				
				case "EA":
					
					EncargadoAdministracion EA = new EncargadoAdministracion();
					EA.setId_empleado(rs.getInt("id_empleado"));
				    EA.setNombre(rs.getString("nombre"));
				 	EA.setApellido(rs.getString("apellido"));	
					EA.setUsuario(rs.getString("usuario"));
					EA.setContraseña(rs.getString("contraseña"));
					EA.setTipo(rs.getString("tipo"));
					
					e=EA;
					break;
					
				case "DE":
					
					Despachante DE = new Despachante(); 
					DE.setId_empleado(rs.getInt("id_empleado"));
				    DE.setNombre(rs.getString("nombre"));
				 	DE.setApellido(rs.getString("apellido"));	
					DE.setUsuario(rs.getString("usuario"));
					DE.setContraseña(rs.getString("contraseña"));
					DE.setTipo(rs.getString("tipo"));
					
					e=DE;					
					break;
					
				default:
					
					e=null;
					
					break;
				}
				
				
				}
		} catch (SQLException e1) {
			throw new ApplicationException("Error al recuperar usuario de la base de datos", e1.getCause());
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
			
		
		return e;
	}

	public ArrayList<Empleado> listarEmpleados() {
		// TODO Auto-generated method stub

		ResultSet rs=null;	
		Statement stmt=null;	
		ArrayList<Empleado> empleados = new ArrayList<Empleado>();
		
			
	try {
	     stmt = FactoryConexion.getInstancia().getConn().createStatement();
	   
	     rs = stmt.executeQuery(
	    		 "select empleados.id_empleado, empleados.usuario, empleados.nombre, empleados.apellido, empleados.tel, empleados.tipo, empleados.patente "
	     		+ " from empleados");
	    		
	        while (rs.next())
	         {
	            Empleado e = new Empleado();
	            e.setId_empleado(rs.getInt("id_empleado"));
	            e.setUsuario(rs.getString("usuario"));
	            e.setNombre(rs.getString("nombre"));
	            e.setApellido(rs.getString("apellido"));
	            e.setTel(rs.getInt("tel"));
	            e.setTipo(rs.getString("tipo"));
	            e.setPatente(rs.getString("patente"));
	            
	 
	        	empleados.add(e);
	        	
	            
	         }
	      
	    }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	    } finally
		{
			try {
				if(rs!=null)rs.close();
				if(stmt!=null) stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			FactoryConexion.getInstancia().releaseConn();
		}
		
		return empleados;
	}

	public void borrarEmpleado(int idemp) {
		// TODO Auto-generated method stub
		
		PreparedStatement stmtPP=null;
		PreparedStatement stmtP=null;
	
	try { // borro primero de la tabla precio_producto_venta
		stmtPP=FactoryConexion.getInstancia().getConn().prepareStatement(
				  "delete from precio_producto_venta where Id_Producto=?"
				);
		stmtPP.setInt(1, idemp);
		stmtPP.execute();
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally{
		
		try {
			if(stmtPP != null) stmtPP.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	try { // luego borro el registro de la tabla productos
		stmtP=FactoryConexion.getInstancia().getConn().prepareStatement(
				  "delete from empleados where id_empleado=?"
				);
		stmtP.setInt(1, idemp);
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

	/*public void agregarEmpleado(Empleado emp) throws ApplicationException {
		PreparedStatement stmt=null;		
		ResultSet rs=null;
	    
	    	
		try {
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"insert into empleados (nombre, apellido, usuario, contraseña, tel, tipo) values (?,?,?,?,?,?,?)" );
			stmt.setString(1, emp.getNombre());
			stmt.setString(2, emp.getApellido());
			stmt.setString(3, emp.getUsuario());
			stmt.setString(4, emp.getContraseña());
			stmt.setInt(5, emp.getTel());
			stmt.setString(6, emp.getTipo());
			stmt.execute();

			
		} catch (SQLException e) {
			throw new ApplicationException("Error agregar un cliente en la base de datos", e);
			
		}
		finally{
			
			try {
				if(rs!=null ) rs.close();
				if(stmt != null) stmt.close();
				FactoryConexion.getInstancia().releaseConn();
			} catch (SQLException e) {
				throw new ApplicationException("Error al cerrar conexiones con la base de datos", e);
			}
			
		}
		
	}
	}
*/

	/*public Producto getById(int id) {
		
		ResultSet rsProd=null;
		ResultSet rsPrecio=null;
		ResultSet rsMat=null;
		PreparedStatement stmtProd=null;
		PreparedStatement stmtPrecio=null;
		PreparedStatement stmtMat=null;
		Producto p = new Producto();
		
		
		try {
			stmtProd = 	FactoryConexion.getInstancia().getConn().prepareStatement(
					"select cod_servicio, nombre_servicio, descripcion_servicio from servicios where cod_servicio = ?"
					);
			stmt.setInt(1, codServicio);
			rs = stmt.executeQuery();
			if(rs !=null && rs.next()){
	         
	           
	           
	            s.setCod_servicio(rs.getInt("cod_servicio"));
	            s.setNombre(rs.getString("nombre_servicio"));
	            s.setDescripcion(rs.getString("descripcion_servicio"));
	           
	           
	        		   
	        	 stmtPrecio= FactoryConexion.getInstancia().getConn().prepareStatement("select precio from precios_servicios where cod_servicio = ?");
	   			 stmtPrecio.setInt(1, rs.getInt("cod_servicio"));
	   			 rsPrecio=stmtPrecio.executeQuery();
	   			 if(rsPrecio.next()){

	   				
	   				 s.setPrecio(rsPrecio.getInt("precio"));
	   				 
	   				 
	   			 	}
	            	
	           
	        	
	        	
	            
	         }
	      
	    }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	    } finally
		{
			try {
				if(rs!=null)rs.close();
				if(stmt!=null) stmt.close();
				
				if(rsPrecio!=null)rsPrecio.close();
				if(stmtPrecio!=null) stmtPrecio.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			FactoryConexion.getInstancia().releaseConn();
		}
		
		return s;
		
	}

	*/
	

}

