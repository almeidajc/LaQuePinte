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
				Empleado empleado = (Empleado)request.getSession().getAttribute("userSession");
				if(empleado==null||empleado.getId_empleado()==0){
					throw new ApplicationException("Para confirmar el pedido debe iniciar sesión como empleado", null);
				} else {
					CtrlPedido ctrlPedido = new CtrlPedido();
					ctrlPedido.confirmarPedido(pedido,empleado);
					request.getSession().removeAttribute("pedido");
					request.setAttribute("mensajeConfirmacion", "El pedido ha sido registrado con éxito. "
							+ "El número asignado del pedido es ");
					request.getRequestDispatcher("nuevoPedidoVE-SIN-LOGIN.jsp").forward(request, response);
				}	
			}
		} catch (ApplicationException e) {
			request.setAttribute("mensajeError", e.getMessage());
			request.getRequestDispatcher("nuevoPedidoVE-SIN-LOGIN.jsp").forward(request, response);
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
