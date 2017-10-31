package data;

import java.sql.*;
import java.util.ArrayList;

import appExceptions.ApplicationException;
import entidades.Producto;


public class DataProducto {

	public void agregarProducto(Producto p)throws ApplicationException {
		
		ResultSet rs=null;
		PreparedStatement stmtProd =null;
		Statement stmtId = null;
		PreparedStatement stmtPrecio = null;
		int maxID;
		
		try {
			   stmtId = FactoryConexion.getInstancia().getConn().createStatement();
			   
			     rs = stmtId.executeQuery(
					  "select max(id_producto)id_p from productos"
					);
			     if (rs.next()) {
			    	   maxID = rs.getInt(1);
			    	   maxID++;
			    	
			
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
					+"values (?,current_date(),?)");

			stmtPrecio.setInt(1, maxID);						
			stmtPrecio.setFloat(2, p.getPrecio());
			stmtPrecio.execute();
			     }
			
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

	public Producto getById(int id) {
		
		ResultSet rsProd=null;
		
		PreparedStatement stmtProd=null;
		
		Producto p = new Producto();
		
		
		try {
			stmtProd = 	FactoryConexion.getInstancia().getConn().prepareStatement(
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
		    		     		+ " on precio_producto_venta.id_producto=val_act.id_producto and precio_producto_venta.fecha=val_act.ult_fec "
		    		     		+ "where productos.id_producto = ?"
					);
			stmtProd.setInt(1, id);
			rsProd = stmtProd.executeQuery();
			if(rsProd !=null && rsProd.next()){
				
				 p.setId_producto(rsProd.getInt("id_producto"));
		            p.setNombre_producto(rsProd.getString("nombre_producto"));
		            p.setCantidad_stock(rsProd.getInt("cantidad_stock"));
		            p.setCantidad_min_stock(rsProd.getInt("cantidad_minima"));
		            p.setCantidad_max_stock(rsProd.getInt("cantidad_maxima"));
		            p.setPrecio(rsProd.getFloat("precio"));
		            p.setNombre_material(rsProd.getString("nombre"));
	        		   
	        	      }
	      
	    }catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	    } finally
		{
			try {
				if(rsProd!=null)rsProd.close();
				if(stmtProd!=null) stmtProd.close();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			FactoryConexion.getInstancia().releaseConn();
		}
		
		return p;
		
	}

	public boolean verificarProducto(Producto p) {
		
		return false;
	}

	public ArrayList<Producto> getByDescripcion(String descripcion, int desde,int hasta) throws ApplicationException {
		ArrayList<Producto> productos = new ArrayList<Producto>();
		Producto prod;
		ResultSet rs= null;
		PreparedStatement stmt = null;
		try{
				 
			stmt= FactoryConexion.getInstancia().getConn().prepareStatement(
					"select productos.id_producto, productos.nombre_producto, precio_producto_venta.precio, productos.cantidad_stock"
					+ " from productos"
					+ " inner join precio_producto_venta "
					+ " on precio_producto_venta.id_producto=productos.id_producto"
					+ " inner join (select precio_producto_venta.id_producto, max(precio_producto_venta.fecha) 'fecha_desde'"
					+ "	from precio_producto_venta"
					+ "	where precio_producto_venta.fecha <= current_date()"
					+ "	group by precio_producto_venta.id_producto)val_prod "
					+ " on precio_producto_venta.id_producto=val_prod.id_producto and precio_producto_venta.fecha=val_prod.fecha_desde "
					+ " where productos.nombre_producto like ?"
					+ " group by productos.id_producto"
					+ " order by productos.nombre_producto"
					+ " limit ?,?");
			stmt.setString(1, "%"+descripcion+"%");
			stmt.setInt(2, desde);
			stmt.setInt(3, hasta);
			rs=stmt.executeQuery();
			while(rs.next()){
				prod = new Producto();
				prod.setId_producto(rs.getInt("id_producto"));
				prod.setNombre_producto(rs.getString("nombre_producto"));
				prod.setPrecio(rs.getFloat("precio"));
				prod.setCantidad_stock(rs.getInt("cantidad_stock"));
				productos.add(prod);
				
			}
			
		} catch (SQLException e){
			e.printStackTrace();
			throw new ApplicationException("Error al obtener la lista de productos desde la base de datos", null);			
			
		} finally{
			try {
				if(stmt!=null) stmt.close();
				if(rs!=null) rs.close();
				FactoryConexion.getInstancia().getConn().close();
			} catch (SQLException e) {
				throw new ApplicationException("Error al cerrar conexiones con la base de datos", e);
			}
		}
		return productos;
	}
	
	
	public int getStock(int id) throws ApplicationException {
		int stock=0;
		ResultSet rs= null;
		PreparedStatement stmt = null;
		try{
			stock = this.getStock(stmt, rs, id);
			
		} catch (SQLException e){
			throw new ApplicationException("Error al obtener el stock del producto desde la base de datos", null);			
			
		} finally{
			try {
				if(stmt!=null) stmt.close();
				if(rs!=null) rs.close();
				FactoryConexion.getInstancia().getConn().close();
			} catch (SQLException e) {
				throw new ApplicationException("Error al cerrar conexiones con la base de datos", e);
			}
		}
		return stock;	
	}
	
	protected int getStock(PreparedStatement stmt, ResultSet rs, int id) throws SQLException, ApplicationException {
		int stock=0;
		stmt= FactoryConexion.getInstancia().getConn().prepareStatement("select cantidad_stock from productos where id_producto=?");
		stmt.setInt(1, id);
		rs=stmt.executeQuery();
		if(rs.next()){
			stock=rs.getInt("cantidad_stock");
		}
		return stock;
	}
	
	protected void descontarStock(PreparedStatement stmt, int cantidad, int codProducto) throws SQLException, ApplicationException {
		stmt= FactoryConexion.getInstancia().getConn().prepareStatement(""
				+ "update productos set cantidad_stock=cantidad_stock-? where id_producto=?");
		stmt.setInt(1, cantidad);
		stmt.setInt(2, codProducto);
		stmt.execute();
	}

	public void modificarProducto(Producto p) throws ApplicationException {
		// TODO Auto-generated method stub
		

		ResultSet rs=null;
		PreparedStatement stmtPrecio = null;
		PreparedStatement stmt=null;
		
		
		try {
			
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"update productos set nombre_producto=?,cantidad_stock=?, cantidad_minima=?, cantidad_maxima=? where id_producto=?"
					);
			stmt.setString(1, p.getNombre_producto());			
			stmt.setInt(2, p.getCantidad_stock());
			stmt.setInt(3, p.getCantidad_min_stock());
			stmt.setInt(4, p.getCantidad_max_stock());
			stmt.setInt(5, p.getId_producto());
		
			stmt.execute();
			
			
			stmtPrecio = FactoryConexion.getInstancia().getConn().prepareStatement(
					"Insert into precio_producto_venta (id_producto, fecha, precio) values (?,current_date(),?)");
			stmtPrecio.setInt(1, p.getId_producto());						
							
			stmtPrecio.setFloat(2, p.getPrecio());
			stmtPrecio.execute();
			
		} catch (SQLException d) {
			try {
				FactoryConexion.getInstancia().getConn().rollback();
			} catch (SQLException e1) {
				throw new ApplicationException("Error al recuperar producto en la base de datos", d);
			}
			throw new ApplicationException("Error al modificar producto en la base de datos", d);
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