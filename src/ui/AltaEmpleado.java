package ui;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CtrlEmpleado;
import negocio.CtrlProducto;
import appExceptions.ApplicationException;
import entidades.Empleado;
import entidades.Producto;

/**
 * Servlet implementation class AltaEmpleado
 */
@WebServlet("/AltaEmpleado")
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Empleado e = new Empleado();
		String tipo_em =  request.getParameter("tipo_em");
		
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		int telefono = Integer.parseInt(request.getParameter("tel"));
		String email = request.getParameter("email");
		String tipo = request.getParameter("rol");
		String patente = request.getParameter("patente");
		String usuario = request.getParameter("usuario");
		String password = request.getParameter("pwd");
		int id_turno = Integer.parseInt(request.getParameter("id_turno"));
		
		
	/*	String fechaStr = ((String)request.getParameter("fecha"));
		s.setFecha(fechaStr); // CONVERSION DE DATOS */
		
		
		e.setNombre(nombre);
		e.setApellido(apellido);
		e.setTel(telefono);
		e.setUsuario(usuario);
		e.setContraseña(password);
		e.setTipo(tipo);
		if(patente==""){
			e.setPatente(null);}
		else{
			e.setPatente(patente);
		}
		e.setEmail(email);
		e.setId_turno(id_turno);
		
		CtrlEmpleado ctrl = new CtrlEmpleado();
		boolean existeEmp = false;
		
		String usu;
		String mjs="";
		for (int indice = 0; indice < ctrl.listarEmpleados().size(); indice++){


			usu= ctrl.listarEmpleados().get(indice).getUsuario();


			if(usuario == usu || usu.equalsIgnoreCase(usuario)){
				existeEmp = true;
			}

		}

		if(existeEmp){
			mjs = "El usuario no disponible, por favor ingrese uno distinto";
				request.setAttribute("mensaje2", mjs);
				if(tipo_em.equalsIgnoreCase("EA")){
					request.getRequestDispatcher("altaUsuarioEA.jsp").forward(request, response);	}		
				
				else{
					
					request.getRequestDispatcher("altaUsuarioADM.jsp").forward(request, response);
				}
		}else{
		
	try {
		ctrl.agregarEmpleado(e);
	} catch (ApplicationException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	

	
	if(tipo_em.equalsIgnoreCase("EA")){
	request.setAttribute("mensaje", "Empleado agregado correctamente");
	request.getRequestDispatcher("altaUsuarioEA.jsp").forward(request, response);
	}
	else{
		request.setAttribute("mensaje", "Empleado agregado correctamente");
		request.getRequestDispatcher("altaUsuarioADM.jsp").forward(request, response);
	}
	}
	}
}