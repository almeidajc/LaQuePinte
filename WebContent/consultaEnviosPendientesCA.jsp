<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entidades.Empleado"%>
    <%@page import="negocio.CtrlPedido"%>    
    <%@page import="entidades.Camionero"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
<title>Materiales::de::Construcci&oacute;n</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="bootstrap/img/logo-fav.png" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="bootstrap/css/fullcalendar.css" />
<link rel="stylesheet" href="bootstrap/css/matrix-style.css" />
<link rel="stylesheet" href="bootstrap/css/matrix-media.css" />
<link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="bootstrap/css/jquery.gritter.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>

<%  Empleado userSession = (Empleado)session.getAttribute("userSession");
			String nombre="";
            if(userSession == null || !(userSession.getTipo().equals("CA"))){
            	response.sendRedirect("error405.jsp"); } %> 

<!--Header-part LOGO MATRIX-STYLE.CSS --> 
<div id="header" >
  <h1><a href="#">Materiales de Construcci&oacute;n</a></h1>
</div>
<!--close-Header-part--> 




<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <!-- <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">Welcome User</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i> My Profile</a></li>
        <li class="divider"></li>
        <li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
        <li class="divider"></li>
        <li><a href="login.jsp"><i class="icon-key"></i> Log Out</a></li>
      </ul>
    </li> -->
  </li> 
    <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido <%=userSession.getNombre() %></span></a></li>
    <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
    </ul>
</div>
<!--close-top-Header-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Menu CAMIONERO</a>
  <ul>
    <li><a href="indexCA.jsp"><i class="icon icon-home"></i> <span>Menu Camionero</span></a> </li>
    
     <li class="active"><a href="consultaEnviosPendientesCA.jsp"><i class="icon icon-truck"></i> <span>Env&iacute;os Pendientes</span></a></li>
   <!--  <li><a href="interface.html"><i class="icon icon-pencil"></i> <span>Eelements</span></a></li> -->
    <li><a href="consultaEnviosRealizadosCA.jsp"><i class="icon icon-list-ol"></i> <span>Env&iacute;os Realizados</span></a></li>
    
  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Consulta Env&iacute;os Pendientes</a></div>
<!--End-breadcrumbs-->
<!--Action boxes-->
 <div id="titulo">
 <h1>Consulta Pedidos Pendientes del dia</h1>
</div>
  <div class="container-fluid"><hr>
   
  <div class="row-fluid">
    <div class="span6">
   <% 
      			String mensaje=(String)request.getAttribute("mensaje");
        		if(mensaje!=null){
      		%>
      		<div class="alert alert-success">
   			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    		<strong><%=mensaje %></strong> . 
  			</div>
      		
      			
      		<%
        		}
      			
      		%>

      		
      		 


<div class="accordion" id="collapse-group" >
  
   
   <% CtrlPedido ctrlP = new CtrlPedido(); 
   		int id;
	  for (int indice = 0; indice < ctrlP.listarPedidosConfirmados().size(); indice++){
		   id = ctrlP.listarPedidosConfirmados().get(indice).getEmpleado().getId_empleado();
		  if(userSession.getId_empleado() == id ){
			  if(ctrlP.listarPedidosConfirmados().get(indice).getDireccion_envio() != null ){
				 
				 double a=ctrlP.listarPedidosConfirmados().get(indice).getTotal();
	          		String total = String.format ("%.2f", a);
	          		String nroFact=  String.format("%08d", ctrlP.listarPedidosConfirmados().get(indice).getId_pedido());

				  
	%> 
	    <!-- ac3 inicio-->        
         <div class="accordion-group widget-box">
           
            <div class="accordion-heading">
              <div class="widget-title"> <a data-parent="#collapse-group" href="#<%= ctrlP.listarPedidosConfirmados().get(indice).getId_pedido() %>" data-toggle="collapse"> <span class="icon"><i class="icon-list-ul"></i></span>
                <h5>FECHA: <%= ctrlP.listarPedidosConfirmados().get(indice).getFecha_entrega() %>| N&deg; FACTURA: <%= nroFact%>| TOTAL: $<%= total %> </h5>

                </a> </div>
            </div>
            <div class="collapse accordion-body" id="<%= ctrlP.listarPedidosConfirmados().get(indice).getId_pedido() %>">
              <div class="widget-content"> <table class="table table-bordered table-striped">
              <thead>
              <tr>
              <b>DIRECCION: <%= ctrlP.listarPedidosConfirmados().get(indice).getDireccion_envio() %></b>
              </tr>
              
             
                <tr>
                  <th>PRODUCTO</th>
                  <th>CANTIDAD</th>
                  <th>PRECIO UNITARIO(s)</th>
                  <th>SUB T</th>
                </tr>
              </thead>
              <%  
              id= ctrlP.listarPedidosConfirmados().get(indice).getId_pedido();
              for (int indice2 = 0; indice2 < ctrlP.getLineaDetallePedido(id).size(); indice2++){
            	  float b=ctrlP.getLineaDetallePedido(id).get(indice2).getPrecioUnitario();
          		String preciou = String.format ("%.2f", b);
          		float c=ctrlP.getLineaDetallePedido(id).get(indice2).getSubtotal();
          		String subt = String.format ("%.2f", c);
	%>
              <tbody>
                <tr class="odd gradeX">
                  <td class="center"><%= ctrlP.getLineaDetallePedido(id).get(indice2).getNombre_producto() %></td>
                  <td class="center" style="text-align: right"><%= ctrlP.getLineaDetallePedido(id).get(indice2).getCantidad() %></td>
                  <td class="center" style="text-align: right">$<%= preciou %></td>
                  <td class="center" style="text-align: right">$<%= subt %></td>
                 
                </tr>
                
              </tbody>
              <%}%>
	
            </table> </div>
            </div>
          </div>
          

      <!-- ac3 fin-->   
   
    
      
      <%}
		  }
	  }%>
	
</div>
        
        	
	


      </div>
      </div>
      </div>
<!--End-Action boxes-->    
   
  </div>
</div>

<!--end-main-container-part-->


<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Almeida Marimon System. </div>
</div>

<!--end-Footer-part-->

<script src="bootstrap/js/excanvas.min.js"></script> 
<script src="bootstrap/js/jquery.min.js"></script> 
<script src="bootstrap/js/jquery.ui.custom.js"></script> 
<script src="bootstrap/js/bootstrap.min.js"></script> 
<script src="bootstrap/js/jquery.flot.min.js"></script> 
<script src="bootstrap/js/jquery.flot.resize.min.js"></script> 
<script src="bootstrap/js/jquery.peity.min.js"></script> 
<script src="bootstrap/js/fullcalendar.min.js"></script> 
<script src="bootstrap/js/matrix.js"></script> 
<script src="bootstrap/js/matrix.dashboard.js"></script> 
<script src="bootstrap/js/jquery.gritter.min.js"></script> 
<script src="bootstrap/js/matrix.interface.js"></script> 
<script src="bootstrap/js/matrix.chat.js"></script> 
<script src="bootstrap/js/jquery.validate.js"></script> 
<script src="bootstrap/js/matrix.form_validation.js"></script> 
<script src="bootstrap/js/jquery.wizard.js"></script> 
<script src="bootstrap/js/jquery.uniform.js"></script> 
<script src="bootstrap/js/select2.min.js"></script> 
<script src="bootstrap/js/matrix.popover.js"></script> 
<script src="bootstrap/js/jquery.dataTables.min.js"></script> 
<script src="bootstrap/js/matrix.tables.js"></script> 

<script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
  function goPage (newURL) {

      // if url is empty, skip the menu dividers and reset the menu selection to default
      if (newURL != "") {
      
          // if url is "-", it is this page -- reset the menu:
          if (newURL == "-" ) {
              resetMenu();            
          } 
          // else, send page to designated URL            
          else {  
            document.location.href = newURL;
          }
      }
  }

// resets the menu selection upon entry to this page:
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}
</script>
</body>
</html>
