package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CtrlZona;
import appExceptions.ApplicationException;
import entidades.Zona;
import entidades.Empleado;

/**
 * Servlet implementation class AltaZona
 */
@WebServlet("/AltaZona")
public class AltaZona extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaZona() {
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
		Zona z = new Zona();

		String descripcion = request.getParameter("nombreZona");
		String coordenadas = request.getParameter("coordZona");



		z.setDescripcion(descripcion);
		z.setCoordenadas(coordenadas);


		CtrlZona ctrl = new CtrlZona();

	try {
		ctrl.agregarZona(z);
	} catch (ApplicationException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	



		request.setAttribute("mensaje", "Zona Peligrosa agregado correctamente");
		request.getRequestDispatcher("altaZonaPeligrosaEA.jsp").forward(request, response);

	}

}
