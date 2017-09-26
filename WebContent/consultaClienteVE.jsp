<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entidades.Vendedor"%>
    <%@page import="entidades.Empleado"%>
    <%@page import="entidades.Cliente"%>
    <%@page import="negocio.CtrlCliente"%>
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
</head>
<script type="text/javascript"> // inicio tabla js1//
(function(document) {
  'use strict';

  var LightTableFilter = (function(Arr) {

    var _input;

    function _onInputEvent(e) {
      _input = e.target;
      var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
      Arr.forEach.call(tables, function(table) {
        Arr.forEach.call(table.tBodies, function(tbody) {
          Arr.forEach.call(tbody.rows, _filter);
        });
      });
    }

    function _filter(row) {
      var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
      row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
    }

    return {
      init: function() {
        var inputs = document.getElementsByClassName('light-table-filter');
        Arr.forEach.call(inputs, function(input) {
          input.oninput = _onInputEvent;
        });
      }
    };
  })(Array.prototype);

  document.addEventListener('readystatechange', function() {
    if (document.readyState === 'complete') {
      LightTableFilter.init();
    }
  });

})(document);
</script>		
</head>
<body>

<%   Empleado userSession = (Empleado)session.getAttribute("userSession");
if(userSession == null || !(userSession.getTipo().equals("VE"))){
	response.sendRedirect("error405.jsp"); }
	 String tipo_em = userSession.getTipo();%>
<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Materiales de Construcci�n</a></h1>
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
  <li class="active"><a href="indexVE.jsp"><i class="icon icon-th-list"></i> <span>Menu Vendedor</span></a> </li>
    <li class="submenu"> <a href="#"><i class="icon icon-shopping-cart"></i> <span>Pedido</span> </a>
      <ul>
        <li><a href="crearPedidoVE.jsp">Crear Pedido</a></li>
        <li><a href="modificarPedidoVE.jsp">Modificar Pedido</a></li>
      </ul>
    </li>
    
    <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Cliente</span> </a>
      <ul>
        <li><a href="altaClienteVE.jsp">Nuevo Cliente</a></li>
        <li><a href="modificarClienteVE.jsp">Modificar Cliente</a></li>
        <li><a href="bajaClienteVE.jsp">Eliminar Cliente</a></li>
        <li><a href="consultaClienteVE.jsp">Consultar Cliente</a></li>
      </ul>
    </li>
    
    <li class="submenu"> <a href="#"><i class="icon icon-map-marker"></i> <span>Ubicaci&oacute;n</span> </a>
      <ul>
        <li><a href="altaZonaPeligrosaEA.jsp">Agregar Ubicaci&oacute;n</a></li>
        <li><a href="#">Modificar Ubicaci&oacute;n</a></li>
        <li><a href="bajaUbicacionEA.jsp">Eliminar Ubicaci&oacute;n</a></li>
        <li><a href="consultaUbicacionEA.jsp">Consultar Ubicaci&oacute;n</a></li>
      </ul>
    </li>
    
  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Consultar Cliente</a></div>
   
  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
 
   <div id="titulo">
 <h1>Consultar Cliente</h1><hr>
 </div>

  <div class="container-fluid">
     <div class="row-fluid">
      <div class="span12"> <!-- TAMA�O FORMULARIOS -->
      
      
  
     <input placeholder="Ingresar..." type="text" name="search" class="light-table-filter" data-table="order-table" class="form-control" style="margin-top: 2px; " />

        <div class="widget-box">
        
          
          <div class="widget-content nopadding" id="tb_content">
            <table class="order-table table" class="table table-hover">
    <thead>
      <tr >
      	
        <th><h5 style="text-align:center; ">DNI</h5></th>
        <th><h5 style="text-align:center; ">NOMBRE</h5></th>
        <th><h5 style="text-align:center; ">APELLIDO</h5></th>
        <th><h5 style="text-align:center; ">TELEFONO</h5></th>
        <th><h5 style="text-align:center; ">DIRECCION</h5></th>
        <th><h5 style="text-align:center; ">EMAIL</h5></th> 
        <th><h5 style="text-align:center; ">ID ZONA</h5></th>
             
      </tr>
    </thead>
    
    <tbody>
      <tr>
<%
    		CtrlCliente ctrl = new CtrlCliente();
    		
    		//PUEDO HACER TMB
			// ArrayList<Habitacion> habitaciones = new ArrayList<Habitacion>();
			// habitacios = ctrl.Listar();

	for (int indice = 0; indice < ctrl.listarClientes().size(); indice++){
	%>  
	   <td><h5 style="text-align:center; "><%= ctrl.listarClientes().get(indice).getDni() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarClientes().get(indice).getNombre() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarClientes().get(indice).getApellido() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarClientes().get(indice).getTel() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarClientes().get(indice).getDireccion() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarClientes().get(indice).getEmail() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarClientes().get(indice).getId_zona() %></h5></td>
	  
	  
	</tr>
	<%
	
}


      %>
          </tbody>
  </table>
          </div>
        </div>
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
  <div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Marimon Almeida SYStem. <a href="https://www.google.com.ar/">Visit us</a> </div>
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
