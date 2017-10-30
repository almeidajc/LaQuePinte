<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entidades.Vendedor"%>
    <%@page import="entidades.Despachante"%>
    <%@page import="entidades.EncargadoAdministracion"%>
    <%@page import="entidades.Empleado"%>
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

<script>
var resp;
function mensajeConfirmacion(){
	
	var valor = document.getElementById("mensaje1").value;
	if (valor == 1){
		var unique_id = $.gritter.add({
			title: 'Pedido Creado',
			text: 'El pedido se ha creado Correctamente',
			// image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
			// (bool | optional) if you want it to fade out on its own or just sit there
			sticky: true,
			// (int | optional) the time you want it to be alive for before fading out
			time: '',
			// (string | optional) the class name you want to apply to that specific message
			class_name: 'my-sticky-class'
		});
	}
	 
}

</script>
</head>
<body onload="mensajeConfirmacion()">

<%  Empleado userSession = (Empleado)session.getAttribute("userSession");
		String nombre="";
            if(userSession == null || !(userSession.getTipo().equals("VE"))){
            	response.sendRedirect("error405.jsp"); }%>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Materiales de Construccionn</a></h1>
</div>
<!--close-Header-part-->

<% 				int set = 0;
      			String mensaje=(String)request.getAttribute("mensaje");
        		if(mensaje!=null){
        			set = 1;}
        	        
      		%>


				<input type="hidden" name="mensaje" id="mensaje1" value="<%=set%>">
		

<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido <%=userSession.getNombre() %></span></a></li>
    <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Menu</a>
  <ul>
  <li class="active"><a href="indexVE.jsp"><i class="icon icon-th-list"></i> <span>Menu Vendedor</span></a> </li>
    <li class="submenu"> <a href="#"><i class="icon icon-shopping-cart"></i> <span>Pedido</span> </a>
      <ul>
        <li><a id="altaPedidoIdHREF" href="altaPedidoEnvioVE.jsp">Crear Pedido a enviar</a></li>
        <li><a href="crearPedidoVE.jsp">Crear Pedido para retirar</a></li>
        
      </ul>
    </li>
     <li><a href="consultaProductoVE.jsp"><i class="icon icon-barcode"></i> <span>Consultar Productos</span></a></li>

    <li class="submenu"> <a href=""><i class="icon icon-user"></i> <span>Cliente</span> </a>
      <ul>
        <li><a href="altaClienteVE.jsp">Crear Cliente</a></li>
        <li><a href="modificarClienteVE.jsp">Modificar Cliente</a></li>

        <li><a href="consultaClienteVE.jsp">Consultar Cliente</a></li>
      </ul>
    </li>



  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>

  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
 <div id="titulo">
 <h1>Menu Vendedor</h1>
 </div>
  <div class="container-fluid"><hr>

    <div class="quick-actions_homepage">
      <ul class="quick-actions">


        <li class="bg_lg span8"> <a href="crearPedidoVE.jsp"> <i class="icon-shopping-cart"></i> Pedido a retirar en mostrador</a> </li>

        <li class="bg_ls span8"> <a href="altaPedidoEnvioVE.jsp"> <i class="icon-truck"></i> Pedido a enviar</a> </li>

        <li class="bg_ly span8"> <a href="consultaProductoVE.jsp"> <i class="icon-barcode"></i> Consultar Productos</a> </li>


        <li class="bg_lo span8"> <a href="altaClienteVE.jsp"> <i class="icon-user"></i> Cliente</a> </li>




      </ul>
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
