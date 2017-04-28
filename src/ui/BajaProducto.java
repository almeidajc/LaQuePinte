package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CtrlProducto;
import appExceptions.ApplicationException;

/**
 * Servlet implementation class BajaProducto
 */
@WebServlet("/BajaProducto")
public class BajaProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BajaProducto() {
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
		int codprod = Integer.parseInt(request.getParameter("id_producto"));
		CtrlProducto ctrl = new CtrlProducto();
		try {
			ctrl.borrarProducto(codprod);
		} catch (ApplicationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		request.setAttribute("mensaje", "Producto eliminado correctamente");
		request.getRequestDispatcher("bajaproducto.jsp").forward(request, response);
		}
	

}
