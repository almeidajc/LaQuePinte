package ui;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appExceptions.ApplicationException;
import negocio.CtrlMaterial;
import negocio.CtrlProducto;
import entidades.Material;

/**
 * Servlet implementation class AltaMaterial
 */
@WebServlet("/AltaMaterial")
public class AltaMaterial extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaMaterial() {
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
Material m = new Material();
		
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		
		
		
		m.setNombre(nombre);
		if(descripcion==null || descripcion==""){
			m.setDescripcion(null);
		}
		else{
		m.setDescripcion(descripcion);
		}
		CtrlMaterial ctrl = new CtrlMaterial();

		
		boolean existeMat = false;
		
		String nomp;
		String mjs="";
		
		for (int indice = 0; indice < ctrl.listarMateriales().size(); indice++){
			
			
			nomp= ctrl.listarMateriales().get(indice).getNombre();
			
					
			if(nombre == nomp || nomp.equalsIgnoreCase(nombre)){
				existeMat = true;
			}
			   
		}
		
		if(existeMat){	
			mjs = "El material ya se encuentra registrado";
			request.setAttribute("mensaje2", mjs);
			request.getRequestDispatcher("altaMaterialEA.jsp").forward(request, response);
			
		}else{			
		
	try {
		ctrl.agregarMaterial(m);
	} catch (ApplicationException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	

	
	
	request.setAttribute("mensaje", "Material agregado correctamente");
	request.getRequestDispatcher("altaMaterialEA.jsp").forward(request, response);
	
	}

}
}
