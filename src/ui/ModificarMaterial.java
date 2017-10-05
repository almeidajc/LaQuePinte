package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appExceptions.ApplicationException;
import negocio.CtrlMaterial;
import entidades.Material;

/**
 * Servlet implementation class ModificarMaterial
 */
@WebServlet("/ModificarMaterial")
public class ModificarMaterial extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarMaterial() {
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
	Material m=new Material();
	int id = Integer.parseInt(request.getParameter("id"));
	
	m.setId(id);
	m.setNombre(request.getParameter("nombre"));
	m.setDescripcion(request.getParameter("desc"));
	
	CtrlMaterial ctrl = new CtrlMaterial();
	
	try {
		ctrl.modificarMaterial(m);
	} catch (ApplicationException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	request.setAttribute("mensaje", "Material modificado correctamente");
	request.getRequestDispatcher("modificarMaterialEA.jsp").forward(request, response);
	}

}
