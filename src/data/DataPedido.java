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
import entidades.LineaDetallePedido;;


public class DataPedido {
	
	public ArrayList<Pedido> listarPedidos() {
		ResultSet rs = null;
		ResultSet rs2 = null;
		Statement stmt = null;
		ArrayList<Pedido> pedidos = new ArrayList<Pedido>();

		try {
			stmt = FactoryConexion.getInstancia().getConn().createStatement();

			rs = stmt.executeQuery("select pedidos.id_pedido, pedidos.fecha_entrega, pedidos.total "
							+ " from pedidos");

			while (rs.next()) {
				Pedido p = new Pedido();
								
				p.setId_pedido(rs.getInt("id_pedido"));
				p.setFecha_entrega(rs.getDate("fecha_entrega"));
				p.setTotal(rs.getDouble("total"));			
				
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
	
	

}
