package ui;

import entidades.Cliente;
import negocio.CtrlPedido;
import negocio.CtrlProducto;
import entidades.Pedido;
import entidades.Producto;
import entidades.Vendedor;
import entidades.LineaDetallePedido;

import java.io.IOException;

import appExceptions.ApplicationException;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CrearPedido
 */
@WebServlet("/CrearPedido")
public class CrearPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrearPedido() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*Pedido pedido = (Pedido) request.getSession().getAttribute("pedido");
		Vendedor vendedor = (Vendedor) request.getSession().getAttribute("usuario");
		CtrlProducto ctrlProducto = new CtrlProducto();
		Cliente cliente = new Cliente(); // TENGO QUE UBICARLO EN LA BD
		/*CtrlCliente ctrl = new CtrlCliente();
		Cliente c = ctrl.getClienteByDni(Dni);*/
		/*Date fechaEntrega = new Date(); // OBTENER A PARTIR DE JS QUE DETERMINE LA PROX FECHA POSIBLE DE ENVIO
		ArrayList<LineaDetallePedido> items;
		Producto producto;
		String mensaje="";
		CtrlPedido ctrl= new CtrlPedido();
		try{
			if(vendedor!=null){
				if(pedido==null){
					pedido= new Pedido();
					pedido.setCliente(cliente);
					pedido.setFecha_entrega(fechaEntrega);
					items= new ArrayList<LineaDetallePedido>();
				} else {
					items = pedido.getLineasDetallePedido();
				}
				if(request.getParameter("txtCod").equals("")){
					mensaje+= "El codigo de producto no puede estar vacio\n";
				}
				if(request.getParameter("txtCantidad").equals("")){
					mensaje+= "La cantidad a pedir no puede estar vacia\n";
				}
				if(!mensaje.equals("")){
					throw new ApplicationException(mensaje, null);
				}else{
					int codigo=Integer.valueOf(request.getParameter("txtCod"));
					producto = ctrlProducto.getById(codigo);
					for (LineaDetallePedido lineaDetallePedido : items) {
						if(lineaDetallePedido.getProducto().getId_producto()==producto.getId_producto()){
							throw new ApplicationException("El producto ingresado ya existe en su pedido. Eliminelo y vuelva a intentarlo", null);
						}
					}
					/*int cantidad=Integer.valueOf(request.getParameter("txtCantidad"));
					int stock = ctrlProducto.getStock(producto); // OBTENER STOCK
					if(stock>cantidad){
						items.add(new LineaDetallePedido(producto,cantidad));
						pedido.setLineasDetallePedido(items);
						request.getSession().setAttribute("pedido", pedido);
						response.sendRedirect("nuevoPedidoVE.jsp");
					} else{
						throw new ApplicationException("No hay stock suficiente para esa cantidad", null);
					}*/
				}
			}
			else {
				throw new ApplicationException("Para hacer un pedido debe iniciar sesión como cliente", null);
			}
		}  catch (NumberFormatException e) {
			String msj="";
			if(!esEntero(request.getParameter("txtCod"))) msj+="El código de producto debe ser un número entero. \n";
			if(!esEntero(request.getParameter("txtCantidad"))) msj+="La cantidad debe ser un número entero. \n";
			request.setAttribute("mensaje", msj);
			request.getRequestDispatcher("pedido.jsp").forward(request, response);
		} catch (NullPointerException e) {
			request.setAttribute("mensaje", "No se encontro producto con el código ingresado");
			request.getRequestDispatcher("pedido.jsp").forward(request, response);
		} catch (ApplicationException e){
			request.setAttribute("mensaje", e.getMessage());
			request.getRequestDispatcher("pedido.jsp").forward(request, response);
		}*/
		
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
