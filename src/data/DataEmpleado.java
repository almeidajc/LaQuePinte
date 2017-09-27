package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import appExceptions.ApplicationException;
import entidades.Administrador;
import entidades.Camionero;
import entidades.Cliente;
import entidades.Despachante;
import entidades.Empleado;
import entidades.EncargadoAdministracion;
import entidades.Producto;
import entidades.Vendedor;


public class DataEmpleado {

	
	public Empleado getEmpleadoByUsuarioycontraseña(String usuario,	String contraseña) throws ApplicationException {
		
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
					
				case "ADM":
					
					Administrador Adm = new Administrador();
					Adm.setId_empleado(rs.getInt("id_empleado"));
					Adm.setNombre(rs.getString("nombre"));
				 	Adm.setApellido(rs.getString("apellido"));	
					Adm.setUsuario(rs.getString("usuario"));
					Adm.setContraseña(rs.getString("contraseña"));
					Adm.setTipo(rs.getString("tipo"));
					
					e=Adm; 
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
	    		 "select empleados.id_empleado, empleados.usuario, empleados.nombre, empleados.apellido, empleados.tel, empleados.tipo, empleados.patente, empleados.email, empleados.id_turno"
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
	            if(rs.getString("patente")==null){
	            	e.setPatente("-");
	            }
	            else
	            e.setPatente(rs.getString("patente"));
	            if(rs.getString("email")==null){
	            	e.setEmail("-");
	            }
	            else
	            e.setEmail(rs.getString("email"));
	            e.setId_turno(rs.getInt("id_turno"));
	            
	 
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
		
		
		PreparedStatement stmtP=null;
	
	
	
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

	public void agregarEmpleado(Empleado emp) throws ApplicationException {
		// TODO Auto-generated method stub
	
		PreparedStatement stmt=null;		
		ResultSet rs=null;
	    
	    	
		try {
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"insert into empleados (usuario, contraseña, nombre, apellido,  tel, tipo, patente,email, id_turno) values (?,?,?,?,?,?,?,?,?)" );
			stmt.setString(1, emp.getUsuario());
			stmt.setString(2, emp.getContraseña());
			stmt.setString(3, emp.getNombre());
			stmt.setString(4, emp.getApellido());
			stmt.setInt(5, emp.getTel());
			stmt.setString(6, emp.getTipo());
			stmt.setString(7, emp.getPatente());
			stmt.setString(8, emp.getEmail());
			stmt.setInt(9, emp.getId_turno());
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

	public Empleado getEmpleadoById(int idEmp) {
	
		
		ResultSet rs=null;
		PreparedStatement stmt=null;
		Empleado e = new Empleado();
		
		
		try {
			stmt = 	FactoryConexion.getInstancia().getConn().prepareStatement(
					"select tel, email, contraseña from empleados where id_empleado = ?"
					);
			stmt.setInt(1, idEmp);
			rs = stmt.executeQuery();
			if(rs !=null && rs.next()){
	         
	           e.setId_empleado(idEmp);
	           
	            e.setTel(rs.getInt("tel"));
	            e.setEmail(rs.getString("email"));
	            e.setContraseña(rs.getString("contraseña"));
	          	        	
	            
	         }
	      
	    }catch (SQLException d) {
			// TODO Auto-generated catch block
			d.printStackTrace();
	    } finally
		{
			try {
				if(rs!=null)rs.close();
				if(stmt!=null) stmt.close();
				
				
			} catch (SQLException d) {
				// TODO Auto-generated catch block
				d.printStackTrace();
			}
			FactoryConexion.getInstancia().releaseConn();
		}
		
		return e;
		
	}

	public void modificarEmpleado(Empleado e) throws ApplicationException {
		// TODO Auto-generated method stub
		

		ResultSet rs=null;
		PreparedStatement stmt=null;
		
		
		try {
			
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"update empleados set contraseña=?, tel=?,email=? where id_empleado =?"
					);
			stmt.setString(1, e.getContraseña());
			stmt.setInt(2, e.getTel());
			stmt.setString(3, e.getEmail());
			stmt.setInt(4, e.getId_empleado());
			
		
			stmt.execute();
			
			
			
		} catch (SQLException d) {
			try {
				FactoryConexion.getInstancia().getConn().rollback();
			} catch (SQLException e1) {
				throw new ApplicationException("Error al recuperar habitacion en la base de datos", d);
			}
			throw new ApplicationException("Error al modificar habitacion en la base de datos", d);
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


