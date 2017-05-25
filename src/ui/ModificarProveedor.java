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
 * Servlet implementation class ModificarProveedor
 */
@WebServlet("/ModificarProveedor")
public class ModificarProveedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarProveedor() {
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

		Proveedor p = new Proveedor();
		
		String tipo_em = request.getParameter("tipo_em");
		
		int cuit = Integer.parseInt(request.getParameter("cuit"));
		p.setCuit(cuit);
		p.setRazon_social((request.getParameter("razon_soc")));
		p.setDireccion((request.getParameter("direccion")));
		p.setTel(Integer.parseInt(request.getParameter("tel")));
		p.setEmail((request.getParameter("email")));
		
		
		CtrlProveedor ctrl = new CtrlProveedor();

		
	try {
		ctrl.modificarProveedor(p);
	} catch (ApplicationException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
		request.setAttribute("mensaje", "Proveedor modificado correctamente");
		request.getRequestDispatcher("modificarProveedorEA.jsp").forward(request, response);
	}
		
		
}
