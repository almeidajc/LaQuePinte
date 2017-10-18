package ui.pedido;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appExceptions.ApplicationException;
import entidades.Pedido;

/**
 * Servlet implementation class BorrarLinea
 */
@WebServlet("/pedido/borrarLinea")
public class BorrarLinea extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrarLinea() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String origen = request.getParameter("origen");
		try {
			if(request.getParameter("nro")==null){
				throw new ApplicationException("Error al recibir el numero de linea a borrar", null);
			} else {
				int nro = Integer.parseInt(request.getParameter("nro"));
				Pedido pedido = (Pedido)request.getSession().getAttribute("pedido");
				pedido.getLineasDetallePedido().remove(nro-1);
				request.getSession().setAttribute("pedido", pedido);
				if(String.valueOf(origen).equals("mostrador")){
					response.sendRedirect("../crearpedido.jsp");
				}else{
					response.sendRedirect("../nuevoPedidoVE.jsp");
				}
			
			}
			
		} catch (ApplicationException e) {
			request.setAttribute("mensajeError", e.getMessage());
			if(String.valueOf(origen).equals("mostrador")){
				request.getRequestDispatcher("../crearpedido.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("../nuevoPedidoVE.jsp").forward(request, response);
			}
			
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
