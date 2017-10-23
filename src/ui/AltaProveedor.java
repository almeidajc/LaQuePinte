package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CtrlCliente;
import negocio.CtrlProveedor;
import appExceptions.ApplicationException;
import entidades.Cliente;
import entidades.Proveedor;

/**
 * Servlet implementation class AltaProveedor
 */
@WebServlet("/AltaProveedor")
public class AltaProveedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaProveedor() {
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
		Proveedor p = new Proveedor();
		
		String razon_soc = request.getParameter("razon_soc");
		int telefono = Integer.parseInt(request.getParameter("tel"));
		String email = request.getParameter("email");
		int cuit = Integer.parseInt(request.getParameter("cuit"));
		String direccion = request.getParameter("direccion");
		
		
		
	/*	String fechaStr = ((String)request.getParameter("fecha"));
		s.setFecha(fechaStr); // CONVERSION DE DATOS */
		
		
		p.setRazon_social(razon_soc);
		p.setTel(telefono);
		p.setCuit(cuit);
		p.setDireccion(direccion);
		p.setEmail(email);
		
		CtrlProveedor ctrl = new CtrlProveedor();
		boolean existeProv = false;

		int razon;
		String mjs="";

		for (int indice = 0; indice < ctrl.listarProveedores().size(); indice++){


			razon= ctrl.listarProveedores().get(indice).getCuit();


			if(cuit == razon){
				existeProv = true;
			}

		}

		if(existeProv){
			mjs = "El proveedor ya se encuentra registrado";
				request.setAttribute("mensaje2", mjs);
			request.getRequestDispatcher("altaProveedorEA.jsp").forward(request, response);

		}else{
		
	try {
		ctrl.agregarProveedor(p);
	} catch (ApplicationException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	String tipo_em =  request.getParameter("tipo_em");

	
	if(tipo_em.equalsIgnoreCase("EA")){
	request.setAttribute("mensaje", "Proveedor agregado correctamente");
	request.getRequestDispatcher("altaProveedorEA.jsp").forward(request, response);
	}
	
	}

}
}


