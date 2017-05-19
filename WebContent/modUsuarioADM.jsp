
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
     <%@page import="entidades.Empleado"%>
     <%@page import="negocio.CtrlEmpleado"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Materiales::de::Construcción</title>
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

<% int idEmp = Integer.parseInt(request.getParameter("id_empleado"));  

      CtrlEmpleado ctrl = new CtrlEmpleado();
      Empleado e= ctrl.getEmpleadoById(idEmp);
      String email= e.getEmail();
      int tel= e.getTel();
      String pass= e.getContrase�a();
      //String numeroStr = String.valueOf(h.getNumero());
      
      
       Empleado userSession = (Empleado)session.getAttribute("userSession");
	String tipo_em = userSession.getTipo();
	/* ESTO NO FUNCIONA PORQUE NO HICIMOS LA PARTE DE USUARIO DEL ADM */ %> 
	
<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Materiales de Construcción</a></h1>
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
    <li class="active"><a href="indexAdmin.jsp"><i class="icon icon-th-list"></i> <span>Menu Administrador</span></a> </li>
     	
    
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
    <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Modificar Empleado</a></div>
   
  </div>
<!--End-Action boxes-->    
   


<!--End-breadcrumbs-->

<!--Action boxes-->
<div id="titulo">
 <h1>Modificar Empleado</h1>
 </div>
  <div class="container-fluid"><hr>
   
  <div class="row-fluid">
    <div class="span6">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>Modificar datos de usuario</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="ModificarEmpleado" method="post" class="form-horizontal">
          
            
            <div class="control-group">
              <label class="control-label">Telefono</label>
              <div class="controls">

                <input type="text"  class="span11"  value="<%= tel %>" placeholder="Numero de telefono" name="tel" id="tel" onchange="validaTel(this.value)" required />
                <div id="telef"></div>

              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Email :</label>
              <div class="controls">

                <input type="text" class="span11" name="apellido"  value=" <%= email %>" id="email" placeholder="Nombre de email" onchange="validarEmail(this.value)" />
                <div id="emailText"></div>

              </div>
            </div>
           
              <div class="widget-content nopadding">
              
                <div class="control-group">
                  <label class="control-label">Password</label>
                  <div class="controls">

	                  <input type="password" id="pass_1" name="contrasena" class="form-control" value="<%= pass %>" placeholder="Contraseña"  onchange="validaPass(this.value)" required >
	                  <label for="contrasena" style="color:red" id="msjPass_1"></label><br/>

                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">Confirm password</label>
                  <div class="controls">
                   <input type="password" id="pass_2" name="contrasena2" class="form-control" placeholder="Repita la contraseña" onchange="validaPass2(this.value)" required>
           		   <label for="contrasena2" style="color:red" id="msjPass_2"></label><br/>
                  </div>
                  <% int idem=Integer.parseInt(request.getParameter("id_empleado")); %>

                  <input type="hidden" id="id_empleado" name="id_empleado" value="<%= idem %>" >
 				          <input type="hidden" id="tipo_em" name="tipo_em" value="<%=tipo_em%>" >


                </div>
                
                <div class="form-actions">
                  <input type="submit" value="Modificar" class="btn btn-success">
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
