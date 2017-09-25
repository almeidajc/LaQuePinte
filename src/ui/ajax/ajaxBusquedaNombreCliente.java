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
 * Servlet implementation class ajaxBusquedaNombreCliente
 */
@WebServlet(asyncSupported = true, description = "Codigo para realizar busqueda parcial de cliente y devolverlo por ajax", urlPatterns = { "/ajaxBusquedaNombreCliente" })
public class ajaxBusquedaNombreCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajaxBusquedaNombreCliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int inicio=0;		
		CtrlCliente ctrlC = new CtrlCliente();
		int cant_por_pagina=5;
		String nombreCliente = request.getParameter("nombreCliente");
		ArrayList<Cliente> clientes;
		try {
			clientes = ctrlC.getClienteByNombreYApellido(nombreCliente, inicio, cant_por_pagina);
			response.getWriter().write(new Gson().toJson(clientes));			
		} catch (ApplicationException e) {
			
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
