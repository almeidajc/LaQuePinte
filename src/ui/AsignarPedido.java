package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appExceptions.ApplicationException;
import negocio.CtrlPedido;
import entidades.Pedido;

/**
 * Servlet implementation class AsignarPedido
 */
@WebServlet("/AsignarPedido")
public class AsignarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AsignarPedido() {
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
		
	CtrlPedido ctrlp = new CtrlPedido();
	
	int idped = Integer.parseInt(request.getParameter("idpedido"));
	int idcam = Integer.parseInt(request.getParameter("idcamionero"));
	
	try {
		ctrlp.asignarPedido(idped,idcam);
	} catch (ApplicationException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	request.setAttribute("mensaje", "Pedido asignado correctamente");
	request.getRequestDispatcher("asignarEnviosDE.jsp").forward(request, response);
	
	
	}

}
