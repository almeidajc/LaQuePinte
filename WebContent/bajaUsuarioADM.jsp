<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="entidades.Empleado"%>
     <%@page import="negocio.CtrlEmpleado"%>
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

<style type="text/css">

}
tbody tr:nth-child(odd) {
  background: #eee;
}

.input[type=text] {
    width: 130px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

/* When the input field gets focus, change its width to 100% */
input[type=text]:focus {
    width: 100%;
}

	</style>
</head>
<body>
<%  Empleado userSession = (Empleado)session.getAttribute("userSession");
			String nombre="";
           if(userSession == null || !(userSession.getTipo().equals("ADM"))){
          	response.sendRedirect("error405.jsp"); }else{nombre=userSession.getNombre();}
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
    <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido  <%=nombre %></span></a></li>


     <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Menu</a>
  <ul>
    <li><a href="indexADM.jsp"><i class="icon icon-th-list"></i> <span>Menu Administrador</span></a> </li>


    <li class="submenu active"> <a href="#"><i class="icon icon-user"></i> <span>Empleado</span> </a>
      <ul>
        <li><a href="altaUsuarioADM.jsp">Nuevo Empleado</a></li>
        <li><a href="modificarUsuarioADM.jsp">Modificar Empleado</a></li>
        <li class="active"><a href="bajaUsuarioADM.jsp">Eliminar Empleado</a></li>
        <li><a href="consultaUsuarioADM.jsp">Consultar Empleado</a></li>
      </ul>
    </li>




  </ul>
</div>
<!-- sidebar-menu-->


<!--main-container-part-->

    <div id="content">
    <!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Eliminar Empleado</a></div>

  </div>
<!--End-Action boxes-->



<!--End-breadcrumbs-->

<!--Action boxes-->
<div id="titulo">
 <h1>Eliminar Empleado</h1>
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

        <th><h5 style="text-align:left; ">ID</h5></th>
        <th><h5 style="text-align:left; ">NOMBRE</h5></th>
        <th><h5 style="text-align:left; ">APELLIDO</h5></th>
        <th><h5 style="text-align:left; ">TELEFONO</h5></th>
        <th><h5 style="text-align:left; ">ROL</h5></th>
        <th><h5 style="text-align:left; ">USUARIO</h5></th>
        <th><h5 style="text-align:left; ">PATENTE</h5></th>
        <th><h5 style="text-align:center; ">ELIMINAR</h5></th>

      </tr>
    </thead>

    <tbody>
      <tr>
<%
    		CtrlEmpleado ctrl = new CtrlEmpleado();

    		//PUEDO HACER TMB
			// ArrayList<Habitacion> habitaciones = new ArrayList<Habitacion>();
			// habitacios = ctrl.Listar();

	for (int indice = 0; indice < ctrl.listarEmpleados().size(); indice++){
		String tipo = ctrl.listarEmpleados().get(indice).getTipo();
		if( !tipo.equalsIgnoreCase("ADM")){%>
	   <td><h5><%= ctrl.listarEmpleados().get(indice).getId_empleado() %></h5></td>
	   <td><h5><%= ctrl.listarEmpleados().get(indice).getNombre() %></h5></td>
	   <td><h5><%= ctrl.listarEmpleados().get(indice).getApellido() %></h5></td>
	   <td><h5><%= ctrl.listarEmpleados().get(indice).getTel() %></h5></td>
	   <td><h5><%= ctrl.listarEmpleados().get(indice).getTipo() %></h5></td>
	   <td><h5><%= ctrl.listarEmpleados().get(indice).getUsuario() %></h5></td>
	   <td><h5><%= ctrl.listarEmpleados().get(indice).getPatente() %></h5></td>
	    <td><form method="post" action="BajaEmpleado">
           <input type="hidden" id="id_empleado" name="id_empleado" value="<%= ctrl.listarEmpleados().get(indice).getId_empleado()%>" >
            <input type="hidden" id="tipo_empleado" name="tipo_empleado" value="<%=tipo_em%>" >
           <button type="submit" class="btn2" name="bajaempleado" id="bajaempleado" onClick="return confirm('�Esta Seguro que deseas dar de baja este empleado?')">
           <span class="icon-trash" style="color: red; font-size:100%;"></span></a></form></td>

	</tr>

	</tr>
	<%
		}
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

</body>
</html>
