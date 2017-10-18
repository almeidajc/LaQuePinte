package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CtrlEmpleado;
import appExceptions.ApplicationException;
import entidades.Empleado;


/**
 * Servlet implementation class ModificarEmpleado
 */
@WebServlet("/ModificarEmpleado")
public class ModificarEmpleado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarEmpleado() {
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
		
		Empleado e = new Empleado();
		
		String tipo_em = request.getParameter("tipo_em");
		
		int idemp = Integer.parseInt(request.getParameter("id_empleado"));
		e.setId_empleado(idemp);
		
		
		e.setTel(Integer.parseInt(request.getParameter("tel")));
		e.setEmail(request.getParameter("email"));
		e.setContraseña((request.getParameter("contrasena")));
		
		CtrlEmpleado ctrl = new CtrlEmpleado();

		
	try {
		ctrl.modificarEmpleado(e);
	} catch (ApplicationException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	if(tipo_em.equalsIgnoreCase("EA")){
		request.setAttribute("mensaje", "Empleado modificado correctamente");
		request.getRequestDispatcher("modificarUsuarioEA.jsp").forward(request, response);
		}
		else{
			request.setAttribute("mensaje", "Empleado modificado correctamente");
			request.getRequestDispatcher("modificarUsuarioADM.jsp").forward(request, response);
		}
	}}
