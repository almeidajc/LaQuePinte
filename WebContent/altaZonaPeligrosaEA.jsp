<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="entidades.EncargadoAdministracion"%>
<%@page import="entidades.Empleado"%>
<%@page import="entidades.Zona"%>
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
function guardarZona() {
	  validaNombre= document.getElementById('nombreZona').value;
	  if(coords.length<3){
		  var unique_id = $.gritter.add({
				title: 'Error al crear zona peligrosa',
				text: 'La zona debe contener al menos 3 vertices',
				// image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
				// (bool | optional) if you want it to fade out on its own or just sit there
				sticky: true,
				// (int | optional) the time you want it to be alive for before fading out
				time: '1500',
				// (string | optional) the class name you want to apply to that specific message
				class_name: 'my-sticky-class'
			});
	  }  
	    else{
	      if (validaNombre !="") {
	    	 document.getElementById("formAlta").submit();
	      }
	      else {
	    	  var unique_id = $.gritter.add({
					title: 'Error al crear zona peligrosa',
					text: 'Por favor complete el nombre',
					// image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
					// (bool | optional) if you want it to fade out on its own or just sit there
					sticky: true,
					// (int | optional) the time you want it to be alive for before fading out
					time: '1500',
					// (string | optional) the class name you want to apply to that specific message
					class_name: 'my-sticky-class'
				});
	      }
	    }
	  
	}
</script>


</head>
<body onload="initMap()">


  <%  Empleado userSession = (Empleado)session.getAttribute("userSession");
  			String nombre="";
             if(userSession == null || !(userSession.getTipo().equals("EA"))){
            	response.sendRedirect("error405.jsp"); }else{nombre=userSession.getNombre();}
             String tipo_em = userSession.getTipo();%>
  <!--Header-part-->
  <div id="header">
    <h1><a href="dashboard.html">Materiales de Construcciï¿½n</a></h1>
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
      <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido  <%=nombre %></span></a></li>


       <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
    </ul>
  </div>
  <!--close-top-Header-menu-->

  <!--sidebar-menu-->
  <div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Menu</a>
    <ul>
      <li class=""><a href="indexEA.jsp"><i class="icon icon-th-list"></i> <span>Menu Encargado Adm</span></a> </li>

      <li class="submenu "> <a href="#"><i class="icon icon-barcode"></i> <span>Producto</span> </a>
        <ul>
          <li><a href="altaProductoEA.jsp">Crear Producto</a></li>
          <li><a href="modificarProductoEA.jsp">Modificar Producto</a></li>
          <li><a href="bajaProductoEA.jsp">Eliminar Producto</a></li>
          <li><a href="consultaProductoEA.jsp">Consultar Producto</a></li>
        </ul>
      </li>

      <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Empleado</span> </a>
        <ul>
          <li><a href="altaUsuarioEA.jsp">Crear Empleado</a></li>
          <li><a href="modificarUsuarioEA.jsp">Modificar Empleado</a></li>
          <li><a href="bajaUsuarioEA.jsp">Eliminar Empleado</a></li>
          <li class="active"><a href="consultaUsuarioEA.jsp">Consultar Empleado</a></li>
        </ul>
      </li>

      <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Proveedores</span> </a>
        <ul>
          <li><a href="altaProveedorEA.jsp">Crear Proveedor</a></li>
          <li><a href="modificarProveedorEA.jsp">Modificar Proveedor</a></li>
          <li><a href="bajaProveedorEA.jsp">Eliminar Proveedor</a></li>
          <li><a href="consultaProveedorEA.jsp">Consultar Proveedor</a></li>
        </ul>
      </li>


      <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Cliente</span> </a>

        <ul>
          <li><a href="altaClienteEA.jsp">Crear Cliente</a></li>
          <li><a href="modificarClienteEA.jsp">Modificar Cliente</a></li>
          <li><a href="bajaClienteEA.jsp">Eliminar Cliente</a></li>
          <li ><a href="consultaClienteEA.jsp">Consultar Cliente</a></li>
        </ul>
      </li>


    <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Material</span> </a>
      <ul>
        <li><a href="altaMaterialEA.jsp">Crear Material</a></li>
        <li><a href="modificarMaterialEA.jsp">Modificar Material</a></li>
        <li><a href="consultaMaterialEA.jsp">Consultar Material</a></li>
      </ul>
    </li>

      <li class="submenu active"> <a href="#"><i class="icon icon-map-marker"></i> <span>Zona Peligrosa</span> </a>

        <ul>
          <li class="active"><a href="altaZonaPeligrosaEA.jsp">Crear Zona Peligrosa</a></li>

          <li><a href="bajaZonaPeligrosaEA.jsp">Eliminar Zona Peligrosa</a></li>
          <li><a href="consultaUbicacionEA.jsp">Consultar Zona Peligrosa</a></li>
        </ul>
      </li>


      <li><a href="informestock.jsp"><i class="icon icon-bar-chart"></i> <span>Informe Stock</span></a></li>
<li><a href="modificarCostosEnvioEA.jsp"><i class="icon icon-bar-chart"></i> <span>Actualizar costos de env&iacute;o</span></a></li>

    </ul>
  </div>
<!-- sidebar-menu-->


<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
<div id="content-header">
<div id="breadcrumb"> <a href="indexEA.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Crear Zona Peligrosa</a></div>

</div>
<!--End-breadcrumbs-->

<!--Action boxes-->
<div id="titulo" style="padding-left: 38px">
<h1>Crear Zona Peligrosa</h1>
</div>
<div class="container-fluid" ><hr>

   <%
      			String mensaje=(String)request.getAttribute("mensaje");
      			String mensaje2=(String)request.getAttribute("mensaje2");
        		if(mensaje!=null){
      		%>
      		<div class="alert alert-success">
   			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    		<strong><%=mensaje %></strong> .
  			</div>
  			<%
        		}
        		if(mensaje2!=null){
      		%>
  			<div class="alert alert-error">
   			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    		<strong><%=mensaje2 %></strong> .
  			</div>


      		<%
        		}

      		%>

<div class="quick-actions_homepage">
	<form action="AltaZona" id="formAlta" method="post" class="form-horizontal">
		<div class="Span12">
			  <div>
			    	<label for="">Nombre de la zona peligrosa</label><input type="text" id="nombreZona" name="nombreZona" placeholder="Nombre de la zona peligrosa" required>
			  		<input type="hidden" id="coordZona" name="coordZona" value="" required>
			  </div>
		</div>
    <div class="Span12">
    	<div>
		    <div id="map" style="height: 500px;"></div>

	    </div>
	</div>
	<br>


		  <div class="Span12">
		   	  <div>
		      	<input type="button" onclick="guardarZona()" class="btn btn-success" value="Guardar la zona peligrosa">
		      	<input type="button" class="btn btn-danger" value="Resetear la zona peligrosa" onclick="resetearZona()">
		      </div>
	     </div>
      </form>


</div>
<!--End-Action boxes-->

</div>
</div>

<!--end-main-container-part-->


<!--Footer-part-->

<div class="row-fluid">
<div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Almeida Marimon System. <a href="https://www.google.com.ar/">Visit us</a> </div>
</div>

<!--end-Footer-part-->

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOGGk2FljDX6W8xJ31whaP9caBq1k4D_M&libraries=visualization,places,geometry"> </script>
<script src="scripts/altaZona.js"></script><!--Codigo para coordeanadas-->


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
