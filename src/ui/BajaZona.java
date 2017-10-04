package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CtrlZona;

/**
 * Servlet implementation class BajaZona
 */
@WebServlet("/BajaZona")
public class BajaZona extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BajaZona() {
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
		int idzona = Integer.parseInt(request.getParameter("id_zona"));
		
		CtrlZona ctrl = new CtrlZona();
		
		ctrl.borrarZona(idzona);
		
		request.setAttribute("mensaje", "Zona peligrosa eliminada correctamente");
		request.getRequestDispatcher("bajaZonaPeligrosaEA.jsp").forward(request, response);
	}

}
