package ui;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.CtrlCliente;
import appExceptions.ApplicationException;
import entidades.Cliente;
import entidades.Empleado;
import entidades.Pedido;
import entidades.Producto;

/**
 * Servlet implementation class AltaPedido
 */
@WebServlet("/AltaPedido")
public class AltaPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaPedido() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				
		Pedido p = new Pedido();
		
		
		Date FechaEmision = today() ;
		ArrayList<Producto> productos = new ArrayList<Producto>();
		Date FechaEnvio = ((String)request.getParameter("FechaEnvio")); //tiene que ser un JS que calcule en el front-end la prox fecha mas cercana
		int FormaPago = Integer.parseInt(request.getParameter("FormaPago"));
		float CostoEnvio = Float.parseFloat(request.getParameter("CostoEnvio"));
		String DireccionEnvio = request.getParameter("DireccionEnvio");
		int Dni = Integer.parseInt(request.getParameter("dni"));	
		
	/*	String fechaStr = ((String)request.getParameter("fecha"));
		s.setFecha(fechaStr); // CONVERSION DE DATOS */
		
		/*CtrlCliente ctrl = new CtrlCliente();
		Cliente c = ctrl.getClienteByDni(Dni);
		
		if(c.equals(null)){
			//mostrar cliente inexistente
		}
		
		p.setCliente(c);
		p.setCosto_envio(CostoEnvio);
		p.setDireccion_envio(DireccionEnvio);
		p.setFecha_emision(FechaEmision);
		p.setFecha_entrega(FechaEnvio);
		p.setProductos(productos);
		
		
	try {
		ctrl.agregarCliente(c);
	} catch (ApplicationException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	String tipo_em =  request.getParameter("tipo_em");

	
	if(tipo_em.equalsIgnoreCase("EA")){
	request.setAttribute("mensaje", "Cliente agregado correctamente");
	request.getRequestDispatcher("altaClienteEA.jsp").forward(request, response);
	}
	else{
		request.setAttribute("mensaje", "Cliente agregado correctamente");
		request.getRequestDispatcher("altaClienteVE.jsp").forward(request, response);
	}
		
		
		
		
		
	}*/

}
