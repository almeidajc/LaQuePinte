<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entidades.EncargadoAdministracion"%>
    <%@page import="entidades.Empleado"%>
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
function validarFormulario(){
	let nom,sto,stomi,stoma,prec,tipoMat,rol;
	nom = document.getElementById('nombre').value;
	sto = document.getElementById('apellido').value;
	stomi = document.getElementById('dni').value;
	stoma = document.getElementById('email').value;
	pre = document.getElementById('tel').value;
	rol = document.getElementById('direccion').value;
	if(nom != "" && sto != "" && stomi != "" && stoma != "" && pre !="" && rol !=""){
		let stock,stockmin,stockmax,nombre,precio,direc;
		direc = document.getElementById('direc').style.visibility;
		stock = document.getElementById('nombreError').style.visibility;
		stockmin= document.getElementById('apError').style.visibility;
		stockmax = document.getElementById('dniErro').style.visibility;
		nombre = document.getElementById('emailText').style.visibility;
		precio = document.getElementById('telef').style.visibility;
		if(stock == "hidden" && stockmin == "hidden" && stockmax== "hidden" && nombre == "hidden" && precio == "hidden" && direc == "hidden"){
			document.getElementById("formAlta").submit();
		}
		else{
			var unique_id = $.gritter.add({
				title: 'Error al crear cliente',
				text: 'Por favor complete todo los campos correctamente',
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
	else{
		var unique_id = $.gritter.add({
			title: 'Error al crear cliente',
			text: 'Por favor complete todos los campos',
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

</script>

</head>
<body>

<%  Empleado userSession = (Empleado)session.getAttribute("userSession");
			String nombre="";
           if(userSession == null || !(userSession.getTipo().equals("EA"))){
          	response.sendRedirect("error405.jsp"); }else{nombre=userSession.getNombre();}
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


    <li class="submenu active"> <a href="#"><i class="icon icon-user"></i> <span>Cliente</span> </a>
      <ul>
        <li class="active"><a href="altaClienteEA.jsp">Crear Cliente</a></li>
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
    <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Crear Cliente</a></div>

  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
  <div id="titulo">
 <h1>Crear cliente</h1>
 </div>
  <div class="container-fluid"><hr>

  <div class="row-fluid">
    <div class="span6">
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
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>Alta Cliente</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="AltaCliente" id="formAlta" method="post" class="form-horizontal">
          <input type="hidden" id="tipo_em" name="tipo_em" value="<%=tipo_em%>" >
            <div class="control-group">
              <label class="control-label">Nombre :</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="Nombre cliente" name="nombre" id="nombre" onchange="validaNombre(this.value)" required/>
                <a href="#" title="Ingrese el nombre del nuevo cliente" class="tip-right"><i class="icon-question-sign"></a></i></li>
                <div id="nombreError"></div>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Apellido :</label>
              <div class="controls">
                <input type="text" class="span11" name="apellido" id="apellido" placeholder="Apellido cliente" onchange="validaApellido(this.value)" required />
                <a href="#" title="Ingrese el apellido del nuevo cliente" class="tip-right"><i class="icon-question-sign"> </a></i></li>
               	<div id="apError"></div>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">DNI :</label>
              <div class="controls">
               <input type="number" class="span11" placeholder="Numero de documento cliente" name="dni" id="dni" onchange="validaDNI(this.value)"/>
          	   <a href="#" title="Ingrese el Numero de Identificacion Nacional del nuevo cliente" class="tip-right"><i class="icon-question-sign"> </a></i></li>
          	   <div id="dniErro"></div>
               </div>
               </div>
            <div class="control-group">
              <label class="control-label">Telefono</label>
              <div class="controls">
                <input type="number"  class="span11" placeholder="Numero de telefono" name="tel" id="tel" onchange="validaTel(this.value)" required>
               <a href="#" title="Ingrese el n�mero de telefono del nuevo cliente" class="tip-right"><i class="icon-question-sign"> </a></i></li>
              <div id="telef"></div>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Email :</label>
              <div class="controls">
                <input type="text" class="span11" name="email" id="email" placeholder="Direccion de email" onchange="validarEmail(this.value)" />
             	<a href="#" title="Ingrese la direccion de email del nuevo cliente" class="tip-right"><i class="icon-question-sign"> </a></i></li>
             	<div id="emailText"></div>
              </div>
            </div>


            <div class="control-group">
              <label class="control-label">Direcci&oacute;n</label>
              <div class="controls">
                <input type="text"  class="span11" placeholder="Direccion cliente" name="direccion" id="direccion" onchange="validaDirec(this.value)" />
              	<a href="#" title="Ingrese la direcci&oacute;n del nuevo cliente" class="tip-right"><i class="icon-question-sign"> </a></i>
              	<div id="direc"></div>
              </div>
              </div>
              <div class="widget-content nopadding">

               </div>
                <div class="form-actions">
                 <p align="right"> <input type="button" onclick="validarFormulario()" value="Alta" class="btn btn-success">
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
