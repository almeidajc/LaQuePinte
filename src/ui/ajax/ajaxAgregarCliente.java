package ui.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import appExceptions.ApplicationException;
import entidades.Cliente;
import entidades.Producto;
import negocio.CtrlCliente;
//import negocio.CtrlPedido;
import negocio.CtrlProducto;
/**
 * Servlet implementation class ajaxAgregarCliente
 */
@WebServlet(asyncSupported = true, description = "Codigo para agregar cliente a pedido", urlPatterns = { "/ajaxAgregarCliente" })
public class ajaxAgregarCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajaxAgregarCliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CtrlCliente ctrlC = new CtrlCliente();
		Cliente C = new Cliente();
		
		int dniCliente = Integer.parseInt(request.getParameter("dniCliente"));
		
		C = ctrlC.getClienteByDni(dniCliente);
		
		request.getSession().setAttribute("clientePedido", C);			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
