package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CtrlCliente;
import negocio.CtrlEmpleado;

/**
 * Servlet implementation class BajaCliente
 */
@WebServlet("/BajaCliente")
public class BajaCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BajaCliente() {
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
		int dnicli = Integer.parseInt(request.getParameter("dni_cli"));
		CtrlCliente ctrl = new CtrlCliente();
		
		String tipo = (String) request.getParameter("tipo_empleado");
		ctrl.borrarCliente(dnicli);
		
		if(tipo.equalsIgnoreCase("EA")){
		request.setAttribute("mensaje", "Empleado eliminado correctamente");
		request.getRequestDispatcher("bajaClienteEA.jsp").forward(request, response);
		}
		else{
			request.setAttribute("mensaje", "Empleado eliminado correctamente");
			request.getRequestDispatcher("bajaClienteVE.jsp").forward(request, response);
		}
	}
}


