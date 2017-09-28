package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CtrlCostosEnvio;
import negocio.CtrlEmpleado;
import appExceptions.ApplicationException;
import entidades.CostosEnvio;
import entidades.Empleado;

/**
 * Servlet implementation class ModificarCostosEnvios
 */
@WebServlet("/ModificarCostosEnvio")
public class ModificarCostosEnvio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarCostosEnvio() {
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
		CostosEnvio c = new CostosEnvio();
		
		String i = request.getParameter("id_costos");
		if(i.equals("1")){
			c.setCosto_km(Float.parseFloat(request.getParameter("costokm")));
			c.setRecargo_zona(-1);
		}
		else{
			c.setRecargo_zona(Float.parseFloat(request.getParameter("recargo")));
			
		}
		
		
		CtrlCostosEnvio ctrl = new CtrlCostosEnvio();

		
	try {
		ctrl.modificarCostosEnvio(c);
	} catch (ApplicationException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	request.setAttribute("mensaje", "Costos de envio modificados correctamente");
	request.getRequestDispatcher("modificarCostosEnvioEA.jsp").forward(request, response);
	
	}

	
}
