package ui.pedido;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appExceptions.ApplicationException;
import entidades.Cliente;
import entidades.LineaDetallePedido;
import entidades.Pedido;
import entidades.Empleado;
import entidades.Producto;
import negocio.CtrlPedido;
import negocio.CtrlProducto;

/**
 * Servlet implementation class PedidoActual
 */
@WebServlet("/PedidoActual")
public class PedidoActual extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PedidoActual() {
        super();
        // 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Pedido pedido = (Pedido) request.getSession().getAttribute("pedido");
		Empleado empleado = (Empleado) request.getSession().getAttribute("userSession");
		ArrayList<LineaDetallePedido> items;
		Producto producto;
		String mensaje="";
		CtrlPedido ctrlPed = new CtrlPedido();
		CtrlProducto ctrlProd = new CtrlProducto();
		try{
			if(empleado!=null&&empleado.getId_empleado()!=0){
				if(pedido==null){
					pedido= new Pedido();
					pedido.setEmpleado(empleado);
					pedido.setFecha_emision(new Date());
					items= new ArrayList<LineaDetallePedido>();
				} else {
					items = pedido.getLineasDetallePedido();
				}
				if(request.getParameter("txtCod").equals("")){
					mensaje+= "El id de producto no puede estar vacio\n";
				}
				if(request.getParameter("txtCantidad").equals("")){
					mensaje+= "La cantidad a ingresar no puede estar vacia\n";
				}
				if(!mensaje.equals("")){
					throw new ApplicationException(mensaje, null);
				}else{
					int codigo=Integer.valueOf(request.getParameter("txtCod"));
					producto=ctrlProd.getById(codigo);
					for (LineaDetallePedido lineaDetallePedido : items) {						
						if(lineaDetallePedido.getProducto().getId_producto()==producto.getId_producto()){
							throw new ApplicationException("El producto ingresado ya existe en el pedido. Eliminelo y vuelva a intentarlo", null);
						}
					}
					int cantidad=Integer.valueOf(request.getParameter("txtCantidad"));
					int stock = ctrlProd.getStock(producto.getId_producto());
					if(stock>cantidad){
						items.add(new LineaDetallePedido(producto,cantidad));
						pedido.setLineasDetallePedido(items);
						request.getSession().setAttribute("pedido", pedido);
						String origen = request.getParameter("origen");
						if(String.valueOf(origen).equals("mostrador")){
							response.sendRedirect("crearpedido.jsp");
						}else{
							response.sendRedirect("nuevoPedidoVE.jsp");
						}
					} else{
						throw new ApplicationException("No hay stock suficiente para esa cantidad", null);
					}
				}
			}
			else {
				throw new ApplicationException("Debe iniciar sesión", null);
			}
		}  catch (NumberFormatException e) {
			String msj="";
			if(!esEntero(request.getParameter("txtCod"))) msj+="El código de producto debe ser un número entero. \n";
			if(!esEntero(request.getParameter("txtCantidad"))) msj+="La cantidad debe ser un número entero. \n";
			request.setAttribute("mensaje", msj);
			request.getRequestDispatcher("nuevoPedidoVE.jsp").forward(request, response);
		} catch (NullPointerException e) {
			request.setAttribute("mensaje", "No se encontro producto con el código ingresado");
			request.getRequestDispatcher("nuevoPedidoVE.jsp").forward(request, response);
		} catch (ApplicationException e){
			request.setAttribute("mensaje", e.getMessage());
			request.getRequestDispatcher("nuevoPedidoVE.jsp").forward(request, response);
		}
		
	}
	
	private boolean esEntero(String cadena){
		try {
			Integer.parseInt(cadena);
			return true;
		} catch (NumberFormatException e2) {
			return false;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		doGet(request, response);
	}

}
