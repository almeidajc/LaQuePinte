package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appExceptions.ApplicationException;
import entidades.Camionero;
import entidades.Despachante;
import entidades.Empleado;
import entidades.EncargadoAdministracion;
import entidades.Vendedor;
import negocio.CtrlEmpleado;

/**
 * Servlet implementation class IniciarSesion
 */
@WebServlet("/IniciarSesion")
public class IniciarSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IniciarSesion() {
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
		
		String usuario = request.getParameter("usuario");
		String contraseña = request.getParameter("contrasena");
		
		CtrlEmpleado ctrlE = new CtrlEmpleado();
		Empleado E = new Empleado();
		
		try {
			E = ctrlE.getEmpleadoByUsuarioyContraseña (usuario, contraseña);
		} catch (ApplicationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(E == null){
			request.setAttribute("mensaje", usuario);
			request.getRequestDispatcher("login.jsp").forward(request, response);}
		else{ 
		
		    
			request.getSession().setAttribute("userSession", E);
			String tipo = E.getTipo();
			switch (tipo) {
			case "CA":			
				response.sendRedirect("indexCA.jsp");
				break;				
			case "VE":			
				response.sendRedirect("indexVE.jsp");
				break;			
			case "EA":			
				response.sendRedirect("indexEA.jsp");
				break;				
			case "DE":			
				response.sendRedirect("indexDE.jsp");		
				break;				
			default:
				response.sendRedirect("login.jsp");
				break;
			}
			
		}
		
	}

}
