package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CtrlCliente;
import entidades.Cliente;

/**
 * Servlet implementation class GuardarClientePedido
 */
@WebServlet("/GuardarClientePedido")
public class GuardarClientePedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuardarClientePedido() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CtrlCliente ctrlC = new CtrlCliente();
		Cliente C = new Cliente();
		String origen = request.getParameter("origen");
		int dniCliente = Integer.parseInt(request.getParameter("guardarDni"));
		
		C = ctrlC.getClienteByDni(dniCliente);
		
		C.setDni(Integer.parseInt(request.getParameter("guardarDni")));
		C.setNombre(request.getParameter("guardarNombre"));
		C.setApellido(request.getParameter("guardarApellido"));
		C.setDireccion(request.getParameter("guardarDireccion"));
		
		request.getSession().setAttribute("clientePedidoActual", C);
		if(String.valueOf(origen).equals("mostrador")){
			response.sendRedirect("crearpedido.jsp");
		}else{
			response.sendRedirect("nuevoPedidoVE.jsp");
		}
		
	}

}
