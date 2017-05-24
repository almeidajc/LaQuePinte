package data;

import java.sql.*;
import java.util.ArrayList;

import appExceptions.ApplicationException;
import entidades.Producto;


public class DataProducto {

	public void agregarProducto(Producto p)throws ApplicationException {
		
		ResultSet rs=null;
		PreparedStatement stmtProd =null;
		PreparedStatement stmtPrecio = null;
		
		try {
			stmtProd = FactoryConexion.getInstancia().getConn().prepareStatement(
					"insert into productos (id_producto, nombre_producto, cantidad_stock, cantidad_minima, cantidad_maxima, id_material) values (?,?,?,?,?,?)");
			stmtProd.setInt(1, p.getId_producto());
			stmtProd.setString(2, p.getNombre_producto());
			stmtProd.setInt(3, p.getCantidad_stock());
			stmtProd.setInt(4, p.getCantidad_min_stock());
			stmtProd.setInt(5, p.getCantidad_max_stock());
			stmtProd.setInt(6, p.getId_material());
			
			stmtProd.execute();
			
			//LUEGO DE AGREGAR EL PRODUCTO A LA TABLA PRODUCTO, AGREGO LOS DATOS CORRESPONDIENTES A LA TABLA PRECIOS
			
			
			stmtPrecio = FactoryConexion.getInstancia().getConn().prepareStatement(
					"Insert into precio_producto_venta (id_producto, fecha, precio)"
					+"values (?,?,?)");
			stmtPrecio.setInt(1, p.getId_producto());						
			stmtPrecio.setDate(2, new java.sql.Date(p.getFecha().getTime()));				
			stmtPrecio.setFloat(3, p.getPrecio());
			stmtPrecio.execute();
			
			
		} catch (SQLException e) {
			try {
				FactoryConexion.getInstancia().getConn().rollback();
			} catch (SQLException e1) {
				throw new ApplicationException("Error al recuperar datos en la base de datos", e);
			}
			throw new ApplicationException("Error al registrar nuevo producto en la base de datos", e);
		} finally {
			try {
			if(stmtProd!=null) stmtProd.close();
			if(stmtPrecio!=null) stmtPrecio.close();
			if(rs!=null) rs.close();
			FactoryConexion.getInstancia().getConn().close();
			} catch (SQLException e) {
				throw new ApplicationException("Error al cerrar conexiones con la base de datos", e);
			}
			
		}
	
		
	}

	public ArrayList<Producto> listarProductos() {
	
	ResultSet rs=null;	
	Statement stmt=null;	
	ArrayList<Producto> productos = new ArrayList<Producto>();
	
		
try {
     stmt = FactoryConexion.getInstancia().getConn().createStatement();
   
     rs = stmt.executeQuery(
    		 "select productos.id_producto, productos.nombre_producto, productos.cantidad_stock, productos.cantidad_minima, productos.cantidad_maxima, precio_producto_venta.precio, materiales.nombre"
    		     		+ " from productos"
    		     		+ " inner join materiales"
    		     		+ " on productos.id_material=materiales.id_material"
    		     		+ " inner join precio_producto_venta"
    		     		+ " on productos.id_producto=precio_producto_venta.id_producto"
    		     		+ " inner join (select precio_producto_venta.id_producto, max(precio_producto_venta.fecha) 'ult_fec' "
    		     		+ " 			from precio_producto_venta"
    		     		+ " 			where precio_producto_venta.fecha <= current_date()"
    		     		+ " 			group by precio_producto_venta.id_producto)val_act "
    		     		+ " on precio_producto_venta.id_producto=val_act.id_producto and precio_producto_venta.fecha=val_act.ult_fec ");
    		        
    		        while (rs.next())
    		         {
    		            Producto p = new Producto();
    		            p.setId_producto(rs.getInt("id_producto"));
    		            p.setNombre_producto(rs.getString("nombre_producto"));
    		            p.setCantidad_stock(rs.getInt("cantidad_stock"));
    		            p.setCantidad_min_stock(rs.getInt("cantidad_minima"));
    		            p.setCantidad_max_stock(rs.getInt("cantidad_maxima"));
    		            p.setPrecio(rs.getFloat("precio"));
    		            p.setNombre_material(rs.getString("nombre"));
    		 
    		        	productos.add(p);
    		        	
    		            
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
	
	return productos;
}

	public void borrarProducto(int codprod) throws ApplicationException {
		
		PreparedStatement stmtPP=null;
		PreparedStatement stmtP=null;
	
	try { // borro primero de la tabla precio_producto_venta
		stmtPP=FactoryConexion.getInstancia().getConn().prepareStatement(
				  "delete from precio_producto_venta where id_producto=?"
				);
		stmtPP.setInt(1, codprod);
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
				  "delete from productos where id_producto=?"
				);
		stmtP.setInt(1, codprod);
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
