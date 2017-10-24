package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import appExceptions.ApplicationException;
import entidades.Cliente;
import entidades.Empleado;
import entidades.Pedido;
import entidades.LineaDetallePedido;


public class DataPedido {
	
	DataEmpleado dataempleado = new DataEmpleado();
	
	public ArrayList<Pedido> listarPedidos() {
		ResultSet rs = null;
		ResultSet rs2 = null;
		Statement stmt = null;
		ArrayList<Pedido> pedidos = new ArrayList<Pedido>();

		try {
			stmt = FactoryConexion.getInstancia().getConn().createStatement();

			rs = stmt.executeQuery("select pedidos.id_pedido, pedidos.fecha_entrega, pedidos.total, pedidos.direccion_envio, pedidos.nombre, pedidos.apellido, pedidos.coordenadas "
							+ " from pedidos");

			while (rs.next()) {
				Pedido p = new Pedido();
								
				p.setId_pedido(rs.getInt("id_pedido"));
				p.setFecha_entrega(rs.getDate("fecha_entrega"));
				p.setTotal(rs.getDouble("total"));	

				
				p.setDireccion_envio(rs.getString("direccion_envio"));
				p.setNombre(rs.getString("nombre"));
				p.setApellido(rs.getString("apellido"));

				p.setCoordenadas(rs.getString("coordenadas"));
				pedidos.add(p);

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

		return pedidos;
	}

	public ArrayList<LineaDetallePedido> getLineaDetallePedido(int id) {
		ArrayList<LineaDetallePedido> Lineas = new ArrayList<LineaDetallePedido>();
		ResultSet rs = null;		
		PreparedStatement stmt = null;
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"select pedidos.id_pedido, pedidos.fecha_entrega, pedidos.total, linea_pedido_cliente.nombre_producto, linea_pedido_cliente.cantidad, linea_pedido_cliente.precio_unitario,linea_pedido_cliente.subtotal from pedidos inner join `linea_pedido_cliente` on pedidos.`id_pedido`=`linea_pedido_cliente`.id_pedido where pedidos.id_pedido=?"
				);
				
				stmt.setInt(1, id);
				rs = stmt.executeQuery();
				while (rs !=null && rs.next()) {
				LineaDetallePedido L = new LineaDetallePedido();
				L.setCantidad(rs.getInt("cantidad"));
				L.setNombre_producto(rs.getString("nombre_producto"));
				L.setSubtotal(rs.getFloat("subtotal"));
				L.setPrecioUnitario(rs.getFloat("precio_unitario"));					
				Lineas.add(L);
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
			
		return Lineas;
	}

	public void registrarPedido(Pedido pedido) throws ApplicationException {

		PreparedStatement stmtPedido = null;

		PreparedStatement stmtLineas = null;
		PreparedStatement stmtStock = null;
		DataProducto dprod = new DataProducto();
		ResultSet rs = null;
		try {
			stmtPedido = FactoryConexion.getInstancia().getConn().prepareStatement(
					"insert into pedidos(fecha_emision, id_estado, dni) values (current_date(),?,?)",PreparedStatement.RETURN_GENERATED_KEYS
				   );
			stmtPedido.setInt(2, 1);
			stmtPedido.setInt(3, pedido.getCliente().getDni());
			stmtPedido.execute();

			rs=stmtPedido.getGeneratedKeys();
			
			if(rs!=null && rs.next()){
				pedido.setId_pedido(rs.getInt(1));				
			}
			for (LineaDetallePedido lp : pedido.getLineasDetallePedido()) {
				dprod.descontarStock(stmtStock, lp.getCantidad(), lp.getProducto().getId_producto());
				this.insertLinea(stmtLineas, pedido.getId_pedido(), lp.getProducto().getId_producto(), lp.getCantidad());
			}			
			FactoryConexion.getInstancia().getConn().commit();
			
		} catch (SQLException e) {
			try {
				FactoryConexion.getInstancia().getConn().rollback();
			} catch (SQLException e1) {
				throw new ApplicationException("Error lectura base de datos", e);
			}
			throw new ApplicationException("Error al registrar nuevo pedido en la base de datos", e);
		}
		finally {
			try {
				if(stmtPedido!=null) stmtPedido.close();
				if(stmtLineas!=null) stmtLineas.close();
				if(rs!=null) rs.close();
				FactoryConexion.getInstancia().getConn().setAutoCommit(true);
			} catch (SQLException e) {
				throw new ApplicationException("Error al cerrar conexiones con la base de datos", e);
			}

		}
	}
	
	private void insertLinea(PreparedStatement stmtLineas, int nroPedido, int codigo, int cantidad)
			throws SQLException, ApplicationException {
		stmtLineas = FactoryConexion.getInstancia().getConn().prepareStatement(
				"Insert into linea_pedido_cliente (id_pedido,id_producto,id_linea,cantidad) values (?,?,?,?)");
			stmtLineas.setInt(1, nroPedido);
			stmtLineas.setInt(2, codigo);
			stmtLineas.setInt(3, cantidad);
			stmtLineas.setInt(4, 99);
			stmtLineas.execute();
	}

	public void registrarEnvioPedido(int id_pedido) throws ApplicationException {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		PreparedStatement stmt=null;
		
		
		try {
			
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
					"update pedidos set id_estado=?, fecha_efectiva=current_date() where id_pedido=?"
					);
			stmt.setInt(1, 2);
			
			stmt.setInt(2, id_pedido);
			
		
			stmt.execute();
			
		} catch (SQLException d) {
			try {
				FactoryConexion.getInstancia().getConn().rollback();
			} catch (SQLException d1) {
				throw new ApplicationException("Error al recuperar el pedido en la base de datos", d1);
			}
			throw new ApplicationException("Error al modificar el pedido en la base de datos", d);
		} finally {
			try {
			if(stmt!=null) stmt.close();
			
					
			if(rs!=null) rs.close();
			FactoryConexion.getInstancia().getConn().close();
			} catch (SQLException d) {
				throw new ApplicationException("Error al cerrar conexiones con la base de datos", d);
			
}}}



	
public ArrayList<Pedido> listarPedidosConfirmados() {
	ResultSet rs=null;
	
	PreparedStatement stmt=null;
	
	ArrayList<Pedido> pedidos = new ArrayList<Pedido>();

	try {

		stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select pedidos.id_pedido, pedidos.fecha_entrega, pedidos.id_estado ,pedidos.total, pedidos.direccion_envio, pedidos.nombre, pedidos.apellido, pedidos.id_empleado,pedidos.coordenadas "
						+ " from pedidos where id_estado = ? and fecha_entrega <= current_date()");

		stmt.setInt(1, 1);
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			Pedido p = new Pedido();
			Empleado e = new Empleado();
			int idempleado = rs.getInt("id_empleado");
			e.setId_empleado(idempleado);
			//e=dataempleado.getEmpleadoById(idempleado);
							
			p.setId_pedido(rs.getInt("id_pedido"));
			p.setFecha_entrega(rs.getDate("fecha_entrega"));
			p.setTotal(rs.getDouble("total"));	
			p.setId_estado(rs.getInt("id_estado"));
			p.setDireccion_envio(rs.getString("direccion_envio"));
			p.setNombre(rs.getString("nombre"));
			p.setApellido(rs.getString("apellido"));
			p.setEmpleado(e);
			p.setCoordenadas(rs.getString("coordenadas"));
			pedidos.add(p);

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

	return pedidos;
}

public ArrayList<Pedido> listarPedidosOrdenados() {
	ResultSet rs=null;
	
	PreparedStatement stmt=null;
	
	ArrayList<Pedido> pedidos = new ArrayList<Pedido>();

	try {

		stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select pedidos.id_pedido, pedidos.fecha_entrega"
						+ " from pedidos where id_estado = ? and fecha_entrega >= current_date()"
						+ "order by fecha_entrega");

		stmt.setInt(1, 1);
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			Pedido p = new Pedido();
			
							
			p.setId_pedido(rs.getInt("id_pedido"));
			p.setFecha_entrega(rs.getDate("fecha_entrega"));
			
			pedidos.add(p);

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

	return pedidos;
}



public ArrayList<Pedido> listarPedidosRealizados() {
ResultSet rs=null;
	
	PreparedStatement stmt=null;
	
	ArrayList<Pedido> pedidos = new ArrayList<Pedido>();

	try {
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select pedidos.id_pedido, pedidos.fecha_entrega, pedidos.id_estado ,pedidos.total, pedidos.direccion_envio, pedidos.nombre, pedidos.apellido, pedidos.id_empleado, pedidos.fecha_efectiva "
						+ " from pedidos where id_estado = ? and fecha_efectiva = current_date()");
		stmt.setInt(1, 2);
		rs = stmt.executeQuery();
		
		while (rs.next()) {
			Pedido p = new Pedido();
			Empleado e = new Empleado();
			int idempleado = rs.getInt("id_empleado");
			e.setId_empleado(idempleado);
			//e=dataempleado.getEmpleadoById(idempleado);
							
			p.setId_pedido(rs.getInt("id_pedido"));
			p.setFecha_entrega(rs.getDate("fecha_entrega"));
			p.setTotal(rs.getDouble("total"));	
			p.setFecha_efectiva(rs.getDate("fecha_efectiva"));
			p.setId_estado(rs.getInt("id_estado"));
			p.setDireccion_envio(rs.getString("direccion_envio"));
			p.setNombre(rs.getString("nombre"));
			p.setApellido(rs.getString("apellido"));
			
			p.setEmpleado(e);

			pedidos.add(p);

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

	return pedidos;
}

public void asignarPedido(int idped, int idcam) throws ApplicationException {
	// TODO Auto-generated method stub
	
	ResultSet rs=null;
	PreparedStatement stmt=null;
	
	
	try {
		
		
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement(
				"update pedidos set id_empleado=? where id_pedido=?");
		stmt.setInt(1, idcam);
		
		stmt.setInt(2, idped);
		
	
		stmt.execute();
		
	} catch (SQLException d) {
		try {
			FactoryConexion.getInstancia().getConn().rollback();
		} catch (SQLException d1) {
			throw new ApplicationException("Error al recuperar el pedido en la base de datos", d1);
		}
		throw new ApplicationException("Error al asignar el camionero en la base de datos", d);
	} finally {
		try {
		if(stmt!=null) stmt.close();
		
				
		if(rs!=null) rs.close();
		FactoryConexion.getInstancia().getConn().close();
		} catch (SQLException d) {
			throw new ApplicationException("Error al cerrar conexiones con la base de datos", d);
		
}}}

}

