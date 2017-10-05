package ui.pedido;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appExceptions.ApplicationException;
import entidades.Cliente;
import entidades.Empleado;
import entidades.Pedido;
import negocio.CtrlPedido;

/**
 * Servlet implementation class ConfirmarPedido
 */
@WebServlet("/pedido/confirmarPedido")
public class ConfirmarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmarPedido() {
        super();
        // 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(request.getSession().getAttribute("pedido")==null){
				throw new ApplicationException("No se encontró un pedido en la sesión", null);
			} else {
				Pedido pedido = (Pedido)request.getSession().getAttribute("pedido");
				Cliente cliente = (Cliente)request.getSession().getAttribute("clientePedidoActual");
				if(cliente==null||cliente.getDni()==0){
					throw new ApplicationException("Para confirmar el pedido debe seleccionar y guardar un cliente", null);
				} else {
					CtrlPedido ctrlPedido = new CtrlPedido();
					ctrlPedido.confirmarPedido(pedido,cliente);
					request.getSession().removeAttribute("pedido");
					request.setAttribute("mensajeConfirmacion", "El pedido ha sido registrado con éxito. ");
					request.getRequestDispatcher("nuevoPedidoVE.jsp").forward(request, response);
				}	
			}
		} catch (ApplicationException e) {
			request.setAttribute("mensajeError", e.getMessage());
			request.getRequestDispatcher("nuevoPedidoVE.jsp").forward(request, response);
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
