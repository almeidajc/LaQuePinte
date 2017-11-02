package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CtrlCliente;
import negocio.CtrlProveedor;

/**
 * Servlet implementation class BajaProveedor
 */
@WebServlet("/BajaProveedor")
public class BajaProveedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BajaProveedor() {
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
		String cuit = request.getParameter("cuit");
		CtrlProveedor ctrl = new CtrlProveedor();
		
		String tipo = (String) request.getParameter("tipo_empleado");
		ctrl.borrarProveedor(cuit);
		
		
		request.setAttribute("mensaje", "Proveedor eliminado correctamente");
		request.getRequestDispatcher("bajaProveedorEA.jsp").forward(request, response);
		
	}

}
