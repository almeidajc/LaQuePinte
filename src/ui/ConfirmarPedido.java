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

import appExceptions.ApplicationException;
import entidades.Cliente;
import entidades.Empleado;
import entidades.LineaDetallePedido;
import entidades.Pedido;
import negocio.CtrlPedido;

/**
 * Servlet implementation class ConfirmarPedido
 */
@WebServlet("/ConfirmarPedido")
public class ConfirmarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmarPedido() {
        super();
        // 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String direccion = "";
		String fecha_teorica = "";
		int distancia = 0;
		String coordenadas = "";
		String EsZonaPeligrosa = "";
		String origen = request.getParameter("origen");
		double total = 0;
		try {
			if(request.getSession().getAttribute("pedido")==null){
				throw new ApplicationException("No se encontr� un pedido en la sesi�n", null);
			} else {
				Pedido pedido = (Pedido)request.getSession().getAttribute("pedido");
				Cliente cliente = (Cliente)request.getSession().getAttribute("clientePedidoActual");				
					
				if(cliente==null||cliente.getDni()==0){
					//throw new ApplicationException("Para confirmar el pedido debe seleccionar y guardar un cliente", null);
					request.setAttribute("mensaje", "Para confirmar el pedido debe seleccionar y guardar un cliente");
					if(String.valueOf(origen).equals("mostrador")){
						request.getRequestDispatcher("crearPedidoVE.jsp").forward(request, response);
					}else{
						request.getRequestDispatcher("nuevoPedidoVE.jsp").forward(request, response);
					}
					
				} else {
					CtrlPedido ctrlPedido = new CtrlPedido();
					//leo los datos provenientes de ubicacion solo si origen es distinto de "mostrador"
					if(!String.valueOf(origen).equals("mostrador")){
						direccion = request.getParameter("direccion");
						fecha_teorica = ((String)request.getParameter("fecha")).trim();
						distancia = Integer.parseInt(request.getParameter("distancia"));
						coordenadas = request.getParameter("coordenadas");
						EsZonaPeligrosa = request.getParameter("zonaPeligrosa");
				}			
					
				//seteo pedido con datos de la ubicacion solo si origen es distinto de "mostrador"
					if(!String.valueOf(origen).equals("mostrador")){
					pedido.setDireccion_envio(direccion);
					
					Date fecha = null;
					try {
						fecha = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_teorica);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			        pedido.setFecha_entrega(fecha);
					pedido.setDistancia(distancia);
					pedido.setCoordenadas(coordenadas);
					pedido.setEsZonaPeligrosa(EsZonaPeligrosa);					
					}
					total = Double.parseDouble(request.getParameter("total"));
					pedido.setTotal(total);		
					pedido.setCliente(cliente);
					ctrlPedido.confirmarPedido(pedido);
					request.getSession().removeAttribute("pedido");
					request.getSession().removeAttribute("clientePedidoActual");
					request.setAttribute("mensaje", "El pedido ha sido registrado correctamente. ");
					if(String.valueOf(origen).equals("mostrador")){
						request.getRequestDispatcher("crearPedidoVE.jsp").forward(request, response);
					}else{
						request.getRequestDispatcher("nuevoPedidoVE.jsp").forward(request, response);
					}
					
				}	
			}
		} catch (ApplicationException e) {
			request.setAttribute("mensaje", e.getMessage());
			if(String.valueOf(origen).equals("mostrador")){
				request.getRequestDispatcher("crearPedidoVE.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("nuevoPedidoVE.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		doGet(request, response);
	}

}