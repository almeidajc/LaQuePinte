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
public class AltaEmpleado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaEmpleado() {
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
	/*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Empleado empleado = (Empleado) request.getSession().getAttribute("usuario");
		Empleado emp;
		CtrlEmpleado ctrl = new CtrlEmpleado();
		String nombre = ((String)request.getParameter("nombre")).trim();
		String apellido = ((String)request.getParameter("apellido")).trim();
		String usuario =((String)request.getParameter("usuario")).trim();
		String contraseña = ((String)request.getParameter("contraseña")).trim();
		int telefono = Integer.parseInt(request.getParameter("tel"));
		String tipo = ((String)request.getParameter("tipo")).trim();
		
		String mensaje ="";
		if(nombre.equals("")){
			mensaje+="El campo nombre no puede estar en blanco\n";
		}
		if(apellido.equals("")){
			mensaje+="El campo apellido no puede estar en blanco\n";
		}
		if(usuario.equals("")){
			mensaje+="El campo usuario no puede estar en blanco\n";
		}
		if(contraseña.equals("")){
			mensaje+="El campo contraseña no puede estar en blanco\n";
		}
		/*if(telefono == null){
			mensaje+="El campo telefono no puede estar en blanco\n";
		}
		if(tipo.equals("")){
			mensaje+="El campo tipo no puede estar en blanco\n";
		}
		
		/*if(!ctrl.verificarUser(usuario)){
			mensaje+="El nombre de usuario ya existe, intente con otro\n";
		}
			if (!mensaje.equals("")){
				request.setAttribute("mensaje", mensaje);
				request.getRequestDispatcher("registro.jsp").forward(request, response);
			} else{
				
				emp = new Empleado();
				
				/*int codCliente = ctrl.buscarUltCodCli();
				codCliente = codCliente +1;
				emp.setNombre(nombre);
				emp.setApellido(apellido);
				emp.setUsuario(usuario);
				emp.setContraseña(contraseña);
				emp.setTel(telefono);
				emp.setTipo(tipo);
				request.setAttribute("mensajeConfirmacion", "Registro realizado con exito");
			    request.getRequestDispatcher("altaUsuarioADM.jsp").forward(request, response);
			
			}

	}*/

	private boolean esEntero(String cadena){
		try {
			Integer.parseInt(cadena);
			return true;
		} catch (NumberFormatException e2) {
			return false;
		}
		}
}