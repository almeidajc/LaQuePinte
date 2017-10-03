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
import negocio.CtrlCliente;

/**
 * Servlet implementation class ajaxBusquedaApellidoCliente
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ajaxBusquedaApellidoCliente" })
public class ajaxBusquedaApellidoCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ajaxBusquedaApellidoCliente() {
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
		String apellidoCliente = request.getParameter("apellidoCliente");
		ArrayList<Cliente> clientes;
		try {
			clientes = ctrlC.getClienteByApellido(apellidoCliente, inicio, cant_por_pagina);
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
