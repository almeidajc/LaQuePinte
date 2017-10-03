package ui.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;



import entidades.Cliente;
//import appExceptions.ApplicationException;
import entidades.Producto;
import negocio.CtrlCliente;
import negocio.CtrlProducto;

/**
 * Servlet implementation class ajaxBusquedaDniCliente
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ajaxBusquedaDniCliente" })
public class ajaxBusquedaDniCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajaxBusquedaDniCliente() {
        super();
        // 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlCliente ctrlCliente = new CtrlCliente();		
		int dni = Integer.valueOf(request.getParameter("dniCliente"));
		Cliente cliente;
		cliente = ctrlCliente.getClienteByDni(dni);
		response.getWriter().write(new Gson().toJson(cliente));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		doGet(request, response);
	}

}
