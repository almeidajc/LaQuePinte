   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="entidades.Empleado"%>
     <%@page import="negocio.CtrlEmpleado"%>
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
	String tipo_em = userSession.getTipo();
	/* ESTO NO FUNCIONA PORQUE NO HICIMOS LA PARTE DE USUARIO DEL ADM */ %>
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
    <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido Ryan</span></a></li>
    <li class=""><a title="" href="micuenta.jsp"><i class="icon icon-th-list"></i> <span class="text">Mi cuenta</span></a></li>
    <li class=""><a title="" href="ajustes.jsp"><i class="icon icon-cog"></i> <span class="text">Ajustes</span></a></li>
     <li class=""><a title="" href="login.jsp"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
  <ul>
<<<<<<< valen2
    <li class="active"><a href="indexADM.jsp"><i class="icon icon-th-list"></i> <span>Menu Administrador</span></a> </li>
     	
   
    <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Empleado</span> </a>
      <ul>
        <li><a href="altaUsuarioADM.jsp">Nuevo Empleado</a></li>
        <li><a href="modificarUsuarioADM.jsp">Modificar Empleado</a></li>
        <li><a href="bajaUsuarioADM.jsp">Eliminar Empleado</a></li>
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
           <input type="hidden" id="tipo_empleado" name="tipo_empleado" value="<%=tipo_em%>" >
            <div class="control-group">
              <label class="control-label">Nombre :</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="Nombre empleado" name="nombre" id="nombre"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Apellido :</label>
              <div class="controls">
                <input type="text" class="span11" name="apellido" id="apellido" placeholder="Apellido empleado" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">DNI :</label>
              <div class="controls">
               <input type="text" class="span11" placeholder="Numero de documento empleado" name="dni" id="dni"/>
               </div>
               </div>
            <div class="control-group">
              <label class="control-label">Telefono</label>
              <div class="controls">
                <input type="text"  class="span11" placeholder="Numero de telefono" name="tel" id="tel" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Email :</label>
              <div class="controls">
                <input type="text" class="span11" name="email" id="email" placeholder="Nombre de email" />
              </div>
            </div>
<<<<<<< valen2
           <div class="control-group">
              <label class="control-label">Rol del empleado</label>
              <div class="controls">
                <select id="rol" name="rol" >
                  <option value="CA">Camionero</option>
                  <option value="VE">Vendedor</option>
                  <option value="DE">Despachante</option>
                  <option value="EA">Encargado de administración</option>
                 </select>
              </div>
              </div>
              <div class="control-group patente">
              <label class="control-label">Patente :</label>
              <div class="controls">
                <input type="text" class="span11" name="patente" id="patente" placeholder="Patente" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Usuario</label>
              <div class="controls">
                <input type="text"  class="span11" placeholder="Nombre de usuario" name="usuario" id="usuario" />
              </div>
              </div>
              <div class="widget-content nopadding">

                <div class="control-group">
                  <label class="control-label">Password</label>
                  <div class="controls">
                    <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Contraseña" onchange="valida(this.value)" required>
            		<label for="contrasena" style="color:red" id="msjPass_1"></label><br/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">Confirm password</label>
                  <div class="controls">
                   <input type="password" id="pwd2" name="pwd2" class="form-control" placeholder="Repita la contraseña" onchange="valida2(this.value)" required>
            	   <label for="contrasena2" style="color:red" id="msjPass_2"></label><br/>
                  </div>
                </div>
                <div class="form-actions">
                  <input type="submit" value="Alta" class="btn btn-success">
                </div>
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
<script src="bootstrap/js_original/validarRegistro.js"></script>

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
