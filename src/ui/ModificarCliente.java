package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CtrlCliente;
import negocio.CtrlEmpleado;
import appExceptions.ApplicationException;
import entidades.Cliente;
import entidades.Empleado;


/**
 * Servlet implementation class ModificarCliente
 */
@WebServlet("/ModificarCliente")
public class ModificarCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarCliente() {
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
		
		Cliente c = new Cliente();
		
		String tipo_em = request.getParameter("tipo_em");
		String email = request.getParameter("email");
		
		int dnicli = Integer.parseInt(request.getParameter("dni_cli"));
		c.setDni(dnicli);
		c.setNombre((request.getParameter("nombre")));
		c.setApellido((request.getParameter("apellido")));
		c.setDireccion((request.getParameter("direccion")));
		c.setTel(Integer.parseInt(request.getParameter("tel")));
		if(email==""){
			c.setEmail(null);
		}
		else{
		c.setEmail(email);}
		
		
		CtrlCliente ctrl = new CtrlCliente();

		
	try {
		ctrl.modificarCliente(c);
	} catch (ApplicationException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	if(tipo_em.equalsIgnoreCase("EA")){
		request.setAttribute("mensaje", "Cliente modificado correctamente");
		request.getRequestDispatcher("modificarClienteEA.jsp").forward(request, response);
		}
		else{
			request.setAttribute("mensaje", "Cliente modificado correctamente");
			request.getRequestDispatcher("modificarClienteVE.jsp").forward(request, response);
		}
	}}
