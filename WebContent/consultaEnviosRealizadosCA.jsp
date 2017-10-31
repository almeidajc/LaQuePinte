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

<%  Empleado userSession = (Empleado)session.getAttribute("userSession");
			String nombre="";
            if(userSession == null || !(userSession.getTipo().equals("CA"))){
            	response.sendRedirect("error405.jsp"); }
           %> 

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
    
    <li><a href="consultaEnviosPendientesCA.jsp"><i class="icon icon-truck"></i> <span>Env&iacute;os Pendientes</span></a></li>
   <!--  <li><a href="interface.html"><i class="icon icon-pencil"></i> <span>Eelements</span></a></li> -->
    <li class="active"><a href="consultaEnviosRealizadosCA.jsp"><i class="icon icon-list-ol"></i> <span>Env&iacute;os Realizados</span></a></li>
    
  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Consulta Env&iacute;os Realizados</a></div>
<!--End-breadcrumbs-->
<!--Action boxes-->
<div id="titulo">
 <h1>Consulta de Envios Realizados</h1>
  </div>
  <div class="container-fluid"><hr>
   
  <div class="container-fluid">
     <div class="row-fluid">
      <div class="span12"> <!-- TAMA�O FORMULARIOS -->
      
      
  
     <input placeholder="Ingresar..." type="text" name="search" class="light-table-filter" data-table="order-table" class="form-control" style="margin-top: 2px; " />

        <div class="widget-box">
        
          
          <div class="widget-content nopadding" id="tb_content">
            <table class="order-table table" class="table table-hover">
    <thead>
      <tr >
      	
        <th><h5 style="text-align:center; ">N&deg; de Factura</h5></th>
        <th><h5 style="text-align:center; ">FECHA ENTREGA</h5></th>
        <th><h5 style="text-align:center; ">FECHA EFECTIVA</h5></th>
        <th><h5 style="text-align:center; ">DIRECCION ENVIO</h5></th>
        <th><h5 style="text-align:center; ">DESCRIPCION</h5></th>
        <th><h5 style="text-align:center; ">APELLIDO CLIENTE</h5></th>
        <th><h5 style="text-align:center; ">NOMBRE</h5></th>
       
      
             
      </tr>
    </thead>
    
    <tbody>
      <tr>
      
<%
    		CtrlPedido ctrlP = new CtrlPedido();
    		
    		//PUEDO HACER TMB
			// ArrayList<Habitacion> habitaciones = new ArrayList<Habitacion>();
			// habitacios = ctrl.Listar();

	int id;
	  for (int indice = 0; indice < ctrlP.listarPedidosRealizados().size(); indice++){
		   id = ctrlP.listarPedidosRealizados().get(indice).getEmpleado().getId_empleado();
	if(userSession.getId_empleado() == id ){
		if(ctrlP.listarPedidosRealizados().get(indice).getDireccion_envio() != null ){
		
	%>  
	   
	   <td><h5 style="text-align:center; "><%= ctrlP.listarPedidosRealizados().get(indice).getId_pedido() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrlP.listarPedidosRealizados().get(indice).getFecha_entrega() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrlP.listarPedidosRealizados().get(indice).getFecha_efectiva() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrlP.listarPedidosRealizados().get(indice).getDireccion_envio() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrlP.listarPedidosRealizados().get(indice).getEstado() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrlP.listarPedidosRealizados().get(indice).getApellido() %></h5></td>	
	   <td><h5 style="text-align:center; "><%= ctrlP.listarPedidosRealizados().get(indice).getNombre() %></h5></td>		   
	  
	  
	  
	  
	</tr>
	<%}
		}
		}


      %></div>
          </tbody>
  </table>
  
          </div>
        </div>
      </div>
    </div>
    
  </div>
</div> 
   
   
   
          

      <!-- ac3 fin-->   
      
      
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
