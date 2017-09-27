package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import negocio.CtrlPedido;
import appExceptions.ApplicationException;
import entidades.Pedido;

/**
 * Servlet implementation class RegistrarEnvioPedido
 */
@WebServlet("/RegistrarEnvioPedido")
public class RegistrarEnvioPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarEnvioPedido() {
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
		// TODO Auto-generated method stub
	
		
		int id_pedido = Integer.parseInt(request.getParameter("id_pedido"));
		int entrega = Integer.parseInt(request.getParameter("entrega"));
		
		CtrlPedido ctrl = new CtrlPedido();
		
		
		
		try {
			ctrl.registrarEnvioPedido(id_pedido);
		} catch (ApplicationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(entrega!=1){
			request.setAttribute("mensaje", "Entrega del pedido registrada correctamente");
			request.getRequestDispatcher("registrarEntregaDE.jsp").forward(request, response);
		}else{
		request.setAttribute("mensaje", "Entrega del pedido registrada correctamente");
		request.getRequestDispatcher("registrarEnvioDE.jsp").forward(request, response);
		}
		
	}
}