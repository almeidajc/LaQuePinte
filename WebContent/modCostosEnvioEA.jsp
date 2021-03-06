<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="entidades.Empleado"%>
     <%@page import="entidades.CostosEnvio"%>
      <%@page import="negocio.CtrlCostosEnvio"%>
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

<% String id = request.getParameter("id_costos");
      CtrlCostosEnvio ctrl = new CtrlCostosEnvio();
      CostosEnvio c =ctrl.listarCostosEnvio();
      float costokm= c.getCosto_km();
      float recargo= c.getRecargo_zona();



      //String numeroStr = String.valueOf(h.getNumero());



       Empleado userSession = (Empleado)session.getAttribute("userSession");
	String tipo_em = userSession.getTipo();
	%>

<script>
function validarFormulario(){
	let nom;
	nom = document.getElementById('precio_producto').value;

	if(nom != ""){
		let stock,stockmin,stockmax,nombre,precio,direc;
		direc = document.getElementById('precioError').style.visibility;
		if(direc == "hidden"){
			document.getElementById("formAlta").submit();
		}
		else{
			var unique_id = $.gritter.add({
				title: 'Error al modificar el precio de envio',
				text: 'Por favor ingrese un valor valido',
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

<%
			String nombre="";
           if(userSession == null || !(userSession.getTipo().equals("EA"))){
          	response.sendRedirect("error405.jsp"); }else{nombre=userSession.getNombre();}

          %>





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
    <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido <%=nombre %></span></a></li>


     <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->


<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Menu</a>
  <ul>
    <li class="active"><a href="indexEA.jsp"><i class="icon icon-th-list"></i> <span>Menu Encargado Adm</span></a> </li>
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
        <li><a href="consultaUsuarioEA.jsp">Consultar Empleado</a></li>
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
        <li><a href="consultaClienteEA.jsp">Consultar Cliente</a></li>
      </ul>
  </li>

    <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Material</span> </a>
      <ul>
        <li><a href="altaMaterialEA.jsp">Crear Material</a></li>
        <li><a href="modificarMaterialEA.jsp">Modificar Material</a></li>
        <li><a href="consultaMaterialEA.jsp">Consultar Material</a></li>
      </ul>
    </li>


    <li class="submenu"> <a href="#"><i class="icon icon-map-marker"></i> <span>Zona Peligrosa</span> </a>

      <ul>
        <li><a href="altaZonaPeligrosaEA.jsp">Crear Zona Peligrosa</a></li>

        <li><a href="bajaZonaPeligrosaEA.jsp">Eliminar Zona Peligrosa</a></li>
        <li><a href="consultaUbicacionEA.jsp">Consultar Zona Peligrosa</a></li>
      </ul>
    </li>

    <li><a href="informestock.jsp"><i class="icon icon-bar-chart"></i> <span>Informe Stock</span></a></li>
<li><a href="modificarCostosEnvioEA.jsp"><i class="icon icon-bar-chart"></i> <span>Actualizar costos de env&iacute;o</span></a></li>

  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Baja Cliente</a></div>

  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
<div id="titulo">
 <h1>Modificar Costos de env&iacute;o</h1>
 </div>
  <div class="container-fluid"><hr>

  <div class="row-fluid">
    <div class="span6">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>Modificar Costos de Env&iacute;o</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="ModificarCostosEnvio" id="formAlta" method="post" class="form-horizontal">
			<%

			if(id.equalsIgnoreCase("1")){

				String costo = String.format ("%.2f", costokm);



				%>
             <div class="control-group">
              <label class="control-label">Precio por kil&oacute;metro: </label>
              <div class="controls">

                <input type="text" style="text-align:right" class="span11" name="costokm"  value="<%= costo %>" id="precio_producto" placeholder="" onchange="validaPrecio(this.value)" />
                <a href="#" title="Ingrese el precio del envio con dos decimales" class="tip-right"><i class="icon-question-sign"> </a></i>
                <input type="hidden" id="id_costos" name="id_costos" value="<%= 1 %>" >
				<div id="precioError" style="visibility:hidden"></div>
            </div>

            <% }
			else{	String costo2 = String.format ("%.2f", recargo);
				%>
                 <div class="control-group">
              <label class="control-label">Recargo por zona peligrosa:</label>
              <div class="controls">

                <input type="text" style="text-align:right" class="span11" name="recargo"  value="<%= costo2 %>" id="precio_producto" onchange="validaPrecio(this.value)" />
                 <a href="#" title="Ingrese el precio del envio con dos decimales" class="tip-right"><i class="icon-question-sign"> </a></i>
                 <input type="hidden" id="id_costos" name="id_costos" value="<%= 2 %>" >
				 <div id="precioError" style="visibility:hidden"></div>
            </div>
            <%
			}
				%>


                </div>

                <div class="form-actions">
                  <input type="button" onclick="validarFormulario()" value="Modificar" class="btn btn-success">
                </div>
              </form>
        </div>
      </div>
    </div>
    </div>
<!--End-Action boxes-->

  </div>
</div>
</div>
<!--end-main-container-part-->
</div>

<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Almeida Marimon System. </div>
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
