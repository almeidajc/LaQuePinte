<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entidades.EncargadoAdministracion"%>
    <%@page import="entidades.Empleado"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Materiales::de::Construcciï¿½n</title>
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
    <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido <%=nombre %></span></a></li>
    
    
     <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
  <ul>
    <li class=""><a href="indexEA.jsp"><i class="icon icon-th-list"></i> <span>Menu Encargado Adm</span></a> </li>
    <li class="submenu"> <a href="#"><i class="icon icon-shopping-cart"></i> <span>Pedido</span> </a>
      <ul>
        <li><a href="crearPedidoEnvioEA.jsp">Crear Pedido a enviar</a></li>
<li><a href="crearPedidoRetiroEA.jsp">Crear Pedido para retirar</a></li>
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

    <li class="submenu active"> <a href="#"><i class="icon icon-user"></i> <span>Empleado</span> </a>
      <ul>
        <li class="active"><a href="altaUsuarioEA.jsp">Nuevo Empleado</a></li>
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
        <li><a href="agregarubicacion.jsp">Agregar Ubicaci&oacute;n</a></li>
        <li><a href="#">Modificar Ubicaci&oacute;n</a></li>
        <li><a href="bajaUbicacionEA.jsp">Eliminar Ubicaci&oacute;n</a></li>
        <li><a href="consultaUbicacionEA.jsp">Consultar Ubicaci&oacute;n</a></li>
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
    <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Nuevo Empleado</a></div>

  </div>
<!--End-Action boxes-->



<!--End-breadcrumbs-->

<!--Action boxes-->
  <div id="titulo">
 <h1>Nuevo Empleado</h1>
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
          <h5>Alta usuario</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="AltaEmpleado" method="post" class="form-horizontal">
          <input type="hidden" id="tipo_empleado" name="tipo_em" value="<%=tipo_em%>" >
            <div class="control-group">
              <label class="control-label">Nombre :</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="Nombre empleado" name="nombre" id="nombre"/>
                <a href="#" title="Ingrese el nombre del nuevo empleado" class="tip-right"><i class="icon-question-sign"></a></i></li>
                </div>
            </div>
            <div class="control-group">
              <label class="control-label">Apellido :</label>
              <div class="controls">
                <input type="text" class="span11" name="apellido" id="apellido" placeholder="Apellido empleado" />
                <a href="#" title="Ingrese el apellido del nuevo empleado" class="tip-right"><i class="icon-question-sign"> </a></i></li>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">DNI :</label>
              <div class="controls">
               <input type="text" class="span11" placeholder="Numero de documento empleado" name="dni" id="dni"/>
               <a href="#" title="Ingrese el Numero de Identificacion Nacional del nuevo empleado" class="tip-right"><i class="icon-question-sign"> </a></i></li>
               </div>
               </div>
            <div class="control-group">
              <label class="control-label">Telefono</label>
              <div class="controls">
                <input type="text"  class="span11" placeholder="Numero de telefono" name="tel" id="tel" />
                 <a href="#" title="Ingrese el número de telefono del nuevo empleado" class="tip-right"><i class="icon-question-sign"> </a></i></li>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Email :</label>
              <div class="controls">
                <input type="text" class="span11" name="apellido" id="email" placeholder="Nombre de email" />
                 <a href="#" title="Ingrese la direccion de email del nuevo empleado" class="tip-right"><i class="icon-question-sign"> </a></i></li>
              </div>
            </div>
           <div class="control-group">
              <label class="control-label">Rol del empleado</label>
              <div class="controls">

                <select id="rol" name="rol" >
                  <option value="CA">Camionero</option>
                  <option value="VE">Vendedor</option>
                  <option value="DE">Despachante</option>

                </select>
              </div>
              </div>
            <div class="control-group patente" id="patente_di">
              <label class="control-label">Patente :</label>
              <div class="controls">
                <input type="text" class="span11" name="apellido" id="patente" placeholder="Patente" />
              </div>
            </div>
            
            <div class="control-group">
               <label class="control-label">Turno de trabajo</label>
               <div class="controls">
                <select id="id_turno" name="rol" required>
                  <option value="1">Ma&ntilde;ana</option>
                  <option value="2">Tarde</option>
                  <option value="3">Todo el dia</option>
                  </select>
              </div>
               </div>
               
            <div class="control-group">
              <label class="control-label">Usuario</label>
              <div class="controls">
                <input type="text"  class="span11" placeholder="Nombre de usuario" name="usuario" id="usuario" />
				 <a href="#" title="El usuario lo decide el empleado" class="tip-right"><i class="icon-question-sign"> </a></i></li>              
              </div>
              </div>
              <div class="widget-content nopadding">

                <div class="control-group">
                  <label class="control-label">Contrase&ntilde;a</label>
                  <div class="controls">
                    <input type="password" id="pass_1" name="contrasena" class="form-control" placeholder="Contrase&ntilde;a" required>
            		<a href="#" title="La contrase&ntilde;a la decide el empleado" class="tip-right"><i class="icon-question-sign"> </a></i></li>
            		<label for="contrasena" style="color:red" id="msjPass_1"></label><br/>
            
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">Confirmar contrase&ntilde;a</label>
                  <div class="controls">
                   <input type="password" id="pass_2" name="contrasena2" class="form-control" placeholder="Repita la contrase&ntilde;a" required>
            <label for="contrasena2" style="color:red" id="msjPass_2"></label><br/>
                  </div>
                </div>
                <div class="form-actions">
                  <p align="right"><input type="submit" value="Alta" class="btn btn-success">
                </div>
              </form>
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
  <div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Marimon Almeida SYStem. <a href="https://www.google.com.ar/">Visit us</a> </div>
</div>
<!--end-Footer-part-->

<%-- juance's jc --%>
<script src="juance.js"></script>


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
