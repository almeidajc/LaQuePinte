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

import negocio.CtrlProducto;

import appExceptions.ApplicationException;
import entidades.Producto;


/**
 * Servlet implementation class AltaProducto
 */
@WebServlet("/AltaProducto")
public class AltaProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaProducto() {
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

		Producto p = new Producto();
		int cod = Integer.parseInt(request.getParameter("codigo_producto"));
		String nombre = request.getParameter("nombre_producto");
		float precio = Float.parseFloat(request.getParameter("precio_producto"));
		int stock = Integer.parseInt(request.getParameter("stock_producto"));
		int stock_min = Integer.parseInt(request.getParameter("stock_min_producto"));
		int stock_max = Integer.parseInt(request.getParameter("stock_max_producto"));
		int idmaterial = Integer.parseInt(request.getParameter("material"));
		String fechaString = ((String)request.getParameter("fecha_producto")).trim();
		Date fecha_desde = null;	
		try {
			fecha_desde = new SimpleDateFormat("yyyy-MM-dd").parse(fechaString);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
				
		
	/*	String fechaStr = ((String)request.getParameter("fecha"));
		s.setFecha(fechaStr); // CONVERSION DE DATOS */
		
		p.setId_producto(cod);
		p.setNombre_producto(nombre);
		p.setPrecio(precio);
		p.setFecha(fecha_desde);
		p.setCantidad_stock(stock);
		p.setCantidad_min_stock(stock_min);
		p.setCantidad_max_stock(stock_max);
		p.setId_material(idmaterial);
		
		CtrlProducto ctrl = new CtrlProducto();
		
		boolean existeProd = false;
		int idp;
		String nomp;
		String mjs="";
		
		for (int indice = 0; indice < ctrl.listarProductos().size(); indice++){
			
			idp = ctrl.listarProductos().get(indice).getId_producto();
			nomp= ctrl.listarProductos().get(indice).getNombre_producto();
			
					
			if(cod == idp || nomp.equalsIgnoreCase(nombre)){
				existeProd = true;
			}
			   
		}
		
		if(existeProd){	
			mjs = "El producto ya se encuentra registrado";
			request.setAttribute("mensaje", mjs);
			request.getRequestDispatcher("altaproducto.jsp").forward(request, response);
			
		}else{			
			
		try {
			ctrl.agregarProducto(p);
		} catch (ApplicationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			mjs = "Producto agregado correctamente";
			request.setAttribute("mensaje",mjs );
			request.getRequestDispatcher("altaproducto.jsp").forward(request, response);
			
		}
		
	}

}
