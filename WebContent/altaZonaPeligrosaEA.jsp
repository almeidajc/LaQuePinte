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
<title>Materiales::de::Construcci�n</title>
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
<link rel="stylesheet" type="text/css" href="css/jquery.gritter.css" />

<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">google.load('jquery', '1.7.1');</script>
<script type="text/javascript" src="scripts/jquery.gritter.js"></script> <!--Notificaciones-->



</head>
<body body onload="initMap()">

<%  Empleado userSession = (Empleado)session.getAttribute("userSession");
  String nombre="";
       if(userSession == null || !(userSession.getTipo().equals("EA"))){
        response.sendRedirect("error405.jsp"); }else{nombre=userSession.getNombre();} %>

<!--Header-part-->
<div id="header">
<h1><a href="indexEA.jsp">Materiales de Construcci�n</a></h1>
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
<li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido <%=nombre %></span></a></li>


 <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
</ul>
</div>
<!--close-top-Header-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
<ul>
<li class="active"><a href="indexEA.jsp"><i class="icon icon-th-list"></i> <span>Menu Encargado Adm</span></a> </li>
<li class="submenu"> <a href="#"><i class="icon icon-shopping-cart"></i> <span>Pedido</span> </a>
  <ul>
    <li><a href="crearpedido.jsp">Crear Pedido</a></li>
    <li><a href="#">Modificar Pedido</a></li>
    <li><a href="#">Pagar Deuda</a></li>
  </ul>
</li>


<li class="submenu "> <a href="#"><i class="icon icon-barcode"></i> <span>Producto</span> </a>
  <ul>
    <li><a href="altaProductoEA.jsp">Nuevo Producto</a></li>
    <li><a href="modificarProductoEA.jsp">Modificar Producto</a></li>
    <li><a href="bajaProductoEA.jsp">Eliminar Producto</a></li>
    <li><a href="consultaProductoEA.jsp">Consultar Producto</a></li>
  </ul>
</li>

<li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Empleado</span> </a>
  <ul>
   <li><a href="altaUsuarioEA.jsp">Nuevo Empleado</a></li>
    <li><a href="modificarUsuarioEA.jsp">Modificar Empleado</a></li>
    <li><a href="bajaUsuarioEA.jsp">Eliminar Empleado</a></li>
    <li><a href="consultaUsuarioEA.jsp">Consultar Empleado</a></li>
  </ul>
</li>


    <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Proveedores</span> </a>
  <ul>
    <li><a href="altaProveedorEA.jsp">Nuevo Proveedor</a></li>
    <li><a href="modificarProveedorEA.jsp">Modificar Proveedor</a></li>
    <li><a href="bajaProveedorEA.jsp">Eliminar Proveedor</a></li>
    <li><a href="consultaProveedorEA.jsp">Consultar Proveedor</a></li>
  </ul>
</li>


<li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Cliente</span> </a>
  <ul>
    <li><a href="altaClienteEA.jsp">Nuevo Cliente</a></li>
    <li><a href="modificarClienteEA.jsp">Modificar Cliente</a></li>
    <li><a href="bajaClienteEA.jsp">Eliminar Cliente</a></li>
    <li><a href="consultaClienteEA.jsp">Consultar Cliente</a></li>
  </ul>
</li>



<li class="submenu"> <a href="#"><i class="icon icon-map-marker"></i> <span>Ubicaci&oacute;n</span> </a>
  <ul>
    <li><a href="altaZonaPeligrosaEA.jsp">Agregar Ubicaci&oacute;n</a></li>
    <li><a href="#">Modificar Ubicaci&oacute;n</a></li>
    <li><a href="#">Eliminar Ubicaci&oacute;n</a></li>
    <li><a href="#">Consultar Ubicaci&oacute;n</a></li>
  </ul>
</li>


<li><a href="informestock.jsp"><i class="icon icon-bar-chart"></i> <span>Informe Stock</span></a></li>



<li class="submenu"> <a href="#"><i class="icon icon-briefcase"></i> <span>Pedido a Proveedores</span> </a>
  <ul>
    <li><a href="#">Crear Pedido</a></li>
    <li><a href="#">Modificar Pedido</a></li>
    <li><a href="#">Cambiar Estado Pedido</a></li>
    <li><a href="#">Consultar Pedido</a></li>
  </ul>
</li>

</ul>
</div>
<!-- sidebar-menu-->


<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
<div id="content-header">
<div id="breadcrumb"> <a href="indexEA.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>

</div>
<!--End-breadcrumbs-->

<!--Action boxes-->
<div id="titulo" style="padding-left: 38px">
<h1>Consultar Env�os</h1>
</div>
<div class="container-fluid" ><hr>

<div class="quick-actions_homepage">

    <div class="Span12">
    	<div>
    		<label for="">Nombre de la zona peligrosa</label><input type="text" id="nombreZona" placeholder="Nombre de la zona peligrosa">
    	</div>
    	<div>
		    <div id="map" style="height: 500px;"></div>
		    <input type="hidden" id="coordZona" name="" value="">
	    </div>
	</div>
	<br>
    <div class="Span6">
      <input type="button" class="btn btn-success" value="Guardar la zona peligrosa" onclick="guardarZona()">
      <input type="button" class="btn btn-danger" value="Resetear la zona peligrosa" onclick="resetearZona()">
    </div>

</div>
<!--End-Action boxes-->

</div>
</div>

<!--end-main-container-part-->


<!--Footer-part-->

<div class="row-fluid">
<div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Marimon Almeida SYStem. <a href="https://www.google.com.ar/">Visit us</a> </div>
</div>

<!--end-Footer-part-->

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOGGk2FljDX6W8xJ31whaP9caBq1k4D_M&libraries=visualization,places,geometry"> </script>
<script src="scripts/altaZona.js"></script><!--Codigo para coordeanadas-->


<script src="bootstrap/js/jquery.min.js"></script>
<script src="bootstrap/js/jquery.ui.custom.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/jquery.uniform.js"></script>
<script src="bootstrap/js/select2.min.js"></script>
<script src="bootstrap/js/jquery.validate.js"></script>
<script src="bootstrap/js/matrix.js"></script>
<script src="bootstrap/js/matrix.form_validation.js"></script>
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