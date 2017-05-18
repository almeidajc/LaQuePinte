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
 * Servlet implementation class AltaCliente
 */
@WebServlet("/AltaCliente")
public class AltaCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaCliente() {
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
		
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		int telefono = Integer.parseInt(request.getParameter("tel"));
		String email = request.getParameter("email");
		int dni = Integer.parseInt(request.getParameter("dni"));
		String direccion = request.getParameter("direccion");
		
		
		
	/*	String fechaStr = ((String)request.getParameter("fecha"));
		s.setFecha(fechaStr); // CONVERSION DE DATOS */
		
		
		c.setNombre(nombre);
		c.setApellido(apellido);
		c.setTel(telefono);
		c.setDni(dni);
		c.setDireccion(direccion);
		c.setEmail(email);
		
		CtrlCliente ctrl = new CtrlCliente();
		
	try {
		ctrl.agregarCliente(c);
	} catch (ApplicationException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	String tipo_em =  request.getParameter("tipo_em");

	
	if(tipo_em.equalsIgnoreCase("EA")){
	request.setAttribute("mensaje", "Cliente agregado correctamente");
	request.getRequestDispatcher("altaClienteEA.jsp").forward(request, response);
	}
	else{
		request.setAttribute("mensaje", "Cliente agregado correctamente");
		request.getRequestDispatcher("altaClienteVE.jsp").forward(request, response);
	}
	}

}