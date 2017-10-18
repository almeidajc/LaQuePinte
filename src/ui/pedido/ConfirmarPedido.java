package ui.pedido;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appExceptions.ApplicationException;
import entidades.Cliente;
import entidades.Empleado;
import entidades.Pedido;
import negocio.CtrlPedido;

/**
 * Servlet implementation class ConfirmarPedido
 */
@WebServlet("/pedido/confirmarPedido")
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
		try {
			if(request.getSession().getAttribute("pedido")==null){
				throw new ApplicationException("No se encontró un pedido en la sesión", null);
			} else {
				Pedido pedido = (Pedido)request.getSession().getAttribute("pedido");
				Cliente cliente = (Cliente)request.getSession().getAttribute("clientePedidoActual");				
				/*if(String.valueOf(origen).equals("mostrador")){
					response.sendRedirect("crearpedido.jsp");
				}else{
					response.sendRedirect("nuevoPedidoVE.jsp");
				}*/
				
				if(cliente==null||cliente.getDni()==0){
					throw new ApplicationException("Para confirmar el pedido debe seleccionar y guardar un cliente", null);
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
					
				//seteo pedido con datos de la ubicacion
					if(!String.valueOf(origen).equals("mostrador")){
					pedido.setDireccion_envio(direccion);
			      //pedido.setFecha_entrega(fecha_teorica);
					pedido.setDistancia(distancia);
					pedido.setCoordenadas(coordenadas);
					pedido.setEsZonaPeligrosa(EsZonaPeligrosa);					
					}
					ctrlPedido.confirmarPedido(pedido,cliente);
					request.getSession().removeAttribute("pedido");
					request.setAttribute("mensajeConfirmacion", "El pedido ha sido registrado con éxito. ");
					if(String.valueOf(origen).equals("mostrador")){
						request.getRequestDispatcher("crearpedido.jsp").forward(request, response);
					}else{
						request.getRequestDispatcher("nuevoPedidoVE.jsp").forward(request, response);
					}
					
				}	
			}
		} catch (ApplicationException e) {
			request.setAttribute("mensajeError", e.getMessage());
			if(String.valueOf(origen).equals("mostrador")){
				request.getRequestDispatcher("crearpedido.jsp").forward(request, response);
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
