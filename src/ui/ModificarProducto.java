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

import negocio.CtrlEmpleado;
import negocio.CtrlProducto;
import appExceptions.ApplicationException;
import entidades.Empleado;
import entidades.Producto;

/**
 * Servlet implementation class ModificarProducto
 */
@WebServlet("/ModificarProducto")
public class ModificarProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarProducto() {
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

		Producto p = new Producto();
		
		String nom_prod = request.getParameter("nombre_producto");		
			
		Float precprod= Float.parseFloat(request.getParameter("precio_producto"));
		
		int idprod = Integer.parseInt(request.getParameter("id_prod"));
		
		int stock = Integer.parseInt(request.getParameter("stock_producto"));
		int stockmin = Integer.parseInt(request.getParameter("stock_min_producto"));
		int stockmax = Integer.parseInt(request.getParameter("stock_max_producto"));
		String fechaString = ((String)request.getParameter("fecha_prod")).trim();
		Date fecha_desde = null;	
		try {
			fecha_desde = new SimpleDateFormat("yyyy-MM-dd").parse(fechaString);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		p.setNombre_producto(nom_prod);
		
		p.setPrecio(precprod);
		p.setFecha(fecha_desde);
		p.setCantidad_stock(stock);
		p.setCantidad_min_stock(stockmin);
		p.setCantidad_max_stock(stockmax);
		p.setId_producto(idprod);
		
		
		
		
		CtrlProducto ctrl = new CtrlProducto();

		
	try {
		ctrl.modificarProducto(p);
	} catch (ApplicationException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
		request.setAttribute("mensaje", "Producto modificado correctamente");
		request.getRequestDispatcher("modificarProductoEA.jsp").forward(request, response);
		
		
	

	}

}
