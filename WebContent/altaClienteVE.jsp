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
</head>
<body onload="cambiarHREF()">

<%  Empleado userSession = (Empleado)session.getAttribute("userSession");
            if(userSession == null || !(userSession.getTipo().equals("VE"))){
            	response.sendRedirect("error405.jsp"); }
            	 String tipo_em = userSession.getTipo();%>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Materiales de Construcci&oacute;n</a></h1>
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
    <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido <%=userSession.getNombre() %></span></a></li>
    <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
  <ul>
  <li><a href="indexVE.jsp"><i class="icon icon-th-list"></i> <span>Menu Vendedor</span></a> </li>
    <li class="submenu"> <a href="#"><i class="icon icon-shopping-cart"></i> <span>Pedido</span> </a>
      <ul>
        <li><a id="altaPedidoIdHREF" href="altaPedidoEnvioVE.jsp">Crear Pedido a enviar</a></li>
		<li><a href="crearPedidoRetiroEA.jsp">Crear Pedido para retirar</a></li>
    <li><a href="modificarPedidoVE.jsp">Modificar Pedido</a></li>
      </ul>
    </li>

    <li><a href="consultaProductoVE.jsp"><i class="icon icon-barcode"></i> <span>Consultar Productos</span></a></li>
    <li class="submenu active"> <a href="#"><i class="icon icon-user"></i> <span>Cliente</span> </a>
      <ul>
        <li class="active"><a href="altaClienteVE.jsp">Nuevo Cliente</a></li>
        <li><a href="modificarClienteVE.jsp">Modificar Cliente</a></li>
        <li><a href="bajaClienteVE.jsp">Eliminar Cliente</a></li>
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
    <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Nuevo Cliente</a></div>

  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
  <div id="titulo">
 <h1>Nuevo cliente</h1>
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
        <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>Alta Cliente</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="AltaCliente" method="post" class="form-horizontal">
          <input type="hidden" id="tipo_em" name="tipo_em" value="<%=tipo_em%>" >
            <div class="control-group">
              <label class="control-label">Nombre :</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="Nombre cliente" name="nombre" id="nombre"/>
             	<a href="#" title="Ingrese el nombre del nuevo cliente" class="tip-right"><i class="icon-question-sign"> </a></i>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Apellido :</label>
              <div class="controls">
                <input type="text" class="span11" name="apellido" id="apellido" placeholder="Apellido cliente" />
              	<a href="#" title="Ingrese el apellido del nuevo cliente" class="tip-right"><i class="icon-question-sign"> </a></i>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">DNI :</label>
              <div class="controls">
               <input type="number" class="span11" placeholder="Numero de documento cliente" name="dni" id="dni"/>
               <a href="#" title="Ingrese el Numero de identificacion nacional del nuevo cliente" class="tip-right"><i class="icon-question-sign"> </a></i>
               </div>
               </div>
            <div class="control-group">
              <label class="control-label">Telefono</label>
              <div class="controls">
                <input type="number"  class="span11" placeholder="Numero de telefono" name="tel" id="tel" />
                <a href="#" title="Ingrese el telefono del nuevo cliente (ingrese tambien la caracteristica de la ciudad)" class="tip-right"><i class="icon-question-sign"> </a></i>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Email :</label>
              <div class="controls">
                <input type="text" class="span11" name="email" id="email" placeholder="Nombre de email" />
                <a href="#" title="Ingrese la direcci�n de email del nuevo cliente" class="tip-right"><i class="icon-question-sign"> </a></i>
              </div>
            </div>


            <div class="control-group">
              <label class="control-label">Direcci�n</label>
              <div class="controls">
                <input type="text"  class="span11" placeholder="Direccion cliente" name="direccion" id="direccion" />
                <a href="#" title="Ingrese la direcci�n del nuevo cliente" class="tip-right"><i class="icon-question-sign"> </a></i>
              </div>
              </div>
              <div class="widget-content nopadding">

               </div>
                <div class="form-actions">
                 <p align="right"> <input type="submit" value="Alta" class="btn btn-success">
                </div>
              </form>
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
  <div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Marimon Almeida System. </div>
</div>

<!--end-Footer-part-->
<script src="scripts/juance.js"></script>

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
