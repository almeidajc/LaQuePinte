package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Empleado;
import negocio.CtrlEmpleado;
import negocio.CtrlProducto;
import appExceptions.ApplicationException;

/**
 * Servlet implementation class BajaEmpleado
 */
@WebServlet("/BajaEmpleado")
public class BajaEmpleado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BajaEmpleado() {
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
		int idemp = Integer.parseInt(request.getParameter("id_empleado"));
		CtrlEmpleado ctrl = new CtrlEmpleado();
		
		String tipo = (String) request.getParameter("tipo_empleado");
		ctrl.borrarEmpleado(idemp);
		
		if(tipo.equalsIgnoreCase("EA")){
		request.setAttribute("mensaje", "Empleado eliminado correctamente");
		request.getRequestDispatcher("bajaUsuarioEA.jsp").forward(request, response);
		}
		else{
			request.setAttribute("mensaje", "Empleado eliminado correctamente");
			request.getRequestDispatcher("bajaUsuarioADM.jsp").forward(request, response);
		}
	}
}
